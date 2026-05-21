setwd("D:\\VUB\\data\\S6\\Data")
library(dplyr)
library(stringr)
#
#####rename & merge dataset#####
data1 <- read.csv("D:/VUB/data/S6/Data/0127_participant.csv")
data2 <- read.csv("D:/VUB/data/S6/Data/0704_participant.csv")
data3 <- read.csv("D:/VUB/data/S6/Data/0708_participant.csv")
data4 <- read.csv("D:/VUB/data/S6/Data/data2.csv")
colnames(data1)
new_names<-c("ID","BMI","sleep.duration","chronotype","insomnia","snoring","dozing",
             "fresh.fruit","dried.fruit","cookedveg","salad","bread","cereal","oilyfish",
             "cheese","non.butter.type","bread.type","cereal.type","processed.meat",
             "age.meat","poultry","beef","lamb","pork","sugar","PA","current.smoke",
             "past.smoke","X100smokers","alcohol.freq","red.wine","champagne","beer",
             "spirits","fortified.wine","other.alco","felt.loved","pa.abused","felt.hated",
             "sex.molested","to.doctor","confiding.relationship","physical.violence",
             "belittlement","sex.interference","able.to.pay","sex.assault","physical.crime",
             "serious.accident","witnessed","diag.illness","war.zone","disturbing.thoughts",
             "felt.upset","avoided.activites","felt.distant","felt.irritable","pain.type",
             "c.general.pain","age","sex","ethnic","edu","townsend","medication.pain",
             "non.oilyfish","milk.type","c.headache","c.facial.pain","c.neck.pain",
             "c.back.pain","c.abdominal.pain","c.hip.pain","c.knee.pain")
colnames(data1)<-new_names
colnames(data2)
new_names2<-c("ID","assement.centre0","heart.problems",
             "diabetes","cancer","major.depression","employment","household",
             paste0("noncancer.illness.A", 0:33))
colnames(data2)<-new_names2
colnames(data3)
new_names3<-c("ID","CP","WPI","sss.fatigue","sss.Waking.unrefreshed","sss.cognitive.symptoms",
              "sss.lower.abdomen","sss.depression","sss.headache","DN4.burning","DN4.painful.cold",
              "DN4.electric", "DN4.tingling","DN4.pins","DN4.numbness","DN4.itching",
              "BPI.worst.pain","BPI.least.pain","BPI.average.pain","BPI.now.pain",
              "BPI.general.activity","BPI.mood","BPI.walking.ability",
              "BPI.normal.work","BPI.relationship","BPI.sleep","BPI.enjoyment",
              "d.completed","d.attended","rating.general","rating.head",
              "rating.face","rating.neck","rating.back","rating.stomach",
              "rating.hip","rating.knee","rating.arm",
              "rating.hand","rating.feet","rating.leg","rating.chest")
colnames(data3)<-new_names3
colnames(data4)
new_names4<-c("ID","depression.GP","depression.psy")
colnames(data4)<-new_names4

data.merged <- data1 %>%
  full_join(data2, by = "ID") %>%
  full_join(data3, by = "ID") %>%
  full_join(data4, by = "ID")

colnames(data.merged)

write.csv(data.merged[, c("ID", "BMI", "sleep.duration", "chronotype", "insomnia", "snoring", 
                    "dozing", "fresh.fruit", "dried.fruit", "cookedveg", "salad", "bread", 
                    "cereal", "oilyfish", "cheese", "non.butter.type", "bread.type", 
                    "cereal.type", "processed.meat", "age.meat", "poultry", "beef", 
                    "lamb", "pork", "sugar","non.oilyfish", "milk.type", "PA", "current.smoke", "past.smoke", 
                    "X100smokers", "alcohol.freq", "red.wine", "champagne", "beer", 
                    "spirits", "fortified.wine", "other.alco", "felt.loved", "pa.abused", 
                    "felt.hated", "sex.molested", "to.doctor", "confiding.relationship", 
                    "physical.violence", "belittlement", "sex.interference", "able.to.pay", 
                    "sex.assault", "physical.crime", "serious.accident", "witnessed", 
                    "diag.illness", "war.zone", "disturbing.thoughts", "felt.upset", 
                    "avoided.activites", "felt.distant", "felt.irritable",  
                    "pain.type","c.general.pain","c.headache", "c.facial.pain", "c.neck.pain",
                    "c.back.pain", "c.abdominal.pain", "c.hip.pain", "c.knee.pain",
                    "age", "sex", "ethnic", "edu", "townsend", "employment", "household",
                    "depression.GP", "depression.psy","heart.problems","diabetes",
                    "cancer","major.depression", paste0("noncancer.illness.A", 0:33),
                    "CP", "WPI", "sss.fatigue", "sss.Waking.unrefreshed", 
                    "sss.cognitive.symptoms", "sss.lower.abdomen", "sss.depression", "sss.headache", 
                    "DN4.burning", "DN4.painful.cold", "DN4.electric", "DN4.tingling", "DN4.pins", 
                    "DN4.numbness", "DN4.itching", "BPI.worst.pain", "BPI.least.pain", 
                    "BPI.average.pain", "BPI.now.pain", "BPI.general.activity", "BPI.mood", 
                    "BPI.walking.ability", "BPI.normal.work", "BPI.relationship", "BPI.sleep", 
                    "BPI.enjoyment", "d.completed", "d.attended", "rating.general", "rating.head", 
                    "rating.face", "rating.neck", "rating.back", "rating.stomach", 
                    "rating.hip", "rating.knee", "rating.arm", "rating.hand", "rating.feet", 
                    "rating.leg", "rating.chest")],"data.merged.csv", row.names = FALSE)

#####Preprocess variables#####
data3<-read.csv("D:\\VUB\\data\\S6\\Data\\data.merged.csv")
colnames(data3)
data3 <- mutate_at(data3, vars(sleep.duration, chronotype, insomnia,snoring,dozing,fresh.fruit,
                               dried.fruit,cookedveg,salad,bread,cereal,oilyfish,cheese,non.butter.type,
                               bread.type,cereal.type,processed.meat, age.meat, poultry, beef, lamb, pork,
                               sugar, PA, current.smoke, past.smoke, X100smokers, alcohol.freq, 
                               red.wine, champagne, beer, spirits, fortified.wine, other.alco, 
                               felt.loved, pa.abused, felt.hated, sex.molested, to.doctor, confiding.relationship,
                               physical.violence, belittlement, sex.interference, able.to.pay, sex.assault, 
                               physical.crime, serious.accident, witnessed, diag.illness, war.zone, 
                               disturbing.thoughts, felt.upset, avoided.activites, felt.distant, felt.irritable,
                               non.oilyfish, milk.type,sex,ethnic,edu,employment,household,depression.GP,
                               depression.psy,heart.problems,diabetes,cancer,major.depression,CP,WPI,
                               sss.fatigue,sss.Waking.unrefreshed,sss.cognitive.symptoms,sss.lower.abdomen,
                               sss.depression,sss.headache,DN4.burning,DN4.painful.cold,
                               DN4.electric, DN4.tingling,DN4.pins,DN4.numbness,DN4.itching,
                               BPI.worst.pain, BPI.least.pain, BPI.average.pain, BPI.now.pain, 
                               BPI.general.activity, BPI.mood, BPI.walking.ability, BPI.normal.work, 
                               BPI.relationship, BPI.sleep, BPI.enjoyment,rating.general, rating.head, 
                               rating.face, rating.neck, rating.back, rating.stomach, 
                               rating.hip, rating.knee, rating.arm, rating.hand, rating.feet,
                               rating.leg, rating.chest),
                   ~ ifelse(. %in% c("Do not know", "Prefer not to answer", "", NA), NA, .))
#BMI
data3$BMI <- cut(data3$BMI, breaks = c(-Inf, 18.5, 24.9, Inf), labels = c("1", "2", "3"), right = FALSE)
data3$BMI <- ifelse(data3$BMI == "2", "Healthy", "Unhealthy")

#sleep.quality
data3$sleep.duration1 <- ifelse(is.na(data3$sleep.duration), 
                                NA, ifelse(data3$sleep.duration == 7,  
                                           0,1 ))
data3$chronotype1 <- ifelse(data3$chronotype %in% c("Definitely a 'morning' person", "More a 'morning' than 'evening' person"),
                            0, ifelse(data3$chronotype %in% c("Definitely an 'evening' person", "More an 'evening' than a 'morning' person"),
                                      1, NA))
data3$insomnia1 <- ifelse(data3$insomnia == "Never/rarely",0,ifelse(data3$insomnia %in% c("Sometimes", "Usually"), 
                                                                    1, NA))
data3$snoring1 <- ifelse(data3$snoring == "No", 0,ifelse(data3$snoring == "Yes", 1, NA ))
data3$dozing1 <- ifelse(data3$dozing == "Never/rarely", 0, ifelse(
  data3$dozing %in% c("All of the time", "Often", "Sometimes"), 1,  NA ))
data3$sleep.total <- data3$dozing1 + data3$snoring1 + data3$insomnia1 + data3$chronotype1 + data3$sleep.duration1
data3$sleep.quality <- ifelse(data3$sleep.total >= 4, "Unhealthy", "Healthy" )

#physical.activity
data3$physical.activity <- ifelse(
  data3$PA == "No", "Unhealthy",ifelse(data3$PA == "Yes", "Healthy", NA ))

#smoking
data3$smoking <- ifelse(data3$current.smoke == "No" & (data3$past.smoke == "I have never smoked" |
               (data3$past.smoke %in% c("Just tried once or twice", "Smoked occasionally") & 
              data3$X100smokers == "No")),"Healthy", ifelse(
              data3$current.smoke %in% c("Yes, on most or all days", "Only occasionally") |
             data3$past.smoke == "Smoked on most or all days" |
              (data3$past.smoke %in% c("Just tried once or twice", "Smoked occasionally") & 
              data3$X100smokers == "Yes"),"Unhealthy", NA ))

#drinking
data3$red.wine <- as.numeric(data3$red.wine)
data3$champagne <- as.numeric(data3$champagne)
data3$beer <- as.numeric(data3$beer)
data3$spirits <- as.numeric(data3$spirits)
data3$fortified.wine <- as.numeric(data3$fortified.wine)
data3$other.alco <- as.numeric(data3$other.alco)

data3$red.wine1 <- data3$red.wine * 1.5
data3$champagne1 <- data3$champagne * 1.5
data3$beer1 <- data3$beer * 2
data3$spirits1 <- data3$spirits *  1
data3$fortified.wine1 <- data3$fortified.wine * 2.1
data3$other.alco1 <- data3$other.alco * 1.3

data3$daily.alcohol.intake <- rowSums(cbind(data3$red.wine1,data3$champagne1,
                                            data3$beer1,data3$spirits1,data3$fortified.wine1,data3$other.alco1), na.rm = TRUE) / 7  

data3$drinking <- ifelse((data3$sex == "Female" & data3$daily.alcohol.intake > 1) |
                           (data3$sex == "Male" & data3$daily.alcohol.intake > 2),"Unhealthy","Healthy")

#diet
update_variable <- function(x) {
  x[x == "Less than one"] <- 0.5
  return(as.numeric(x)) }

data3$fresh.fruit <- update_variable(data3$fresh.fruit)
data3$dried.fruit <- update_variable(data3$dried.fruit)
data3$cookedveg <- update_variable(data3$cookedveg)
data3$salad <- update_variable(data3$salad)

data3$fruit <- data3$fresh.fruit + data3$dried.fruit
data3$fruit <- ifelse(data3$fruit >= 3, 1, 0)

data3$vegetable <- data3$cookedveg + data3$salad
data3$vegetable <- ifelse(data3$vegetable >= 3, 1, 0)

data3$oilyfish_weekly <- case_when(
  data3$oilyfish == "2-4 times a week" ~ 3,
  data3$oilyfish == "5-6 times a week" ~ 5, 
  data3$oilyfish == "Less than once a week" ~ 0, 
  data3$oilyfish == "Never" ~ 0,
  data3$oilyfish == "Once a week" ~ 1, 
  data3$oilyfish == "Once or more daily" ~ 7)

data3$non_oilyfish_weekly <- case_when(
  data3$non.oilyfish == "2-4 times a week" ~ 3, 
  data3$non.oilyfish == "5-6 times a week" ~ 5,  
  data3$non.oilyfish == "Less than once a week" ~ 0, 
  data3$non.oilyfish == "Never" ~ 0, 
  data3$non.oilyfish == "Once a week" ~ 1,  
  data3$non.oilyfish == "Once or more daily" ~ 7)

data3$shellfish <- data3$oilyfish_weekly + data3$non_oilyfish_weekly
data3$shellfish <- ifelse(data3$shellfish >= 2, 1, 0)

processed_meat_mapping <- c("Never" = 0, 
                            "Less than once a week" = 0.5, 
                            "Once a week" = 1, 
                            "2-4 times a week" = 3, 
                            "5-6 times a week" = 5, 
                            "Once or more daily" = 7)

data3$processed_meat_weekly <- sapply(data3$processed.meat, function(x) processed_meat_mapping[x])
data3$stop_meat_consumption <- ifelse(data3$age.meat < data3$age, 1, 0)
data3$processed.meats <- ifelse(data3$processed_meat_weekly <= 1 & data3$stop_meat_consumption == 1, 1, 0)

unprocessed_meat_mapping <- c("Never" = 0, 
                              "Less than once a week" = 0.5, 
                              "Once a week" = 1, 
                              "2-4 times a week" = 3, 
                              "5-6 times a week" = 5, 
                              "Once or more daily" = 7)

data3$poultry_weekly <- sapply(data3$poultry, function(x) unprocessed_meat_mapping[x])
data3$beef_weekly <- sapply(data3$beef, function(x) unprocessed_meat_mapping[x])
data3$lamb_weekly <- sapply(data3$lamb, function(x) unprocessed_meat_mapping[x])
data3$pork_weekly <- sapply(data3$pork, function(x) unprocessed_meat_mapping[x])

data3$total_unprocessed_meat_weekly <- data3$poultry_weekly + 
  data3$beef_weekly + 
  data3$lamb_weekly + 
  data3$pork_weekly

data3$stop_meat_consumption <- ifelse(data3$age.meat < data3$age, 1, 0)
data3$unprocessed.meats <- ifelse(data3$total_unprocessed_meat_weekly <= 2 & 
                                    data3$stop_meat_consumption == 1, 1, 0)

data3$bread <- update_variable(data3$bread)
data3$cereal <- update_variable(data3$cereal)
data3$daily.bread.intake <- data3$bread / 7
data3$daily.cereal.intake <- data3$cereal / 7
data3$whole.grains <- data3$daily.bread.intake + data3$daily.cereal.intake
data3$whole.grains <- ifelse(data3$whole.grains >= 3, 1, 0)

data3$refined_bread <- ifelse(data3$bread.type %in% 
                                c("White", "Brown", "Other type of bread"),1,0)

data3$refined_cereal <- ifelse(data3$cereal.type %in% 
                                 c("Biscuit cereal (e.g. Weetabix)", "Other (e.g. Cornflakes, Frosties)"),1,0)

data3$bread_daily <- data3$bread / 7
data3$cereal_daily <- data3$cereal / 7

data3$refined.grains <- (data3$bread_daily * data3$refined_bread) +
  (data3$cereal_daily * data3$refined_cereal)
data3$refined.grains <- ifelse(data3$refined.grains <= 2, 1, 0)

data3$healthy_score <- (
  data3$fruit +data3$vegetable + data3$shellfish + data3$processed.meats +
  data3$unprocessed.meats + data3$refined.grains +  data3$whole.grains)

data3$diet <- ifelse(data3$healthy_score >= 4, "Healthy", "Unhealthy")

#CTS (Childhood Trauma Screen)
variables_5_to_1 <- c("felt.loved", "to.doctor")  
variables_1_to_5 <- c("felt.hated", "pa.abused", "sex.molested") 
data3 <- data3 %>%
  mutate(across(all_of(variables_5_to_1), ~ case_when(
    . == "Never true"       ~ 5,
    . == "Rarely true"      ~ 4,
    . == "Sometimes true"   ~ 3,
    . == "Often"            ~ 2,
    . == "Very often true"  ~ 1,
    TRUE                    ~ NA_real_  )),
    across(all_of(variables_1_to_5), ~ case_when(
      . == "Never true"       ~ 1,
      . == "Rarely true"      ~ 2,
      . == "Sometimes true"   ~ 3,
      . == "Often"            ~ 4,
      . == "Very often true"  ~ 5,
      TRUE                    ~ NA_real_ )))

data3 <- data3 %>%
  mutate(CTS = felt.loved + to.doctor + felt.hated + pa.abused + sex.molested)

#ATQ (Adulthood Trauma [≥ 16 years] questionnaire)
variables_5_to_1 <- c("confiding.relationship","able.to.pay")  
variables_1_to_5 <- c("physical.violence", "belittlement", "sex.interference") 

data3 <- data3 %>%
  mutate(
    across(all_of(variables_5_to_1), ~ case_when(
      . == "Never true"       ~ 5,
      . == "Rarely true"      ~ 4,
      . == "Sometimes true"   ~ 3,
      . == "Often"            ~ 2,
      . == "Very often true"  ~ 1,
      TRUE                    ~ NA_real_ )),
    across(all_of(variables_1_to_5), ~ case_when(
      . == "Never true"       ~ 1,
      . == "Rarely true"      ~ 2,
      . == "Sometimes true"   ~ 3,
      . == "Often"            ~ 4,
      . == "Very often true"  ~ 5,
      TRUE                    ~ NA_real_  )))

data3 <- data3 %>%
   mutate(
      ATQ = confiding.relationship + able.to.pay + physical.violence + belittlement + sex.interference)

#LTE (Lifetime traumatic experiences)
data3 <- data3 %>%mutate(across(c(serious.accident, witnessed, diag.illness, war.zone, physical.crime),
                               ~ case_when(. == "Never" ~ 0,grepl("Yes", .) ~ 1,TRUE ~ NA_real_ )))

data3 <- data3 %>%
    mutate(LTE = serious.accident + witnessed + diag.illness + war.zone + physical.crime)

###baseline pain
data3$pain.free<-ifelse(grepl("None of the above",data3$pain.type),"1","0")

variables <- c("c.general.pain","c.headache", "c.facial.pain", "c.neck.pain", 
               "c.back.pain", "c.abdominal.pain", "c.hip.pain","c.knee.pain")
data3[, variables] <- lapply(data3[, variables], function(x) ifelse(x == "Yes", 1, ifelse(x == "No", 0, x)))
data3$chronic.pain <- ifelse(rowSums(data3[, variables] == 1, na.rm = TRUE) > 0, 1,
                             ifelse(rowSums(!is.na(data3[, variables])) == 0, NA, 0))

data3$Pain <- ifelse(is.na(data3$pain.type), NA, 
                     ifelse(data3$pain.free == 1 & !is.na(data3$pain.free), "PF", 
                            ifelse(data3$chronic.pain == 1 & !is.na(data3$chronic.pain), "CP", "AP")))

table(data3$Pain, useNA = "ifany")

##Covariate
data3$ethnic <- ifelse(data3$ethnic %in% c("British", "Any other white background", "White"), "eth_White",
                       ifelse(data3$ethnic %in% c("", NA), NA, "Others"))
data3 <- data3 %>%
  mutate(edu = case_when(
    grepl("^(College or University degree|NVQ or HND or HNC or equivalent|Other professional qualifications eg: nursing, teaching)", edu) ~ 1,
    grepl("^A levels/AS levels or equivalent", edu) ~ 2,
    grepl("^(O levels/GCSEs or equivalent|CSEs or equivalent)", edu) ~ 3,
    grepl("^None of the above", edu) ~ 4,
    TRUE ~ NA_real_  # Keep missing values unchanged
  ))
table(data3$edu,useNA="ifany")


quantiles <- quantile(data3$townsend, probs = c(1/3, 2/3), na.rm = TRUE)
data3 <- data3 %>%
  mutate(DTI = cut(townsend,
                   breaks = c(-Inf, quantiles[1], quantiles[2], Inf),
                   labels = c(0, 1, 2),
                   right = TRUE))  
table(data3$DTI, useNA = "ifany")

data3$heart.problems <- ifelse(
  is.na(data3$heart.problems), 
  NA, 
  ifelse(data3$heart.problems == "None of the above", 0, 1))

data3$diabetes <- ifelse(
  is.na(data3$diabetes),
  NA,
  ifelse(data3$diabetes == "No", 0, 1))

data3$cancer <- ifelse(
  is.na(data3$cancer),
  NA,
  ifelse(data3$cancer == "No", 0, 1))

data3$major.depression <- ifelse(
  is.na(data3$major.depression),
  NA,
  ifelse(data3$major.depression == "No Bipolar or Depression", 0, 1))

data3 <- data3 %>%
  mutate(employment = case_when(
    grepl("^In paid employment or self-employed", employment) ~ "Paid employment or self-employed",
    grepl("^Retired", employment) ~ "Retired",
    grepl("^Looking after home and/or family", employment) ~ "Looking after home and/or family",
    grepl("^Unable to work because of sickness or disability", employment) ~ "Unable to work from sickness or disability",
    grepl("^Unemployed", employment) ~ "Unemployed",
    grepl("^Doing unpaid or voluntary work", employment) ~ "Unpaid or voluntary work",
    grepl("^Full or part-time student", employment) ~ "Student",
    grepl("^None of the above", employment) ~ "None of the above",
    TRUE ~ NA_character_  
  ))

data3 <- data3 %>%
  mutate(marry = case_when(
    grepl("Husband, wife or partner", household, ignore.case = TRUE) ~ 1,  
    !is.na(household) ~ 0,  
    TRUE ~ NA_real_  
  ))

###Neurological disorders
illness_cols <- paste0("noncancer.illness.A", 0:33)
neurological_keywords <- c(
  "stroke",
  "transient ischaemic attack (tia)",
  "subdural haemorrhage/haematoma",
  "subarachnoid haemorrhage",
  "neurological injury/trauma",
  "infection of nervous system",
  "brain abscess/intracranial abscess",
  "encephalitis",
  "meningitis",
  "acute infective polyneuritis/guillain-barre syndrome",
  "chronic/degenerative neurological problem",
  "motor neurone disease",
  "multiple sclerosis",
  "parkinsons disease",
  "dementia/alzheimers/cognitive impairment",
  "epilepsy",
  "head injury",
  "other demyelinating disease (not multiple sclerosis)",
  "cerebral aneurysm",
  "cerebral palsy",
  "brain haemorrhage",
  "spina bifida",
  "ischaemic stroke",
  "meningioma / benign meningeal tumour")

data3 <- data3 %>%
  mutate(noncancer.illness.neurological = if_else(
    apply(data3 %>% select(all_of(illness_cols)), 1, function(row) {
      if (all(is.na(row))) {
        return(NA)
      }
      any(str_detect(tolower(na.omit(row)), paste(neurological_keywords, collapse = "|")))
    }),
    true = 1,
    false = 0
  ))
table(data3$noncancer.illness.neurological, useNA = "ifany")

table(data3$depression.GP)
table(data3$depression.psy)

data3 <- data3 %>%
  mutate(depression.cov = case_when(
    depression.GP == "Yes" | depression.psy == "Yes" ~ "Yes",
    is.na(depression.GP) & is.na(depression.psy) ~ NA_character_,
    TRUE ~ "No"
  ))
#LTC
ltc_keywords <- c(
  "hypertension", "peripheral vascular disease", "essential hypertension", "angina", 
  "heart attack/myocardial infarction", "heart failure/pulmonary odema", "cardiomyopathy", 
  "stroke", "transient ischaemic attack (tia)", "subarachnoid haemorrhage", 
  "leg claudication/ intermittent claudication", "asthma", "chronic obstructive airways disease/copd", 
  "emphysema/chronic bronchitis", "bronchiectasis", "gastro-oesophageal reflux (gord) / gastric reflux", 
  "oesophagitis/barretts oesophagus", "oesophageal varicies", "gastric/stomach ulcers", 
  "gastritis/gastric erosions", "irritable bowel syndrome", "infective/viral hepatitis", 
  "non-infective hepatitis", "liver failure/cirrhosis", "renal/kidney failure", 
  "renal failure requiring dialysis", "renal failure not requiring dialysis", 
  "prostate problem (not cancer)", "diabetes", "type 1 diabetes", "type 2 diabetes", 
  "thyroid problem (not cancer)", "hyperthyroidism/thyrotoxicosis", "hypothyroidism/myxoedema", 
  "psychological/psychiatric problem", "multiple sclerosis", "parkinsons disease", 
  "dementia/alzheimers/cognitive impairment", "epilepsy", "migraine", "diabetic eye disease", 
  "glaucoma", "depression", "anxiety/panic attacks", "nervous breakdown", "schizophrenia", 
  "mania/bipolar disorder/manic depression", "osteoporosis", "myositis/myopathy", 
  "pernicious anaemia", "polycystic ovaries/polycystic ovarian syndrome", "connective tissue disorder", 
  "polymyalgia rheumatica", "systemic lupus erythematosis/sle", "sjogren's syndrome/sicca syndrome", 
  "dermatopolymyositis", "scleroderma/systemic sclerosis", "enlarged prostate", "endometriosis", 
  "alcohol dependency", "opioid dependency", "other substance abuse/dependency", "chronic sinusitis", 
  "meniere's disease", "polycystic kidney", "thyroiditis", "helicobacter pylori", "eczema/dermatitis", 
  "psoriasis", "malabsorption/coeliac disease", "duodenal ulcer", "diverticular disease/diverticulitis", 
  "inflammatory bowel disease", "crohns disease", "ulcerative colitis", "rheumatoid arthritis", 
  "diabetic neuropathy/ulcers", "post-traumatic stress disorder", "anorexia/bulimia/other eating disorder", 
  "atrial fibrillation", "emphysema", "hiatus hernia", "psoriatic arthropathy", "dermatomyositis", 
  "polymyositis", "chronic fatigue syndrome", "brain haemorrhage", "primary biliary cirrhosis", 
  "dyspepsia / indigestion", "bph / benign prostatic hypertrophy", "kidney nephropathy", 
  "iga nephropathy", "grave's disease", "post-natal depression", "hepatitis b", "hepatitis c", 
  "hepatitis d", "hepatitis e", "ischaemic stroke", "hypertrophic cardiomyopathy (hcm / hocm)", 
  "constipation", "alcoholic liver disease / alcoholic cirrhosis", "diabetic nephropathy", 
  "thyroid goitre", "stress", "obsessive compulsive disorder (ocd)", "insomnia"
)

illness_cols <- paste0("noncancer.illness.A", 0:33)

data3 <- data3 %>%
  mutate(LTC = if_else(
    apply(select(., all_of(illness_cols)), 1, function(row) {
      if (all(is.na(row))) {
        return(NA)
      }
      any(str_detect(tolower(na.omit(row)), paste(ltc_keywords, collapse = "|")))
    }),
    true = 1,
    false = 0
  ))

table(data3$LTC, useNA = "ifany")

data3$LTC <- ifelse(
  is.na(data3$LTC) & is.na(data3$cancer),   
  NA,
  as.numeric(data3$LTC == 1 | data3$cancer == 1)  
)

table(data3$LTC, useNA = "ifany")



##Outcomes
##WPI
pain_areas <- c("Left shoulder", "Right shoulder", 
                "Upper left arm", "Upper right arm", 
                "Lower left arm", "Lower right arm", 
                "Left hip", "Right hip", 
                "Upper left leg", "Upper right leg", 
                "Lower left leg", "Lower right leg", 
                "Left jaw pain", "Right jaw pain", 
                "Chest pain", "Abdomen", 
                "Neck pain", "Upper back", 
                "Lower back")
encode_wpi <- function(x) {
  if (is.na(x)) {
    return(NA)
  }
  if (x == "None of the given areas") {
    return(0)
  }
  areas <- unlist(strsplit(x, "\\|"))
  count <- sum(areas %in% pain_areas)
  return(count)
}

data3$WPI.v1 <- sapply(data3$WPI, encode_wpi)
data3 <- data3 %>%
  mutate(WPI.v1 = ifelse(CP == "No" & is.na(WPI.v1), 0, WPI.v1))

with(data3, table(CP, is.na(WPI.v1)))
table(data3$WPI.v1, useNA = "ifany")
##SSS
vars <- c(
  "sss.fatigue", "sss.Waking.unrefreshed", 
  "sss.cognitive.symptoms", "sss.lower.abdomen", 
  "sss.depression", "sss.headache"
)
for (var in vars) {
  cat("=== 变量:", var, "===\n")
  print(table(data3[[var]], useNA = "always"))  
  cat("\n")
}
##SSS
data3 <- data3 %>%
  mutate(
    sss.fatigue_num = recode(
      sss.fatigue,
      "No problem" = 0,
      "Slight or mild problems: generally mild or intermittent" = 1,
      "Moderate: considerable problems; often present and/or at a moderate level" = 2,
      "Severe: pervasive, continuous, life disturbing problems" = 3
    ),
    sss.Waking.unrefreshed_num = recode(
      sss.Waking.unrefreshed,
      "No problem" = 0,
      "Slight or mild problems: generally mild or intermittent" = 1,
      "Moderate: considerable problems; often present and/or at a moderate level" = 2,
      "Severe: pervasive, continuous, life disturbing problems" = 3
    ),
    sss.cognitive.symptoms_num = recode(
      sss.cognitive.symptoms,
      "No problem" = 0,
      "Slight or mild problems: generally mild or intermittent" = 1,
      "Moderate: considerable problems; often present and/or at a moderate level" = 2,
      "Severe: pervasive, continuous, life disturbing problems" = 3
    )
)
data3 <- data3 %>%
  mutate(
    sss.lower.abdomen_num = ifelse(sss.lower.abdomen == "Yes", 1, 
                                   ifelse(sss.lower.abdomen == "No", 0, NA)),
    sss.depression_num = ifelse(sss.depression == "Yes", 1, 
                                ifelse(sss.depression == "No", 0, NA)),
    sss.headache_num = ifelse(sss.headache == "Yes", 1, 
                              ifelse(sss.headache == "No", 0, NA))
  )
data3 <- data3 %>%
  mutate(
    SSS = sss.fatigue_num + 
      sss.Waking.unrefreshed_num + 
      sss.cognitive.symptoms_num + 
      sss.lower.abdomen_num + 
      sss.depression_num + 
      sss.headache_num
  )

table(is.na(data3$SSS))

#DN4
vars <- c(
 "DN4.burning",                   
 "DN4.painful.cold","DN4.electric" ,                 
 "DN4.tingling" ,  "DN4.pins" ,                  
 "DN4.numbness" , "DN4.itching" )

for (var in vars) {
  cat("=== 变量:", var, "===\n")
  print(table(data3[[var]], useNA = "always"))  
  cat("\n")
}
#DN4
data3 <- data3 %>%
  mutate(across(starts_with("DN4."), 
                ~ ifelse(.x == "Yes", 1, ifelse(.x == "No", 0, NA)))) %>%

  mutate(all_dn4_na = rowSums(!is.na(across(starts_with("DN4.")))) == 0) %>%
  mutate(
    DN4 = case_when(
      CP == "No" & all_dn4_na ~ 0,         # 全缺失且CP为No → 0
      all_dn4_na ~ NA_real_,               # 全缺失且CP不为No → NA
      TRUE ~ rowSums(across(starts_with("DN4.")), na.rm = TRUE)  # 部分缺失 → 缺失视为0
    )
  ) %>%
  select(-all_dn4_na) 

table(data3$DN4,useNA="ifany")

data3 <- data3 %>%
  mutate(
    DN4 = case_when(
      DN4 >= 3 ~ "NP",
      DN4 < 3 ~ "nonNP",
      TRUE ~ NA_character_  
    )
  )

##BPI
vars <- c("BPI.worst.pain","BPI.least.pain","BPI.average.pain","BPI.now.pain",
          "BPI.general.activity","BPI.mood","BPI.walking.ability",
          "BPI.normal.work","BPI.relationship","BPI.sleep","BPI.enjoyment")

for (var in vars) {
  cat("=== 变量:", var, "===\n")
  print(table(data3[[var]], useNA = "always"))  
  cat("\n")
}

## BPI
pain_vars <- c("BPI.worst.pain", "BPI.least.pain", "BPI.average.pain", "BPI.now.pain")

#  
data3 <- data3 %>%
  mutate(across(all_of(pain_vars), ~ ifelse(CP == "No" & is.na(.), 0, .)))

for (var in pain_vars) {
  cat("=== 变量:", var, "===\n")
  print(table(data3[[var]], useNA = "always"))  
  cat("\n")
}

data3 <- data3 %>%
   
  mutate(across(BPI.general.activity:BPI.enjoyment, as.numeric)) %>%
  
  mutate(
    BPI.interference = case_when(
      
      CP == "No" & rowSums(!is.na(select(., BPI.general.activity:BPI.enjoyment))) == 0 ~ 0,
       
      rowSums(!is.na(select(., BPI.general.activity:BPI.enjoyment))) > 0 ~ 
        rowSums(across(BPI.general.activity:BPI.enjoyment, ~ ifelse(is.na(.), 0, .))),
      
      TRUE ~ NA_real_
    )
  )

table(data3$BPI.interference, useNA = "ifany")

##Calculate the follow-up period
data3 <- data3 %>%
  mutate(
    d_attended_date = as.Date(d.attended, format = "%Y/%m/%d"),
    d_completed_date = as.Date(gsub("T.*", "", d.completed)),
    followup_years = as.numeric(d_completed_date - d_attended_date) / 365
  )


head(data3 %>% select(d.attended, d.completed, followup_years))
summary(data3$followup_years)

## 
rating_vars <- grep("^rating\\.", names(data3), value = TRUE)
data3 <- data3 %>%
  mutate(
    across(
      all_of(rating_vars),
      ~ case_when(
        .x == "No pain or discomfort" ~ "No",
        .x %in% c("Pain with unspecified rating", as.character(0:10)) ~ "Yes",
        TRUE ~ NA_character_
      ),
      .names = "bin.{gsub('rating\\\\.', '', .col)}"  
    )
  )

bin_vars <- grep("^bin\\.", names(data3), value = TRUE)
data3 <- data3 %>%
  mutate(across(all_of(bin_vars), 
                ~ ifelse(CP == "No" & is.na(.), "No", .)))

####keep necessary variables#####
write.csv(data3[, c("ID","age","sex","ethnic","edu","DTI","employment","marry",
                  "depression.cov","heart.problems","diabetes","cancer",
                  "major.depression","noncancer.illness.neurological","BMI",
                  "sleep.quality","physical.activity","smoking","drinking",
                  "diet","CTS","ATQ","LTE","Pain","CP","WPI.v1","SSS",
                  "DN4","BPI.worst.pain","BPI.least.pain","BPI.average.pain",
                  "BPI.now.pain","BPI.interference","rating.general" ,               
                  "rating.head","rating.face","rating.neck","rating.back",                 
                  "rating.stomach","rating.hip","rating.knee", "rating.arm",                  
                  "rating.hand","rating.feet","rating.leg", "rating.chest",
                  "followup_years","bin.general", "bin.head", "bin.face", "bin.neck", "bin.back", 
                  "bin.stomach", "bin.hip", "bin.knee", "bin.arm", "bin.hand", 
                  "bin.feet", "bin.leg", "bin.chest")],"data.cleaned.csv", row.names = FALSE)




