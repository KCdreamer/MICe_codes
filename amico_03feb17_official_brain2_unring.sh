#!/bin/bash

#$ -V -cwd -S /bin/bash

#export PATH=/axiom2/projects/software/arch/linux-precise/src/openjdk-with-jfx/OBF_DROP_DIR/openjdk8/j2sdk-image/bin:$PATH

cd /hpf/largeprojects/MICe/kchu/fid/03feb17.fid/03feb17.fid_official

fsl5.0-fslsplit DW_Recon.2_FSL_denoised.nii DW_Recon.2_FSL_denoised -t;

for i in {0..9}; do mv DW_Recon.2_FSL_denoised000${i}.nii.gz DW_Recon.2_FSL_denoised${i}.nii.gz; done;
for i in {10..99}; do mv DW_Recon.2_FSL_denoised00${i}.nii.gz DW_Recon.2_FSL_denoised${i}.nii.gz; done;
for i in {100..124}; do mv DW_Recon.2_FSL_denoised0${i}.nii.gz DW_Recon.2_FSL_denoised${i}.nii.gz; done;

gunzip DW_Recon.2_FSL_denoised{0..124}.nii.gz;

matlab -nodesktop -nodisplay -r "run /hpf/largeprojects/MICe/kchu/fid/03feb17.fid/03feb17.fid_official/unring_kchu_brain2.m";

fslmerge -t DW_Recon.2_FSL_denoised_unringed.nii DW_Recon.2_FSL_denoised{0..124}_unringed.nii;

gunzip DW_Recon.2_FSL_denoised_unringed.nii.gz;

matlab -nodesktop -nodisplay -r "run /hpf/largeprojects/MICe/kchu/fid/03feb17.fid/03feb17.fid_official/amico_03feb17_official_brain2_unring.m"

rm DW_Recon.2_FSL_denoised{0..124}_unringed.nii;
rm DW_Recon.2_FSL_denoised{0..124}.nii;
