CXX=g++#arm-linux-gnueabi-g++

INCLUDES=#-I/usr/arm-linux-gnueabi/include/c++/4.6.3

CPPFLAGS=-D__GXX_EXPERIMENTAL_CXX0X__ -D__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 -D__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 -D__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 -D__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8

CXXFLAGS=-std=c++0x -O0 -g3 -Wall -c -fmessage-length=0 -pthread $(CPPFLAGS) $(INCLUDES)

LDFLAGS=-lpthread

LDLIBS=#-L/usr/arm-linux-gnueabi/lib

RM=rm -f

F = BlackLib

SOURCES2= led_test.cpp
SOURCES=$(F) ./$(F)/BlackADC/BlackADC.cpp ./$(F)/BlackDirectory/BlackDirectory.cpp  ./$(F)/BlackGPIO/BlackGPIO.cpp ./$(F)/BlackI2C/BlackI2C.cpp ./$(F)/BlackMutex/BlackMutex.cpp ./$(F)/BlackPWM/BlackPWM.cpp ./$(F)/BlackSPI/BlackSPI.cpp ./$(F)/BlackThread/BlackThread.cpp ./$(F)/BlackTime/BlackTime.cpp  ./$(F)/BlackUART/BlackUART.cpp ./$(F)/BlackCore.cpp

OBJECTS=$(SOURCES:.cpp=.o)

EXECUTABLE=BlackLib-executable


all: $(SOURCES) $(EXECUTABLE)
    
$(EXECUTABLE): $(OBJECTS) 
	$(CXX) $(LDLIBS) $(OBJECTS) $(LDFLAGS) -o $@

.cpp.o:
	$(CXX) $(CXXFLAGS) $< -o $@

clean:
	$(RM) $(OBJECTS)

