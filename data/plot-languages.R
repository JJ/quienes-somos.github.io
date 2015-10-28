
library("ggplot2")
language.province <- read.csv("place-language.csv")
language.top25 <- as.data.frame(summary(language.province$language, max=25))
language.top25.df <- data.frame(language=row.names(language.top25), 
                                devs=language.top25$"summary(language.province$language, max = 25)")

ggplot()+geom_bar(data=language.top25.df,aes(reorder(language,devs),y=devs),stat="identity")+coord_flip()+theme_bw()
ggplot( data=language.top25.df, aes(x="",y=devs,fill=factor(language)))+ geom_bar(width=1,stat='identity') + coord_polar(theta='y') + scale_fill_grey(start=0.1, end=1)+theme_bw()
ggplot(language.province, aes(language)) + geom_bar() + facet_wrap(~ Scope)

language.madrid <- language.province[language.province$Scope=="Madrid",]
language.madrid.top25 <- as.data.frame(summary(language.madrid$language, max=25))
language.madrid.top25.df <- data.frame(language=row.names(language.madrid.top25), 
                                       devs=language.madrid.top25$"summary(language.madrid$language, max = 25)")

ggplot()+geom_bar(data=language.madrid.top25.df,aes(reorder(language,devs),y=devs),stat="identity")+coord_flip()+theme_bw()
