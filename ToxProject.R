cat("\f")
#lines 4-5 WILL DELETE ALL VARIABLES AND CLEAR WORKSPACE.
#COMMENT-OUT IF THIS IS UNDESIRABLE
closeAllConnections()
rm(list=ls())

##print(datatest)
datatest <- read.csv(file = "ToxData.csv", header = TRUE, sep = ",")
datatest <- datatest[, c(7:39, 42:52, 57:59)]


##print(mm)
mm <- data.matrix(datatest)

datatest$stars          <- datatest$stars       - mean(datatest$stars)
datatest$amine          <- datatest$amine       - mean(datatest$amine)
datatest$amidine        <- datatest$amidine     - mean(datatest$amidine)
datatest$acid           <- datatest$acid        - mean(datatest$acid)
datatest$amide          <- datatest$amide       - mean(datatest$amide)
datatest$rotor          <- datatest$rotor       - mean(datatest$rotor)
datatest$rtvFG          <- datatest$rtvFG       - mean(datatest$rtvFG)
datatest$mol_MW         <- datatest$mol_MW      - mean(datatest$mol_MW)
datatest$dipole         <- datatest$dipole      - mean(datatest$dipole)
datatest$SASA           <- datatest$SASA        - mean(datatest$SASA)
datatest$FOSA           <- datatest$FOSA        - mean(datatest$FOSA)
datatest$FISA           <- datatest$FISA        - mean(datatest$FISA)
datatest$PISA           <- datatest$PISA        - mean(datatest$PISA)
datatest$WPSA           <- datatest$WPSA        - mean(datatest$WPSA)
datatest$volume         <- datatest$volume      - mean(datatest$volume)
datatest$donorHB        <- datatest$donorHB     - mean(datatest$donorHB)
datatest$accptHB        <- datatest$accptHB     - mean(datatest$accptHB)
datatest$dip.2.V        <- datatest$dip.2.V     - mean(datatest$dip.2.V)
datatest$ACxDN..5.SA    <- datatest$ACxDN..5.SA - mean(datatest$ACxDN..5.SA)
datatest$glob           <- datatest$glob        - mean(datatest$glob)
datatest$QPpolrz        <- datatest$QPpolrz     - mean(datatest$QPpolrz)
datatest$QPlogPC16      <- datatest$QPlogPC16   - mean(datatest$QPlogPC16)
datatest$QPlogPoct      <- datatest$QPlogPoct   - mean(datatest$QPlogPoct)
datatest$QPlogPw        <- datatest$QPlogPw     - mean(datatest$QPlogPw)
datatest$QPlogPo.w      <- datatest$QPlogPo.w   - mean(datatest$QPlogPo.w)
datatest$QPlogS         <- datatest$QPlogS      - mean(datatest$QPlogS)
datatest$QPlogHERG      <- datatest$QPlogHERG   - mean(datatest$QPlogHERG)
datatest$QPPCaco        <- datatest$QPPCaco     - mean(datatest$QPPCaco)
datatest$QPlogBB        <- datatest$QPlogBB     - mean(datatest$QPlogBB)
datatest$QPPMDCK        <- datatest$QPPMDCK     - mean(datatest$QPPMDCK)
datatest$QPlogKp        <- datatest$QPlogKp     - mean(datatest$QPlogKp)
datatest$IP.eV.         <- datatest$IP.eV.      - mean(datatest$IP.eV.)
datatest$EA.eV.         <- datatest$EA.eV.      - mean(datatest$EA.eV.)
datatest$PSA            <- datatest$PSA         - mean(datatest$PSA)
datatest$NandO          <- datatest$NandO       - mean(datatest$NandO)
datatest$RuleOf5        <- datatest$RuleOf5     - mean(datatest$RuleOf5)
datatest$ringatoms      <- datatest$ringatoms   - mean(datatest$ringatoms)
datatest$in34           <- datatest$in34        - mean(datatest$in34)
datatest$in56           <- datatest$in56        - mean(datatest$in56)
datatest$noncon         <- datatest$noncon      - mean(datatest$noncon)
datatest$nonHatm        <- datatest$nonHatm     - mean(datatest$nonHatm)
datatest$HOMO_AM1       <- datatest$HOMO_AM1    - mean(datatest$HOMO_AM1)
datatest$LUMO_AM1       <- datatest$LUMO_AM1    - mean(datatest$LUMO_AM1)
datatest$dE             <- datatest$dE          - mean(datatest$dE)
datatest$EA.AM1         <- datatest$EA.AM1      - mean(datatest$EA.AM1)
datatest$IA.AM1         <- datatest$IA.AM1      - mean(datatest$IA.AM1)
datatest$Chem.Pot       <- datatest$Chem.Pot    - mean(datatest$Chem.Pot)

# class <- which(colnames(datatest)=="class")
# datatest <- datatest[,-class]

dataM   <- data.matrix(datatest)

#print(dataM)

cov     <- t(dataM) %*% (dataM)
cov     <- cov/length(datatest$acid)

##print(cov)

ee      <- eigen(cov)
val     <- ee$values

##print(val)
#vec <- ee$vectors

val     <- (ee$values)/(sum(ee$values))
val     <- ee$values

print(val)
print(sum(val))

##print(wine_pca)
wine_pca    <- prcomp(datatest,scale=T)

##print(ss)
ss          <- summary(wine_pca)

#correlation between original variables and principal components
corr        <- cor(datatest,wine_pca$x)
# correlation^2: amount of variation of each of the variables that is explained by the principal components:

r           <- round(corr^2, 2)
print(corr)
print(r)

##stop()
# note the rows sum to 1:
sss         <- apply(corr^2, 1, sum)
print(sss)

library(psych)
library(GPArotation)
fit         <- principal(datatest,nfactors=3,
                 rotate="varimax")
print(fit)