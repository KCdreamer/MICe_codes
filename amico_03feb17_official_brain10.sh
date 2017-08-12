#!/bin/bash

#$ -V -cwd -S /bin/bash

#export PATH=/axiom2/projects/software/arch/linux-precise/src/openjdk-with-jfx/OBF_DROP_DIR/openjdk8/j2sdk-image/bin:$PATH

cd /hpf/largeprojects/MICe/kchu/fid/03feb17.fid/03feb17.fid_official

matlab -nodesktop -nodisplay -r "run /hpf/largeprojects/MICe/kchu/fid/03feb17.fid/03feb17.fid_official/amico_03feb17_official_brain10.m"
