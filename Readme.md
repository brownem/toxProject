# PCA
Principal Component Analysis (PCA) is an observation about whether a set of linearly uncorrelated variables is possibly correlated in another way. This is accomplished using an Orthogonal Transformation. PCA will identify trends that can be expected from a rough ‘cloud’ of data, and helps to identify predictors and controlling factors of the data set.

# Background
Project was based on the toxicity data for a particular species of fish. In this particular case, it was a compellation of the lethal-concentration to kill half of an exposed population (LD50). Given that this data was collected directly from natural environments, there are a lot of extra variables in the data set that may not have contributed to the destruction of this species of fish. Using R, Principal Component Analysis, Eigenvalues, and Eigenvectors, the chemical responsible for killing the fish populations can be identified.

# Dataset
Our dataset was produced by the United States Environmental Protection Agency (EPA), and contains a large range of potential toxins. We were able to eliminate some of them right away, due to zero-values for all samples. The remaining variables were fed into an R program to identify any correlation between them and their contribution to population die-offs of natural fish populations.

# Chemcial Characteristics
| PC1 | | Definition |
|---|---|---|
| Mol_MW | 0.71 | Molecular Weight of Molecule |
| SASA | 0.68 | Total solvent surface accessible surface area in square angstroms |
| QPolrz | 0.83 | Predicted polarization in cubic angstroms |
| QPlogPC16	| 0.91 | Predicted hexadecane/gas partition coefficient |
| QPlogPoct	| 0.76 | Predicted octanol/gas partition coefficient |
| nonHatm | 0.9 | Number of heavy atoms (nonhydrogen atoms) |
| **PC2** | | |
|---|---|---|
| FISA | 0.68 | Hydrophilic component of the SASA |
| QPPCaco | 0.72 | Predicted apparent Caco-2 cell permeability in nm/sec  (passing the gut-blood barrier) |
| QPlogKp | 0.68 | Predicted skin permeability |
