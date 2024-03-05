% Haroon Popal
% 03/24/2023
% MATLAB R2019b
%% Set-up
%{
Prior to running this script, run the "SUIT cerebellum toolbox" section of 
code in the analyses.sh script in code subdirectory. This bit of code will 
create T1s and suit directories in the appropriate places for the rest of 
this script.
%}

%% Add paths
addpath('/usr/local/spm12')

spm


bids_dir = '/data/projects/social_doors/';
suit_dir = strcat(bids_dir, 'derivatives/suit/');



%% Set variables

subj_list={'sub-010','sub-013','sub-028','sub-036','sub-3845', ...
           'sub-3846','sub-3848','sub-3849','sub-3852','sub-3855', ...
           'sub-3864','sub-3865','sub-3874','sub-3880','sub-3882', ...
           'sub-3883','sub-3886','sub-3887','sub-3889','sub-3890', ...
           'sub-3891','sub-3892','sub-3893','sub-3895','sub-3910', ...
           'sub-3912','sub-3920','sub-3967','sub-3989','sub-3992', ...
           'sub-4011','sub-4017','sub-4018','sub-4019','sub-4020', ...
           'sub-5049','sub-5051','sub-5054','sub-5058', ...
           'sub-5064','sub-5067','sub-5068','sub-5082','sub-5083', ...
           'sub-5084','sub-5085','sub-5090','sub-5091','sub-5092', ...
           'sub-5093','sub-5094','sub-5095','sub-5098','sub-5102', ...
           'sub-5108','sub-5125','sub-5126','sub-5130','sub-5131', ...
           'sub-5133','sub-5136','sub-5140','sub-5145','sub-6003', ...
           'sub-6004','sub-6005','sub-6006'};
%subj_list = char(subj_list);

tasks = {'mdoors','social'};
%conditions = {'all_winVlos','positive_winVlos'};
conditions = {'positive_run-1','positive_win_run-1','positive_loss_run-1',...
              'negative_run-1','negative_win_run-1','negative_loss_run-1',...
              'positive_run-2','positive_win_run-2','positive_loss_run-2',...
              'negative_run-2','negative_win_run-2','negative_loss_run-2'};

%% For loop
for i = 1:length(subj_list)
    subj = subj_list{i};
    % Isolate cerebellum and brainstem

    % Set paths and file prefix
    suit_dir = strcat(bids_dir, 'derivatives/social_doors-nilearn-indiv_runs/',subj,'/suit/');
    
    cd(suit_dir);

    subj_t1_prefix = strcat(subj,'_run-1_space-MNI152NLin2009cAsym');


    % Isolate cerebellum and brainstem
    if isfile(strcat(suit_dir,'c_',subj_t1_prefix,'_desc-preproc_T1w_pcereb.nii'))    
        %print(strcat(subj, ' suit_isolate_seg already done'))
    else
        suit_isolate_seg({strcat(suit_dir,subj_t1_prefix,'_desc-preproc_T1w.nii')})
    end
        
    % Normalize to template
    job.subjND.gray={strcat(suit_dir,subj_t1_prefix,'_label-GM_probseg.nii')};
    job.subjND.white={strcat(suit_dir,subj_t1_prefix,'_label-WM_probseg.nii')};
    job.subjND.isolation={strcat(suit_dir,'c_',subj_t1_prefix,'_desc-preproc_T1w_pcereb.nii')};

    if isfile(strcat('Affine_', subj, '_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.mat'))    
        %print(strcat(subj, ' suit_normalize_dartel already done'))   
    else
        suit_normalize_dartel(job)
    end
    

    
    % Map funcitonal data to new space
    for i_task = 1:length(tasks)
        task = tasks{i_task};
        
        for i_cond = 1:length(conditions)
            condition = conditions{i_cond};
            
            % Check to see if tmap exists
            if isfile(strcat(suit_dir,'../zmap_',task, ...
                                '_',condition,'.nii'))
                job.subj.affineTr = {strcat('Affine_', subj, ...
                    '_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.mat')};
                job.subj.flowfield = {strcat('u_a_', subj, ...
                    '_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.nii')};
                job.subj.resample = {strcat(suit_dir,'../zmap_',task, ...
                                    '_',condition,'.nii')};
                job.subj.mask = {strcat('c_', subj, ...
                    '_run-1_space-MNI152NLin2009cAsym_desc-preproc_T1w_pcereb.nii')};

                suit_reslice_dartel(job)

                % Put data from SUIT space to native space
                job.Affine = {strcat('Affine_', subj, ...
                    '_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.mat')};
                job.flowfield = {strcat('u_a_', subj, ...
                    '_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.nii')};
                job.resample = {strcat(suit_dir,'../zmap_',task, ...
                    '_',condition,'.nii')};
                job.resample = {strcat(suit_dir,'../wdzmap_',task, ...
                    '_',condition,'.nii')};
                job.ref = {strcat(suit_dir,'../zmap_',task, ...
                    '_',condition,'.nii')};
                %job.ref = {strcat(suit_dir,subj_t1_prefix,'_desc-preproc_T1w.nii')};

                suit_reslice_dartel_inv(job)
            end
        end
    end
    
end

%% Convert cerebellum mask to MNI subject space

for i = 1:length(subj_list)
    subj = subj_list{i};
    % Isolate cerebellum and brainstem

    % Set paths and file prefix
    suit_dir = strcat(bids_dir, 'derivatives/social_doors-nilearn/',subj,'/suit/');

    cd(suit_dir);

    job.Affine = {strcat('Affine_', subj, ...
                  '_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.mat')};
    job.flowfield = {strcat('u_a_', subj, ...
                    '_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.nii')};
    job.resample = {strcat('c_', subj, ...
                        '_run-1_space-MNI152NLin2009cAsym_desc-preproc_T1w_pcereb.nii')};

    job.ref = {strcat(suit_dir,'../zmap_','social', ...
               '_','positive','.nii')};

    suit_reslice_dartel_inv(job)
end

%% Convert atlas to MNI subject space

subj = 'sub-010';

suit_dir = strcat(bids_dir, 'derivatives/social_doors/',subj,'/suit/');

cd(suit_dir);

job.Affine = {strcat('Affine_', subj, ...
              '_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.mat')};
job.flowfield = {strcat('u_a_', subj, ...
                '_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.nii')};
job.resample = {'/usr/local/spm12/toolbox/suit/atlases/King_2019/atl-MDTB10_space-SUIT_dseg.nii '};

job.ref = {strcat(suit_dir,'../tmap_',task, ...
           '_',condition,'.nii')};

suit_reslice_dartel_inv(job)



