/**
 * @file main.c
 * @author Sam Detor (sam.detor@yale.edu)
 * @brief  This file has the code that sets up the serial port, waits for the receiver ping, then sends 
 *         the code store in OffloadingFramework/remoteInitPC/bin/InitCode.bin over bluetooth to the reciever.
 * @version 0.1
 * @date 2023-08-04
 * 
 * @copyright Copyright (c) 2023
 * 
 */
#include "main.h"

//function declarations
int sendDataAfterPing(int fd, uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms);

//waits for the ping from the board and then sends the code
int main(void) {

    //variable defs
    int fd;
    int ret;
    uint8_t buffer[MAX_PACKET_SIZE];
    
    //Initializing Comms
    fd = commsInit(DEVICE_FILE, BAUD_RATE);

    //sending code in OffloadingFramework/remoteInitPC/bin/InitCode.bin after device ping
    ret = sendDataAfterPing(fd, buffer, COMMS_TIMEOUT);
    close(fd);

    return ret;
}

/**
 * @brief Sends the code store in OffloadingFramework/remoteInitPC/bin/InitCode.bin after device ping
 *        to the port pointed to by the file descriptor "fd". The code for reading the InitCode.bin file 
 *        into memory was gotten from here:
 *        https://stackoverflow.com/questions/22059189/read-a-file-as-byte-array
 * 
 * @param fd file descriptor for the device file of the bluetooth module 
 * @return 0 on sucess, other on failure (see the error codes defined in main.h for more details)  
 */
int sendCode(int fd)
{
    //Variables definitions
    FILE *fileptr;
    uint8_t *buffer;
    long filelen;
    struct timeval timeStart;
    struct timeval timeNow;

    /*                           Read the file into memory
     code from here: https://stackoverflow.com/questions/22059189/read-a-file-as-byte-array */
                                                                                             
    fileptr = fopen("bin/InitCode.bin", "rb");  // Open the file in binary mode                            
    fseek(fileptr, 0, SEEK_END);                // Jump to the end of the file                             
    filelen = ftell(fileptr);                   // Get the current byte offset in the file                             
    rewind(fileptr);                            // Jump back to the beginning of the file                  
    //                                                                                                     
    buffer = (uint8_t*) malloc(filelen * sizeof(char)); // Enough memory for the file                      
    fread(buffer, filelen, 1, fileptr);                // Read in the entire file                          
    fclose(fileptr);                                   // Close the file                                   
    printf("File size: %ld\n", filelen);               // Print file size                                  
    
    /****************************************************************************************/                                                                                                 

    //Get start time of sending process
    gettimeofday(&timeStart, NULL);

    //send the data from InitCode.bin
    int ret = send(buffer, COMMS_TIMEOUT, filelen, fd);

    //record the end time of sending process
    gettimeofday(&timeNow, NULL);
    
    if (ret == 0) //if data was sent well
    {
        //calculate the sending time
        double time = getTimeDiff_ms(timeStart, timeNow) / 1000;
        
        //Report sending time
        printf("Sent Well\n");
        printf("Time: %f\n", time);
    }

    //free resources
    free(buffer);

    return ret;
}

/**
 * @brief Waits for the board's ping via the bluetooth module. Once it receives the ping, it sends the offloaded code in InitCode.bin
 *        by calling SendCode, implemented above 
 * 
 * @param fd file descriptor for the device file of the bluetooth module 
 * @param buffer uint8_t array of MAX_PACKET_SIZE to store the received ping in 
 * @param timeout_ms how long the method should wait before timing out, in miliseconds 
 * @return 0 on sucess, other on failure (see the error codes defined in main.h for more details)
 */
int sendDataAfterPing(int fd, uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms)
{
    //Variable definitions
    int ret;
    int error_counter = 0;

    //Wait for the board's ping
    while(1)
    {
        printf("Waiting...\n");
        ret = receivePing(buffer,COMMS_TIMEOUT,fd); //attempt to receive the board's ping
        if (ret == 0)
        {
            //if got the ping, stop waiting
            printf("Got ping, sending code...\n");
            break;
        }
        else if (ret != TIMEOUT)
        {
            //if receivePing failed for a reason other than a timeout
            printf("Something went wrong, receivePing returned with %d\n", ret);
            if (error_counter >= 2) //if receivePing has already failed twice, exit
            {
                return ret;
            }
            error_counter++;

        }
    }

    //send the code
    ret = sendCode(fd);

    return ret;
}
