#!/bin/bash

#$ -V -cwd -S /bin/bash
cd /hpf/largeprojects/MICe/kchu/fid/03feb17.fid/03feb17.fid_official;
export PATH=/axiom2/projects/software/arch/linux-precise/src/openjdk-with-jfx/OBF_DROP_DIR/openjdk8/j2sdk-image/bin:$PATH;
matlab2010b -nodesktop -nodisplay -r "run /hpf/largeprojects/MICe/kchu/fid/03feb17.fid/03feb17.fid_official/NODDI_03feb17_official_brain10.m"
