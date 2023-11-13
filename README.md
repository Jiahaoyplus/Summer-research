# Summer-research
The research mainly focuses on Fourier components in dijet system, the off-diagonal and cumulant analysis in single jet system

## Make It Run Anyway

1. Login your lxplus account

2. Make sure "CMSSW_10_6_4_patch1" is under you home folder

   - To check it, you can type in "ls" command:
   <img width="548" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/c2ce98ce-054d-4c1c-a741-8c183ee52905">
3. Then input this command:
   ```Linux
   cd CMSSW_10_6_4_patch1/src
   cmsenv
   ```
If successful, You will see
```Linux
[jiahaoy@lxplus707 src]$ cmsenv
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
	LANGUAGE = (unset),
	LC_ALL = (unset),
	LC_CTYPE = "UTF-8",
	LANG = "C"
    are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").
[jiahaoy@lxplus707 src]$
```

4. Then go to ~/second_checkout/for_jiahao/HeavyIonAnalysis_dijet/TrackAnalysis/ folder:
```
cd ~/second_checkout/for_jiahao/HeavyIonAnalysis_dijet/TrackAnalysis/
```

5. Try to input `make clean`, `make` You may see lots of warning. Don't worry. We just want to make it run and warning don't affect anything.
> [!NOTE]
> You can check if files you want to complie are in the **Makefile**

6. Then you can sumbit your jobs under batch folder:
```
cd batch
python pythia_condor_2.py //Please note if PYTHIA_gen_di_2.C is your intended one
```

  - You can check the process by inputting `condor_q`:
  - You will get:
 ```
-- Schedd: bigbird27.cern.ch : <188.185.16.120:9618?... @ 11/13/23 22:24:31
OWNER   BATCH_NAME     SUBMITTED   DONE   RUN    IDLE  TOTAL JOB_IDS
jiahaoy ID: 1919545  11/13 20:58      _      _      19    19 1919545.0-18
Total for query: 19 jobs; 0 completed, 0 removed, 19 idle, 0 running, 0 held, 0 suspended
Total for jiahaoy: 19 jobs; 0 completed, 0 removed, 19 idle, 0 running, 0 held, 0 suspended
Total for all users: 12926 jobs; 2180 completed, 2813 removed, 7246 idle, 111 running, 576 held, 0 suspended
 ```
   

7. When your jobs have all done, you can go to batch/pythia_batch_output/root_out_2 to check your .root files

If everything goes well, you will get 19 .root files.:
```
[jiahaoy@lxplus753 root_out_2]$ ls
dijob_000.root  dijob_004.root  dijob_008.root  dijob_012.root  dijob_016.root
dijob_001.root  dijob_005.root  dijob_009.root  dijob_013.root  dijob_017.root
dijob_002.root  dijob_006.root  dijob_010.root  dijob_014.root  dijob_018.root
dijob_003.root  dijob_007.root  dijob_011.root  dijob_015.root
```
Congratulations! You can run the code by yourself already!

## Overview of Workflow of Our Analysis:
Generate:
<img width="1204" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/f219b407-2872-4ae8-8e0a-9126eaf89090">














