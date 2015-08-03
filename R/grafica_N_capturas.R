library(ggplot2)
library(stringr)

filename = "callaoprueba.csv"
num.species = 4
xlabel = "Caletas"
ylabel = "Captura (t)"

# Read data file
data = read.csv(file = filename, stringsAsFactors = FALSE)

# Add possible filters here
data$CAPTURA = data$CAPTURA/1000

# 
total.catch = tapply(data$CAPTURA, data$ESP_VNOMCOM, sum, na.rm = TRUE)
o = order(total.catch, decreasing = TRUE)
total.catch = total.catch[o]
species.catch = names(total.catch)[1:num.species]

#
data.species = data[data$ESP_VNOMCOM %in% species.catch, ]
data.others = data[!(data$ESP_VNOMCOM %in% species.catch), ]

data.others[!(names(data.others) %in% c("LUG_VDESCRI", "VIAJES", "CAPTURA"))] = NA
data.others = aggregate(. ~ LUG_VDESCRI, data = data.others, na.action = na.pass, FUN = sum, na.rm = TRUE)
data.others$ESP_VNOMCOM = "Otros"

data.new = merge(data.species, data.others, all = TRUE, sort = T)

names.spec = function(x, split = ",")
{
  x = trimws(x)
  x = strsplit(x, split)
  x = lapply(x, trimws)
  x = sapply(x, function(x) x[1])
  return(x)
}

data.new$LUG_VDESCRI = names.spec(data.new$LUG_VDESCRI)
data.new$LUG_VDESCRI = str_to_title(data.new$LUG_VDESCRI)
data.new$ESP_VNOMCOM = names.spec(data.new$ESP_VNOMCOM)
data.new$ESP_VNOMCOM = factor(data.new$ESP_VNOMCOM, levels = c(names.spec(species.catch), "Otros"), ordered = TRUE)

o = order(data.new$ESP_VNOMCOM)

ggplot(data.new, aes(LUG_VDESCRI, fill=ESP_VNOMCOM, weight = CAPTURA)) +
  geom_bar(colour = "black") +
  scale_fill_discrete(name = "Principales\nEspecies",
                      breaks = levels(data.new$ESP_VNOMCOM),
                      labels = paste0(levels(data.new$ESP_VNOMCOM), " (", round(data.new$CAPTURA[o]), "t)")) +
  theme(legend.text = element_text(size = 15)) +
  theme(legend.title = element_text(size = 15)) +
  xlab(xlabel) + ylab(ylabel) +
  theme(axis.title = element_text(size = 15)) +
  theme(axis.text.x = element_text(colour = "black", angle = 45, size = 15))
