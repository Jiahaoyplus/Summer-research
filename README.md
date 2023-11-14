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
If successfully, You will see
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
Structure:
<img width="1165" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/015af255-84d4-4bd7-a797-7b4be5320a2b">

Work flow:
<img width="1078" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/65869559-61f8-47db-81a8-831f399ea871">

Common bugs:
<img width="1165" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/596434bf-cee4-427f-8975-b1d11b08139e">

## The Path Needed to Modify:

1. pythia_sub.sh

```Shell {.line-numbers}
cd ~/CMSSW_10_6_4_patch1/src
#cmsenv
eval `scramv1 runtime -sh`
cd ~/second_checkout/for_jiahao/HeavyIonAnalysis_dijet/TrackAnalysis/batch/
echo PWD: $PWD
../bin/PYTHIA_gen_di.exe  ./pythia_lists/list_cor_$1 0 1
```

- The first line `cd ~/CMSSW_10_6_4_patch1/src`
depends on where your "CMSSW_10_6_4_patch1/" in your lxplus

- The 4th line `cd ~/second_checkout/for_jiahao/HeavyIonAnalysis_dijet/TrackAnalysis/batch/`
depends on where you sumbit jobs. I think you don't need to modify it usually after you modify it for the first time.

- The 5th line `../bin/PYTHIA_gen_di.exe' reflects the .exe you want to submit.

## Code Explanation
### Dijet
#### Generation
<img width="1165" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/762a7d2b-043b-4583-8124-3e15ecb11e7b">

<img width="1165" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/b99cdfdf-7c80-4d74-ab34-b96c80ec5c83">

#### Analysis
For this analysis, you need to hadd all the parallel jobs in your root_out/ with:

```
hadd all.root *.root
```
Then you can exit and then scp the all.root to your local machine
> [!NOTE]
> If you scp from lxplus for the first time, before you exit, you can type in `pwd`, then copy the path of your all.root:
> ```
> [jiahaoy@lxplus772 root_out_2]$ pwd
> /afs/cern.ch/user/j/jiahaoy/second_checkout/for_jiahao/HeavyIonAnalysis_dijet/TrackAnalysis/batch/pythia_batch_output/root_out_2
> [jiahaoy@lxplus772 root_out_2]$ exit
> logout
> Connection to lxplus.cern.ch closed.
> ➜  ~ git:(main) ✗ scp jiahaoy@lxplus.cern.ch:~/second_checkout/for_jiahao/HeavyIonAnalysis_dijet/TrackAnalysis/batch/pythia_batch_output/root_out_2/all.root .
> ```
> The next time you want to scp, you can just `exit`, then `cd` to your preferred folder and type in `scp` with :arrow_up: , the pwd you use last time will be completed automatically, and you just need to modify it

You can git pull the analysis code and begin to draw your own graphs
Every time you run with the code, you can compile it with:
```
g++ analyze_code.cpp  `root-config --cflags --libs` -o excutable
```
Then run the excutable with
```
./excutable
```
Here I use g++ compiler to compile analyze_code.cpp under root environment(`root-config --cflags --libs`) and get excutable under this folder,
Then ./excutable to run.

>[!IMPORTANT] 
>Please modify the output path each time, and pay attention to the compatability with your sherpa_constants.h if necessary
##### 1D Fourier Fit:

<img width="1029" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/3cdffefc-f635-4700-8ab1-6dc9c392a309">

You will get the fourier fit result like:

<img width="598" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/935e285d-b4d8-4960-a1db-da258bcf8e59">


##### Fourier_Nch95_with_jt:
Select the last track bin, evolving with jt cut (0.0,0.3,0.5,0.7,1.0-3.0 I use, but in two files, so it is  a little redundancy)
You will get like:

<img width="598" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/fac34cdf-25e8-48fe-90bf-9ac15395fea0">

<img width="598" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/234b23eb-66c8-414c-8524-a474c8e6ad7a">


##### Fourier_component
Compare V1, V2, V3 single jet and dijet result, data and MC. Hopefully you would find something new with run3 data:

<img width="598" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/0c245754-fb6c-4dab-988d-76bfcc2f5c9c">

<img width="598" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/b84625fd-263b-42db-9bfe-21e200dff571">

<img width="598" alt="image" src="https://github.com/Jiahaoyplus/Summer-research/assets/94129946/05a8b490-48fe-4c1d-96e6-34f5de8c3f80">




























