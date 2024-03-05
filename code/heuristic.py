import os

def create_key(template, outtype=('nii.gz',), annotation_classes=None):
    if template is None or not template:
        raise ValueError('Template must be a valid format string')
    return template, outtype, annotation_classes
def infotodict(seqinfo):
    """Heuristic evaluator for determining which runs belong where
    allowed template fields - follow python string module:
    item: index within category
    subject: participant id
    seqitem: run number during scanning
    subindex: sub index within group
    """
    t1w = create_key('sub-{subject}/anat/sub-{subject}_run-{item:01d}_T1w')
    func_task_1 = create_key('sub-{subject}/func/sub-{subject}_task-social_run-{item:01d}_bold')
    func_task_2 = create_key('sub-{subject}/func/sub-{subject}_task-mdoors_run-{item:01d}_bold')
    fmap_bold = create_key('sub-{subject}/fmap/sub-{subject}_epi')
    fmap_bold_phase = create_key('sub-{subject}/fmap/sub-{subject}_epi_phase')

    info = {t1w: [], func_task_1: [], func_task_2: [], fmap_bold: [], fmap_bold_phase: []}
    
    for idx, s in enumerate(seqinfo):
        if (s.dim1 == 256) and (s.dim2 == 256) and ('T1_Sag_MPRage_norm' in s.protocol_name):
            info[t1w].append(s.series_id)
        if (s.dim1 == 96) and (s.dim2 == 96) and (s.dim4 == 130) and ('EPI_social' in s.protocol_name):
            info[func_task_1].append(s.series_id)
        if (s.dim1 == 96) and (s.dim2 == 96) and (s.dim4 == 130) and ('EPI_doors' in s.protocol_name):
            info[func_task_2].append(s.series_id)
        elif (s.dim1 == 64) and (s.dim2 == 64) and ('gre_field_mapping' in s.protocol_name):
            if '_phase' in s.dcm_dir_name:
                info[fmap_bold_phase].append(s.series_id)
            else:
                info[fmap_bold] = [s.series_id]
    return info


