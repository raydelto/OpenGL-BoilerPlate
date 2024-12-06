LIBS = -L. \
	   -L./lib \
      -lglew32\
	  -lglfw3 \
	  -lopengl32 \
	  -lgdi32

# Adding macOS support
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)

LIBS= -L/opt/homebrew/opt/glfw/lib \
	  -lglfw

INCLUDES=-I./include \
		-I/opt/homebrew/opt/glfw/include \
		-I/usr/local/include

endif

INCLUDES = -I./includes

SRC = src/stb_image.cpp 

ifeq ($(UNAME_S),Darwin)
	SRC += src/glad.c 
endif

SRC += src/main.cpp


OBJ = stb_image.o

ifeq ($(UNAME_S),Darwin)
	OBJ += glad.o 
endif

OBJ += main.o

WARNINGS=-w

FLAGS=-std=c++17

all:
	g++ -c $(SRC) $(INCLUDES) $(WARNINGS) $(FLAGS)
	g++ $(OBJ) $(LIBS) $(INCLUDES) -o main $(WARNINGS) $(FLAGS)

clean:
	rm *.o main
