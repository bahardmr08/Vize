dosya_url <- "https://raw.githubusercontent.com/scizmeli/Red/master/MapsThatChangedOurWorld_StoryMap_Data.csv"
dosya_isim <- "MapsThatChangedOurWorld_StoryMap_Data.csv"
download.file(dosya_url, destfile = dosya_isim, method = "auto")
maps <- read.csv(dosya_isim, sep = ";", header = TRUE)
#1.2
maps <- read.csv("MapsThatChangedOurWorld_StoryMap_Data.csv",sep=";", header = TRUE) #maps ad??nda bir de??i??kene indirdi??imiz cvs dosyas??n?? okutturduk.sep e dikkat et (;)
if(dim(maps)[1]==10 && dim(maps)[2]==9){ #dim fonksiyonu boyutu verir // verilen csv dosyas?? 2 boyutlu oldu??u i??in her boyutunun istenilen boyuta uygun olup olmad??????n?? kontrol ettik.
  print("tamam")
}else{
  print("hatal??")
}
library(dplyr)
library(ggplot2)

#1.3

maps <- maps %>% mutate(Latitude = gsub("[^0-9.]", "", Latitude))
#1.4
idx <- which(grepl("W", maps$Longitude))
#1.5
maps <- maps %>%
  mutate(Longitude = gsub("[EW]", "", Longitude))
#1.6 
maps <- maps %>%
  mutate(Year = as.numeric(gsub("AD", "", Year)))

#1.7 
maps <- maps %>%
  mutate(
    Longitude = as.numeric(gsub("[^0-9.-]", "", Longitude)),
    Latitude = as.numeric(gsub("[^0-9.-]", "", Latitude))
  )

#1.8 
ggplot(maps, aes(x = as.numeric(gsub("AD", "", Year)))) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Years", x = "Year", y = "Frequency")
#1.9 
maps <- maps %>%
  mutate(Longitude = ifelse(row.names(maps) %in% idx, -1 * Longitude, Longitude))



