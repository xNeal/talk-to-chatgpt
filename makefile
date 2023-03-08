ifndef UNAME_S
UNAME_S := $(shell uname -s)
endif

ifndef UNAME_P
UNAME_P := $(shell uname -p)
endif

ifndef UNAME_M
UNAME_M := $(shell uname -m)
endif

CCV := $(shell $(CC) --version | head -n 1)
CXXV := $(shell $(CXX) --version | head -n 1)

ifeq ($(UNAME_S),Darwin)
	CFLAGS   += -pthread
	CXXFLAGS += -pthread
endif

#
# Compile flags
#

CFLAGS   = -O3 -std=c11   -fPIC
CXXFLAGS = -O3 -std=c++11 -fPIC


ifndef WHISPER_NO_ACCELERATE
	# Mac M1 - include Accelerate framework
	ifeq ($(UNAME_S),Darwin)
		CFLAGS  += -DGGML_USE_ACCELERATE
		LDFLAGS += -framework Accelerate
	endif
endif




$(info I whisper.cpp build info: )
$(info I UNAME_S:  $(UNAME_S))
$(info I UNAME_P:  $(UNAME_P))
$(info I UNAME_M:  $(UNAME_M))
$(info I CFLAGS:   $(CFLAGS))
$(info I CXXFLAGS: $(CXXFLAGS))
$(info I LDFLAGS:  $(LDFLAGS))
$(info I CC:       $(CCV))
$(info I CXX:      $(CXXV))
$(info )



ggml.o: ./include/ggml.c ./include/ggml.h
	$(CC)  $(CFLAGS)   -c ./include/ggml.c -o ./include/ggml.o

whisper.o: ./include/whisper.cpp ./include/whisper.h
	$(CXX) $(CXXFLAGS) -c ./include/whisper.cpp -o ./include/whisper.o


clean:
	rm -f *.o main stream command talk test libwhisper.a libwhisper.so

#
# Examples
#

CC_SDL=`sdl2-config --cflags --libs`


stream: ./stream.cpp ggml.o whisper.o
	$(CXX) $(CXXFLAGS) stream.cpp ./include/ggml.o ./include/whisper.o -o stream $(CC_SDL) $(LDFLAGS) -lcurl

test: ./test.cpp ggml.o whisper.o
	$(CXX) $(CXXFLAGS) test.cpp ./include/ggml.o ./include/whisper.o -o test $(LDFLAGS)


