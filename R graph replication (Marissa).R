waterstats<-data.frame(treatment=levels(waterstats$status), mean=(tapply(waterstats$avgdailypercent, waterstats$status, mean)),n=tapply(waterstats$avgdailypercent, waterstats$status, length),sd=tapply(waterstats$avgdailypercent, waterstats$status, sd))
waterstats$sem<-waterstats$sd/sqrt(waterstats$n)
require(ggplot2)
graphic.name<- ggplot(waterstats, aes(x=treatment, y=mean, fill=treatment))
graphic.name +
  geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymin=mean-waterstats$sem, ymax=mean+waterstats$sem)) +
  labs(
    x="Reproductive Status",
    y="Percent body weight lost daily")