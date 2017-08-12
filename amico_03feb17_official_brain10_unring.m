%clearvars, clearvars -global, clc

addpath(genpath('/hpf/largeprojects/MICe/kchu/fid/23sep16.fid_20160923T153932/AMICO_tool/matlab')) %it is ok to leave the amico tool files in this directory

AMICO_Setup

AMICO_PrecomputeRotationMatrices();
AMICO_SetSubject( '', '' );
CONFIG.dwiFilename = 'DW_Recon.10_FSL_denoised_unringed.nii';
CONFIG.maskFilename = 'DW_Recon.10_highb_mask.morph.nii';
CONFIG.schemeFilename = '03feb17_official.scheme';
CONFIG.b0_thr = 0;

AMICO_LoadData

% Setup AMICO to use the 'NODDI' model
AMICO_SetModel( 'NODDI_EXVIVO_KCHU' );

CONFIG.OUTPUT_path = 'AMICO_results_official_denoised_brain10_unringed';

% Generate the kernels corresponding to the protocol
AMICO_GenerateKernels( false );

% Resample the kernels to match the specific subject's scheme
AMICO_ResampleKernels();

AMICO_Fit();
