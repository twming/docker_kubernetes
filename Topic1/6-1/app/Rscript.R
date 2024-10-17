install.packages('ggplot2')
require(ggplot2)
data=read.csv("olympics.csv")
data_gold=data[data$Medal=='Gold',]
data_gold$Participants=1
data_sum=aggregate(Participants~Edition+Gender, data_gold, sum)
ggplot(data_sum, aes(Edition, Participants,colour=Gender)) + geom_line() + geom_point()
ggsave("gold_participant.png")
