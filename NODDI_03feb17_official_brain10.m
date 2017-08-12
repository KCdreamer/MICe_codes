%all done within matlab command window
%change the names if needed
addpath(genpath('/hpf/largeprojects/MICe/kchu/fid/23sep16.fid_20160923T153932/niftimatlib/niftimatlib-1.2/matlab'))
addpath(genpath('/hpf/largeprojects/MICe/kchu/fid/23sep16.fid_20160923T153932/NODDI_tool'))

protocol = FSL2Protocol('official_bvals', 'official_bvecs');
noddi = MakeModel('WatsonSHStickTortIsoVIsoDot_B0');

fsl = strcat('/hpf/largeprojects/MICe/kchu/fid/03feb17.fid/03feb17.fid_official/DW_Recon.10_FSL.nii')
mask = strcat('/hpf/largeprojects/MICe/kchu/fid/03feb17.fid/03feb17.fid_official/DW_Recon.10_highb_mask.morph.nii')
mat_out = strcat('NODDI_03feb17_official_brain10.mat')
CreateROI(fsl, mask, mat_out);

fitpar = strcat('FittedParams_03feb17_official_brain10.mat')
brain_mask = strcat('/hpf/largeprojects/MICe/kchu/fid/03feb17.fid/03feb17.fid_official/DW_Recon.10_highb_mask.morph.nii')
output = strcat('NODDI_03feb17_official_brain10')
batch_fitting(mat_out, protocol, noddi, fitpar);
SaveParamsAsNIfTI(fitpar, mat_out, brain_mask, output)
