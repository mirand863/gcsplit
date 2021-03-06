WORKDIR = `pwd`

CC = gcc
CXX = g++
AR = ar
LD = g++
WINDRES = windres

INC = 
CFLAGS = -Wall -fopenmp
RESINC = 
LIBDIR = 
LIB = 
LDFLAGS = -fopenmp

INC_DEBUG = $(INC) -Iinclude
CFLAGS_DEBUG = $(CFLAGS) -g -fopenmp
RESINC_DEBUG = $(RESINC)
RCFLAGS_DEBUG = $(RCFLAGS) -fopenmp
LIBDIR_DEBUG = $(LIBDIR)
LIB_DEBUG = $(LIB)
LDFLAGS_DEBUG = $(LDFLAGS) -fopenmp
OBJDIR_DEBUG = obj/Debug
DEP_DEBUG = 
OUT_DEBUG = bin/Debug/gcsplit

INC_RELEASE = $(INC) -Iinclude
CFLAGS_RELEASE = $(CFLAGS) -O2 -fopenmp
RESINC_RELEASE = $(RESINC)
RCFLAGS_RELEASE = $(RCFLAGS) -fopenmp
LIBDIR_RELEASE = $(LIBDIR)
LIB_RELEASE = $(LIB)
LDFLAGS_RELEASE = $(LDFLAGS) -s -fopenmp
OBJDIR_RELEASE = obj/Release
DEP_RELEASE = 
OUT_RELEASE = bin/Release/gcsplit

OBJ_DEBUG = $(OBJDIR_DEBUG)/main.o $(OBJDIR_DEBUG)/src/Utils.o $(OBJDIR_DEBUG)/src/TSV.o $(OBJDIR_DEBUG)/src/MetaSpades.o $(OBJDIR_DEBUG)/src/KmerStream.o $(OBJDIR_DEBUG)/src/GCSplit.o $(OBJDIR_DEBUG)/src/Fastq.o $(OBJDIR_DEBUG)/src/FastaFile.o $(OBJDIR_DEBUG)/src/Fasta.o $(OBJDIR_DEBUG)/src/Arguments.o

OBJ_RELEASE = $(OBJDIR_RELEASE)/main.o $(OBJDIR_RELEASE)/src/Utils.o $(OBJDIR_RELEASE)/src/TSV.o $(OBJDIR_RELEASE)/src/MetaSpades.o $(OBJDIR_RELEASE)/src/KmerStream.o $(OBJDIR_RELEASE)/src/GCSplit.o $(OBJDIR_RELEASE)/src/Fastq.o $(OBJDIR_RELEASE)/src/FastaFile.o $(OBJDIR_RELEASE)/src/Fasta.o $(OBJDIR_RELEASE)/src/Arguments.o

all: debug release

clean: clean_debug clean_release

before_debug: 
	test -d bin/Debug || mkdir -p bin/Debug
	test -d $(OBJDIR_DEBUG) || mkdir -p $(OBJDIR_DEBUG)
	test -d $(OBJDIR_DEBUG)/src || mkdir -p $(OBJDIR_DEBUG)/src

after_debug: 

debug: before_debug out_debug after_debug

out_debug: before_debug $(OBJ_DEBUG) $(DEP_DEBUG)
	$(LD) $(LIBDIR_DEBUG) -o $(OUT_DEBUG) $(OBJ_DEBUG)  $(LDFLAGS_DEBUG) $(LIB_DEBUG)

$(OBJDIR_DEBUG)/main.o: main.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c main.cpp -o $(OBJDIR_DEBUG)/main.o

$(OBJDIR_DEBUG)/src/Utils.o: src/Utils.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Utils.cpp -o $(OBJDIR_DEBUG)/src/Utils.o

$(OBJDIR_DEBUG)/src/TSV.o: src/TSV.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/TSV.cpp -o $(OBJDIR_DEBUG)/src/TSV.o

$(OBJDIR_DEBUG)/src/MetaSpades.o: src/MetaSpades.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/MetaSpades.cpp -o $(OBJDIR_DEBUG)/src/MetaSpades.o

$(OBJDIR_DEBUG)/src/KmerStream.o: src/KmerStream.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/KmerStream.cpp -o $(OBJDIR_DEBUG)/src/KmerStream.o

$(OBJDIR_DEBUG)/src/GCSplit.o: src/GCSplit.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/GCSplit.cpp -o $(OBJDIR_DEBUG)/src/GCSplit.o

$(OBJDIR_DEBUG)/src/Fastq.o: src/Fastq.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Fastq.cpp -o $(OBJDIR_DEBUG)/src/Fastq.o

$(OBJDIR_DEBUG)/src/FastaFile.o: src/FastaFile.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/FastaFile.cpp -o $(OBJDIR_DEBUG)/src/FastaFile.o

$(OBJDIR_DEBUG)/src/Fasta.o: src/Fasta.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Fasta.cpp -o $(OBJDIR_DEBUG)/src/Fasta.o

$(OBJDIR_DEBUG)/src/Arguments.o: src/Arguments.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Arguments.cpp -o $(OBJDIR_DEBUG)/src/Arguments.o

clean_debug: 
	rm -f $(OBJ_DEBUG) $(OUT_DEBUG)
	rm -rf bin/Debug
	rm -rf $(OBJDIR_DEBUG)
	rm -rf $(OBJDIR_DEBUG)/src

before_release: 
	test -d bin/Release || mkdir -p bin/Release
	test -d $(OBJDIR_RELEASE) || mkdir -p $(OBJDIR_RELEASE)
	test -d $(OBJDIR_RELEASE)/src || mkdir -p $(OBJDIR_RELEASE)/src

after_release: 

release: before_release out_release after_release

out_release: before_release $(OBJ_RELEASE) $(DEP_RELEASE)
	$(LD) $(LIBDIR_RELEASE) -o $(OUT_RELEASE) $(OBJ_RELEASE)  $(LDFLAGS_RELEASE) $(LIB_RELEASE)

$(OBJDIR_RELEASE)/main.o: main.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c main.cpp -o $(OBJDIR_RELEASE)/main.o

$(OBJDIR_RELEASE)/src/Utils.o: src/Utils.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Utils.cpp -o $(OBJDIR_RELEASE)/src/Utils.o

$(OBJDIR_RELEASE)/src/TSV.o: src/TSV.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/TSV.cpp -o $(OBJDIR_RELEASE)/src/TSV.o

$(OBJDIR_RELEASE)/src/MetaSpades.o: src/MetaSpades.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/MetaSpades.cpp -o $(OBJDIR_RELEASE)/src/MetaSpades.o

$(OBJDIR_RELEASE)/src/KmerStream.o: src/KmerStream.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/KmerStream.cpp -o $(OBJDIR_RELEASE)/src/KmerStream.o

$(OBJDIR_RELEASE)/src/GCSplit.o: src/GCSplit.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/GCSplit.cpp -o $(OBJDIR_RELEASE)/src/GCSplit.o

$(OBJDIR_RELEASE)/src/Fastq.o: src/Fastq.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Fastq.cpp -o $(OBJDIR_RELEASE)/src/Fastq.o

$(OBJDIR_RELEASE)/src/FastaFile.o: src/FastaFile.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/FastaFile.cpp -o $(OBJDIR_RELEASE)/src/FastaFile.o

$(OBJDIR_RELEASE)/src/Fasta.o: src/Fasta.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Fasta.cpp -o $(OBJDIR_RELEASE)/src/Fasta.o

$(OBJDIR_RELEASE)/src/Arguments.o: src/Arguments.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Arguments.cpp -o $(OBJDIR_RELEASE)/src/Arguments.o

clean_release: 
	rm -f $(OBJ_RELEASE) $(OUT_RELEASE)
	rm -rf bin/Release
	rm -rf $(OBJDIR_RELEASE)
	rm -rf $(OBJDIR_RELEASE)/src

.PHONY: before_debug after_debug clean_debug before_release after_release clean_release

