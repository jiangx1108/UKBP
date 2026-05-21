setwd("D:\\VUB\\data\\S6\\Data")
library(dplyr)
#
#########                    
df<-read.csv("D:\\VUB\\data\\S6\\Data\\data.cleaned.csv")

df$DN4 <- ifelse(df$DN4 == "NP", 1, 0)
table(df$DN4)
df$CP <- ifelse(df$CP == "Yes", 1, 0)
table(df$CP)
#Excluding cases where there is acute or chronic pain at the baseline.
df <- df %>% filter(Pain == "PF")
#Eliminate the case where the ending is missing.
df1 <- df[complete.cases(df$CP), ]
df2 <- df[complete.cases(df$DN4), ]
df3 <- df[complete.cases(df$WPI.v1), ]
df4 <- df[complete.cases(df$BPI.interference), ]
df5 <- df[complete.cases(df$BPI.worst.pain), ]
df6 <- df[complete.cases(df$BPI.least.pain), ]
df7 <- df[complete.cases(df$BPI.average.pain), ]
df8 <- df[complete.cases(df$BPI.now.pain), ]
#
colSums(is.na(df))
vars <- c("age","sex","ethnic","edu","DTI","employment","depression.cov",
          "BMI","sleep.quality","physical.activity","smoking","drinking",
          "CP","DN4","WPI.v1","BPI.interference","BPI.worst.pain","BPI.least.pain",
          "BPI.average.pain","BPI.now.pain"
)
df <- df %>%
  filter(complete.cases(pick(all_of(vars))))

write.csv(df[, c("ID","age","sex","ethnic","edu","DTI","employment",
                 "depression.cov","heart.problems","diabetes","cancer",
                 "noncancer.illness.neurological","BMI",
                 "sleep.quality","physical.activity","smoking","drinking",
                 "CP","WPI.v1","SSS","DN4","BPI.worst.pain","BPI.least.pain","BPI.average.pain",
                 "BPI.now.pain","BPI.interference","followup_years")],"data.analysis.csv", row.names = FALSE)



####Analysis data据######
data1<-read.csv("D:\\VUB\\data\\S6\\Data\\data.analysis.csv")
colnames(data1)
colSums(is.na(data1))
# lifestyle
data1$lifestyle.num <- rowSums(data1[, c("BMI", "sleep.quality", "physical.activity", "smoking", "drinking")] == "Unhealthy")
data1$lifestyle.cat <- case_when(
  data1$lifestyle.num %in% c(4, 5) ~ "non-optimal",   
  data1$lifestyle.num == 3 ~ "intermediate",          
  data1$lifestyle.num %in% c(0, 1, 2) ~ "optimal"    
)

data1$lifestyle.cat <- factor(data1$lifestyle.cat, levels = c("optimal", "intermediate","non-optimal"))

table(df$CP,useNA="ifany")
table(df$DN4,useNA="ifany")
attach(data1)

model <- glm(DN4 ~ BMI + sleep.quality + physical.activity + smoking + 
            drinking + age + sex + ethnic + edu + DTI + employment + depression.cov, 
            data = data1, 
            family = binomial(link = "logit"))


model <- glm(DN4 ~ lifestyle.cat + age + sex + ethnic + edu + DTI + employment + depression.cov, 
             data = data1, 
             family = binomial(link = "logit"))

summary(model) 

#WPI.v1\BPI.interference\BPI.worst.pain\BPI.least.pain\BPI.average.pain\BPI.now.pain

fit1<-glm(SSS ~ BMI + sleep.quality + physical.activity + smoking + 
            drinking + age + sex + ethnic + edu + DTI + employment + depression.cov,
          data=data1)

fit1<-glm(SSS ~ lifestyle.cat + age + sex + ethnic + edu + DTI + employment + depression.cov,
          data=data1)


summary(fit1)                   

nobs(fit1)                        

