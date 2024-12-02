LIBS = -L. \
	   -L./lib \
      -lglew32\
	  -lglfw3 \
	  -lopengl32 \
	  -lgdi32

INCLUDES = -I./includes

SRC = src/ShaderProgram.cpp \
	  src/Texture2D.cpp \
	  src/main.cpp

OBJ = ShaderProgram.o \
	  Texture2D.o \
	  main.o

WARNINGS=-w

FLAGS=-std=c++17

all:
	g++ -c $(SRC) $(INCLUDES) $(WARNINGS) $(FLAGS)
	g++ $(OBJ) $(LIBS) $(INCLUDES) -o main.exe $(WARNINGS) $(FLAGS)
