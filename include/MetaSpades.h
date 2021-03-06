#ifndef METASPADES_H
#define METASPADES_H

#include <iostream>
#include <sstream>
#include <vector>
#include <cstdlib>
#include "Arguments.h"
#include "Utils.h"

using namespace std;

#include "FastaFile.h"

class MetaSpades {
    private:
        string forward;
        string reverse;
        string single;
        bool ionTorrent;
        int memoryLimit;
        bool onlyAssembler;
        bool wholeDataset;
        int threads;
        int partitions;
        vector<int> kmers;
        string gcsplitInput;
        string metaspadesInput;
        string outputdir;
        Utils utils;
        string outputFile;
        vector<FastaFile> slices;
        void assembleSlices();
        void mergeAssemblies();
        void mergeAssembliesWithWholeDataset();
    public:
        MetaSpades(Arguments &arguments);
        void run();
};

#endif // METASPADES_H
