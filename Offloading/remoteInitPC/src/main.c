#include "main.h"

#define SEND_TIMEOUT 40000

//function declarations
sendDataAfterPing(const char* file, int fd, uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms);

//waits for the ping from the board and then sends the code
int main(void) {

    //variable defs
    int fd;
    int ret;
    uint8_t buffer[MAX_PACKET_SIZE];
    struct termios options;
    
    //Initializing Comms
    fd = commsInit(DEVICE_FILE, BAUD_RATE);
    ret = tcgetattr(fd, &options);
    printf("c_ispeed: %d,c_ospeed: %d\n",options.c_ispeed, options.c_ospeed);
    printf("fd: %d\n", fd);

    //sending code on device ping
    ret = sendDataAfterPing(BIN_FILE, fd, buffer, COMMS_TIMEOUT);
    close(fd);
    // const char* string = "Hello World\0";
    // ret = write_port(fd, (uint8_t *) string, 12);
    // char newString[12];
    // while(1)
    // {
    //     ret = read_port(fd,(uint8_t*) newString, 12); 
    //     if (ret == 12)
    //     {
    //         printf("Response: %s\n", newString);
    //         ret = close(fd);
    //         if (ret != 0)
    //         {
    //             printf("Ret: %d", ret);
    //         }
    //         return 0;
    //     }
    // }

    return ret;
}

int sendCode(const char* file, int fd)
{
    //from: https://stackoverflow.com/questions/22059189/read-a-file-as-byte-array
    FILE *fileptr;
    uint8_t *buffer;
    long filelen;
    struct timeval timeStart;
    struct timeval timeNow;

    fileptr = fopen(file, "rb");  // Open the file in binary mode
    fseek(fileptr, 0, SEEK_END);          // Jump to the end of the file
    filelen = ftell(fileptr);             // Get the current byte offset in the file
    rewind(fileptr);                      // Jump back to the beginning of the file

    buffer = (uint8_t*)malloc(filelen * sizeof(char)); // Enough memory for the file
    fread(buffer, filelen, 1, fileptr); // Read in the entire file
    fclose(fileptr); // Close the file
    printf("File size: %ld\n", filelen);
    
    //send the file
   
    //get start time
    gettimeofday(&timeStart, NULL);
    int ret = send(buffer, SEND_TIMEOUT, filelen, fd);
    gettimeofday(&timeNow, NULL);
    if (ret == 0)
    {
        double time = getTimeDiff_ms(timeStart, timeNow) / 1000;
        printf("sent well\n");
        printf("Time: %f\n", time);
    }
    free(buffer);
    return ret;
}

sendDataAfterPing(const char* file, int fd, uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms)
{
    int ret;
    int error_counter = 0;
    while(1)
    {
        ret = recievePing(buffer,1000,fd);
        if (ret == 0)
        {
            printf("Got ping, sending code...\n");
            break;
        }
        else if (ret != TIMEOUT)
        {
            printf("Something went wrong, recievePing returned with %d\n", ret);
            if (error_counter >= 2)
            {
                return ret;
            }
            error_counter++;

        }
    }
    ret = sendCode(file, fd);
    return ret;
}