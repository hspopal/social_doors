# Social Doors

**Contributors**: Haroon Popal, Megan Quarmley, David Smith, Johanna Jarcho, Ingrid Olson


## Analyses

### Univariate
#### Region of Interest (ROI)
- `univariate_roi_contrast.py`
  - Completes univariate analyses and pulls stats from ROIs
  - Utilizes Nilearn for general univariate analyses, and SUIT outputs for cerebellum regions
- `univariate_roi_analysis-contrasts-group.Rmd`
  - Group level ROI contrast analyses
  - Includes within and between group analyses
#### Whole-Brain
- `social_doors_1st_level-nilearn.py`
  - Create subject level beta and contrast maps, across runs
- `social_doors_1st_level-nilearn-indiv_runs.py`
  - Create subject level beta maps for each run
- `social_doors_2nd_level-nilearn.ipynb`
  - Whole brain second level (between-subjects) analyses

### Psychophysiological Interactions
- `ppi_cerebellum.ipynb`
  - Whole brain PPI analysis done with nltools
- `ppi_cerebellum-network.ipynb`
  - Network PPI analysis done with nltools
- `ppi_cerebellum-nilearn.ipynb`
  - Whole brain and network ROI PPI analysis done with Nilearn
- `ppi_cerebellum-dual_regression.ipynb`
  - Dual Regression PPI analysis done with nltools (first level) and nilearn (second level)

### Representational Similarity Analysis
- `rsa_social_doors-fbonly.ipynb`
  - Looking at only the similarity of the feedback trials

