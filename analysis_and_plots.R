setwd('/Users/r_klabacka/OneDrive - Utah Tech University/KLab/Research/MitoNuc_Sim')

dat <- read.csv('all_generations.csv')

results = lm(data = dat, Generations~relevel(factor(Mode), ref = "Asex"))

summary(results)

ggplot(data = dat, aes(x = Mode, y = Generations, fill=Mode)) + geom_violin(alpha = 0.5) + geom_jitter(width = .1) + scale_fill_manual(values = c("#A9DBB8", "#7CA5B8", "#38369A", "#2139ed")) + theme_classic()