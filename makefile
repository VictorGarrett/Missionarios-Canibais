# Name of the project
PROJECT_NAME= Missionarios-e-Canibais

# .cpp Files
CPP_SOURCE=$(wildcard ./source/*.cpp)

# .hpp Files
HPP_SOURCE=$(wildcard ./source/*.hpp)

# Object Files
OBJ=$(subst .cpp,.o,$(subst source,objects,$(CPP_SOURCE)))

# Compiler
CC=g++

# Flags for Compiler
CC_FLAGS=-c -I ./source/


# Linker Flags
LINKER_FLAGS=-Wall -Lsfml-bin/ -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio


# Compilation and linking
all: objFolder ./bin/$(PROJECT_NAME)

./bin/$(PROJECT_NAME):	$(OBJ)
				@ echo 'Bulding binary using G++ linker: $@'
				$(CC) -o $@ $^ $(LINKER_FLAGS)
				@ echo 'Finished buiding binary: $@'
				@ echo ' '

./objects/%.o: ./source/%.cpp
				@ echo 'Building target using G++ compiler: $<'
				$(CC) -o $@ $< $(CC_FLAGS)
				@ echo ' '

./objects/main.o: ./source/main.cpp $(HPP_SOURCE)
		    @ echo 'Building target using G++ compiler: $<'
		    $(CC) -o $@ $< $(CC_FLAGS)
		    @ echo ' '

objFolder:
				@ if not exist "objects" mkdir objects

clean:
		    @ rd /S /Q objects
			@ del .\bin\$(PROJECT_NAME).exe
