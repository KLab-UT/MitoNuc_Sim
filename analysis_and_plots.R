setwd('/Users/r_klabacka/OneDrive - Utah Tech University/KLab/Research/MitoNuc_Sim/RunningFiles')



dat_PF <- read.csv('PeakFitness_data.csv')
dat_PF <- dat_PF[dat_PF$Mode %in% c("Sex", "Asex"), ]
dat_PF_MtAut <- dat_PF[dat_PF$Locus %in% c("mito", "auto"), ]
dat_PF_MtadjAut <- dat_PF[dat_PF$Mode %in% c("mito-adj", "auto"), ]

PF_interaction = lm(data = dat_PF_MtadjAut, EndTime~Mode*Locus)

ggplot(dat_PF_MtAut, aes(x = interaction(Mode, Locus), y = EndTime)) +
  geom_boxplot() +
  labs(x = "Mode and Locus Interaction", y = "End Time") +
  theme_minimal()

dat_CT <- read.csv('CompensatoryTest_data.csv')
dat_CT <- dat_CT[dat_CT$Mode %in% c("Sex", "Asex"), ]
dat_CT_MtAut <- dat_CT[dat_CT$Locus %in% c("mito", "auto"), ]
dat_CT_MtadjAut <- dat_CT[dat_CT$Mode %in% c("mito-adj", "auto"), ]

CT_interaction = lm(data = dat_CT_MtAut, FinalFitness~Mode*Locus)

ggplot(dat_CT_MtAut, aes(x = interaction(Mode, Locus), y = FinalFitness)) +
  geom_boxplot() +
  labs(x = "Mode and Locus Interaction", y = "Final Fitness") +
  theme_minimal()


ggplot(data = CT_interaction, aes(x = Mode, y = FinalFitness, fill=Mode)) + geom_boxplot(alpha = 0.5) + scale_fill_manual(values = c("#A9DBB8", "#7CA5B8", "#38369A", "#2139ed", "black")) + theme_classic()

results = lm(data = mito_PF, FinalFitness~relevel(factor(Mode), ref = "Asex"))

summary(results)

ggplot(data = mito_PF, aes(x = Mode, y = FinalFitness, fill=Mode)) + geom_violin(alpha = 0.5) + geom_jitter(width = .1) + scale_fill_manual(values = c("#A9DBB8", "#7CA5B8", "#38369A", "#2139ed", "black")) + theme_classic()
ggplot(data = mito_PF, aes(x = Mode, y = FinalFitness, fill=Mode)) + geom_boxplot(alpha = 0.5) + scale_fill_manual(values = c("#A9DBB8", "#7CA5B8", "#38369A", "#2139ed", "black")) + theme_classic()
mito_PF <- dat[dat$Locus == "mito", ]
