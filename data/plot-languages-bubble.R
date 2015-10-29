
library("ggplot2")
place.lang.devs <- read.csv("place-language-devs.csv")
place.lang.devs.filtered <- place.lang.devs[place.lang.devs$Devs >= 10,]
ggplot()+geom_point(data=place.lang.devs.filtered,aes(x=Place,y=Language,size=Devs),color='red')+scale_size(range=c(1,10))+theme(axis.text.x = element_text(angle = 90, hjust = 1))
