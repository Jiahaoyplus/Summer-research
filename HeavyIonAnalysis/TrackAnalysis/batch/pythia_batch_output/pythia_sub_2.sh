#!/bin/sh

#source /cvmfs/cms.cern.ch/cmsset_default.sh
#export SCRAM_ARCH=slc7_amd64_gcc700
cd ~/CMSSW_10_6_4_patch1/src


#cmsenv

eval `scramv1 runtime -sh`
cd ~/try/for_jiahao_local/HeavyIonAnalysis/TrackAnalysis/batch/
echo PWD: $PWD
../bin/PYTHIA_gen_2.exe  ./pythia_lists/list_cor_$1 0 1
