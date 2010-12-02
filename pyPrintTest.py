import serial # if you have not already done so
import time
ser = serial.Serial('/dev/ttyUSB1', 9600)
time.sleep(2)
ser.write('Goodnight Moon!')
#this goes to the printer but only the first letter is printed over and over
