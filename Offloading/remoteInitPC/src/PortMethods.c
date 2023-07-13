#include "DataTransmission.h"

//Many methods in the file were gotten from the code here: https://www.pololu.com/docs/0J73/15.5. This
//is noted in the description of these methods 

/**
 * @brief Opens the specified serial port, sets it up for binary communication,
 * configures its read timeouts, and sets its baud rate. 
 * 
 * @param device The address of the device file 
 * @param baud_rate 
 * @return Returns a non-negative file descriptor on success, or -1 on failure. 
 * @cite https://www.pololu.com/docs/0J73/15.5  
 */

int open_serial_port(const char * device, uint32_t baud_rate)
{

  //Open the conection as read and write, and prevent the file being opened as a controlling 
  //terminal
  int fd = open(device, O_RDWR | O_NOCTTY);
  if (fd == -1)
  {
    perror(device);
    return -1;
  }
 
  // Flush away any bytes previously read or written.
  int result = tcflush(fd, TCIOFLUSH);
  if (result)
  {
    perror("tcflush failed");  // just a warning, not a fatal error
  }
 
  // Get the current configuration of the serial port.
  struct termios options;
  result = tcgetattr(fd, &options);
  if (result)
  {
    perror("tcgetattr failed");
    close(fd);
    return -1;
  }

  // Turn off any options that might interfere with our ability to send and
  // receive raw binary bytes.
  options.c_iflag &= ~(INLCR | IGNCR | ICRNL | IXON | IXOFF);
  options.c_oflag &= ~(ONLCR | OCRNL);
  options.c_lflag &= ~(ECHO | ECHONL | ICANON | ISIG | IEXTEN);
 
  // Set up timeouts: Calls to read() will return as soon as there is
  // at least one byte available or when 100 ms has passed.
  options.c_cc[VTIME] = 1;
  options.c_cc[VMIN] = 0;
 
  // This code only supports certain standard baud rates. Supporting
  // non-standard baud rates should be possible but takes more work.
  switch (baud_rate)
  {
  case 4800:   cfsetospeed(&options, B4800);   break;
  case 9600:   cfsetospeed(&options, B9600);   break;
  case 19200:  cfsetospeed(&options, B19200);  break;
  case 38400:  cfsetospeed(&options, B38400);  break;
  case 115200: cfsetospeed(&options, B115200); break;
  default:
    fprintf(stderr, "warning: baud rate %u is not supported, using 9600.\n",
      baud_rate);
    cfsetospeed(&options, B9600);
    break;
  }
  cfsetispeed(&options, cfgetospeed(&options));
 
  result = tcsetattr(fd, TCSANOW, &options);
  if (result)
  {
    perror("tcsetattr failed");
    close(fd);
    return -1;
  }

  return fd;
}

/**
 * @brief Writes bytes to the serial port, returning 0 on success and -1 on failure.
 * 
 * @param fd file descriptor for the serial port/device
 * @param buffer char* of length @param size 
 * @param size the length of the array @param buffer
 * @return int, 0 on sucess, -1 on failure
 * @cite https://www.pololu.com/docs/0J73/15.5  
 */
int write_port(int fd, uint8_t * buffer, size_t size)
{
  ssize_t result = write(fd, buffer, size);
  if (result != (ssize_t)size)
  {
    perror("failed to write to port");
    return -1;
  }
  return 0;
}

/**
 * @brief Reads bytes from the serial port. Returns after all the desired bytes have been read, or if there is a
 * timeout or other error. Returns the number of bytes successfully read into the buffer, or -1 if there was an
 * error reading.
 * 
 * @param fd file descriptor for the device file of the board
 * @param buffer char* with length "size" to store the read info
 * @param size size of "buffer"
 * @return ssize_t: num bytes read into the buffer
 * @cite https://www.pololu.com/docs/0J73/15.5  
 */
ssize_t read_port(int fd, uint8_t * buffer, size_t size)
{
  size_t received = 0;
  while (received < size)
  {
    ssize_t r = read(fd, buffer + received, size - received);
    if (r < 0)
    {
      perror("failed to read from port");
      return -1;
    }
    if (r == 0)
    {
      // Timeout
      break;
    }
    received += r;
  }
  return received;
}

/**
 * @brief This method opens the connection to the device file specified in "device" and configures it to
 *        accept data over UART at "baudRate". It also initializes the pre-defined comms packets.
 * @param device string holding the path to the device file that is to be opened 
 * @param baudRate a unint32_t holding the baud rate specified for the connection. 
 * @return the file descriptor for the open connection on sucess, -1 on failure. 
 */
int commsInit(const char* device, uint32_t baudRate)
{
    int fd  = open_serial_port(device, baudRate); //open the connection
    if (fd < 0)
    {
        fprintf(stderr, "Failed to open serial port to device %s and baud rate: %d\n", device, baudRate);
        return -1;
    }
    commsPacketInit(); //initialize the comms packets
    return fd;
}
