#!/bin/sh

#source /cvmfs/cms.cern.ch/cmsset_default.sh
#export SCRAM_ARCH=slc7_amd64_gcc700
cd ~/CMSSW_10_6_4_patch1/src


#cmsenv

eval `scramv1 runtime -sh`
cd ~/second_checkout/for_jiahao/HeavyIonAnalysis_dijet/TrackAnalysis/batch/
echo PWD: $PWD
../bin/PYTHIA_gen_di_2.exe  ./all_data_list/list_cor_$1 0 1
