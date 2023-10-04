import math
import subprocess
name = "pythia_batch_data_output_2.jdl"
f = open(name, "w")

command_lines = '''Universe   = vanilla
GetEnv     = True
Executable = pythia_batch_data_output/pythia_sub_2.sh
Arguments  = 000
Log        = pythia_batch_data_output/log_2/submit_v0.$(Process).log
Output     = pythia_batch_data_output/out_2/submit_v0.$(Process).out
Error      = pythia_batch_data_output/err_2/submit_v0.$(Process).err
+MaxRuntime =60000
Queue
'''
for i in range(1,80):
   temp = '''
Arguments  = %03d
Queue
   ''' % i
   command_lines += temp

f.write(command_lines)
f.close()
subprocess.call(["condor_submit", name]);
