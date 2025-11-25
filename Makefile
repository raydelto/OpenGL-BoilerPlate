# Detect operating system
ifeq ($(OS),Windows_NT)
	LIBS = -L. -L./lib -lglew32 -lglfw3 -lopengl32 -lgdi32
	OUTPUT = main.exe
	CLEAN_CMD = del $(OBJ) main.*
else
	# Linux/WSL libraries - use system-installed GLFW and GLEW
	# GLFW on Linux requires X11 libraries, but pkg-config handles them automatically
	LIBS = -lGLEW -lglfw -lGL -lpthread -ldl
	OUTPUT = main
	CLEAN_CMD = rm -f $(OBJ) main
endif

INCLUDES = -I./includes

SRC = src/main.cpp

OBJ = main.o

WARNINGS=-Wall

FLAGS=-std=c++17

all:
	g++ -c $(SRC) $(INCLUDES) $(WARNINGS) $(FLAGS)
	g++ $(OBJ) $(LIBS) $(INCLUDES) -o $(OUTPUT) $(WARNINGS) $(FLAGS)

clean:
	$(CLEAN_CMD)
