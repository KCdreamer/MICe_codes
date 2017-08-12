%clearvars, clearvars -global, clc

addpath(genpath('/hpf/largeprojects/MICe/kchu/fid/23sep16.fid_20160923T153932/AMICO_tool/matlab')) %it is ok to leave the amico tool files in this directory
addpath(genpath('/hpf/largeprojects/MICe/kchu/unring_gibbs')) %Gibbs ringing directory
CONFIG.OUTPUT_path = '/hpf/largeprojects/MICe/kchu/fid/03feb17.fid/03feb17.fid_official/';

AMICO_Setup

for i = 0:124
    fprintf( '\t* Loading DWI for dir' );
    fprintf('%i\n', i);
    niiSIGNAL = load_untouch_nii( strcat('/hpf/largeprojects/MICe/kchu/fid/03feb17.fid/03feb17.fid_official/DW_Recon.10_FSL_denoised', num2str(i), '.nii') ); %input Nifti
    niiSIGNAL.img = single(niiSIGNAL.img);
    niiSIGNAL.img = reshape(niiSIGNAL.img,niiSIGNAL.hdr.dime.dim(2:5));
    
    fprintf( '\t* Unringing for dir' );
    fprintf('%i\n', i);
    outSIGNAL.img = unring(niiSIGNAL.img); %unringing
    
    %In order to save outSIGNAL, have to fix some of its features first
    outSIGNAL.hdr = niiSIGNAL.hdr;
    outSIGNAL.untouch = 1;
    save_untouch_nii(outSIGNAL, fullfile(CONFIG.OUTPUT_path, strcat('DW_Recon.10_FSL_denoised',num2str(i),'_unringed.nii'))); %output Nifti
end
