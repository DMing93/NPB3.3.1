#!/bin/sh

#PBS -N IS_TEST //指定任务名
#PBS -o IS_TEST.log//指定标准输出
#PBS -e IS_TEST.err//指定标准出错
#PBS -q batch //指定任务队列
#PBS -l nodes=16//指定进程数

cd /home/dming/NPB3.3.1/NPB3.3-MPI/bin
echo TIME is `date`
echo DIRECTORY is $PWD
echo This job runs on following nodes:
cat $PBS_NODEFILE
NPROCS=`wc -l < $PBS_NODEFILE`
echo This job has been allocated $NPROCS nodes
mpirun -machinefile $PBS_NODEFILE -np $NPROCS ./is.A.4 //执行

