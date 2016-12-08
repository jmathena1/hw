library(ggplot2)
p <- ggplot(subset(wf, freq), aes(word, freq))    
p <- p + geom_bar(stat="identity")   
p <- p + theme(axis.text.x=element_text(angle=45, hjust=1)) 
p
#wf is just this:  wf <- data.frame(word=names(freq), freq=freq)  
#freq is the data frame of the MFWs and their frequency
#you can make the entire freq variable as an argument for ggplot but it make be too big
#I had to play around with it some for the previous histograms I made