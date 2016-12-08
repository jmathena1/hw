##sudo apt-get install r-cran-slam
#install.packages('tm')


### this will aquire a lot of data. you might have to rm some of the big objects on the way
### since the variables are all 'global'
rm(list=ls())
library(tm)
library(ggplot2)   
library(arabicStemR)

library(wordcloud)   

### set the directory with files. you might have several corpuses or one file for each article
#### just skipt this for at this moment.

# cname<-file.path("C:/Users/John/Documents/alwatan")
# ### read the data into the 'Corpus' object
# docs <- Corpus(DirSource(cname)) 

### this step comes later..
# TermDocumentMatrix(data[4], control = list(wordLengths = c(3,10)))
# TermDocumentMatrix(Corpus(DataframeSource(data.frame(data[,4]))))

### an alternative way to load data
## you have to set header=FALSE
filename<-"ahram_stem_tr.csv"##"alwatan2011.500lines.csv"
data <- read.csv(filename, encoding = "UTF-8",sep = ",",header = FALSE,stringsAsFactors=F)

### some additional cleaning.

data[,2] <- gsub("[[:punct:]]", " ", data[,2])  # replace punctuation with space
data[,2] <- gsub("[[:cntrl:]]", " ", data[,2])  # replace control characters with space
data[,2] <- gsub("^[[:space:]]+", "", data[,2]) # remove whitespace at beginning of documents
data[,2] <- gsub("[[:space:]]+$", "", data[,2]) # remove whitespace at end of documents
data[,2] <- gsub("[0-9]", "", data[,2]) #remove numbers
data[,2]<- gsub("[:alpha:]","", data[,2])

my.input.data<-data.frame(data[,2],stringsAsFactors = F)



stop.words<-scan(file="stopwords_ar.txt",what = "", sep="\n",encoding = "UTF-8")
stop.words<-paste(stop.words,collapse = " ")


docs <- Corpus(DataframeSource(data.frame(as.character(my.input.data))))

#docs <- tm_map(docs, removeWords, stop.words)## doesn't seem to work
#docs <- tm_map(docs, stripWhitespace)
docs <- tm_map(docs, PlainTextDocument)   
dtm <- DocumentTermMatrix(docs)
#dtms <- removeSparseTerms(dtm, 0.1)
#inspect(dtms)


freq <- sort(colSums(as.matrix(dtm)), decreasing=TRUE)
rel.freq <- freq / sum(freq)

wf <- data.frame(word=names(freq), freq=freq)   
head(wf)  

#freq <- colSums(as.matrix(dtm))   

ord <- order(freq)   


freq[tail(ord)]   ## most frequ words


set.seed(124)   
png("/home/tobias/Dokumente/islamicate2.0/hw/newspaper_group/pics/alwatan.png", width=1280,height=800)
pal2 <- brewer.pal(8,"Dark2")
# wordcloud(names(freq), freq, max.words=100)   

wordcloud(names(rel.freq),  freq,scale=c(3,1),max.words = 100,colors=pal2)
dev.off()

### first transliterate stop-words and text -> then remove stopwords
# stop.words.transliterated<-stem(stop.words, cleanChars = TRUE, cleanLatinChars = TRUE, transliteration = TRUE, returnStemList = FALSE)
# text.c<-stem(my.input.data[], cleanChars = TRUE, cleanLatinChars = TRUE, transliteration = TRUE, returnStemList = FALSE)
# stem(head(data[,4]), cleanChars = TRUE, cleanLatinChars = TRUE, transliteration = FALSE, returnStemList = FALSE)

#my.input.data<-removeWords(as.character(my.input.data[,1]), stop.words)

library(ggplot2)
p <- ggplot(subset(wf, freq>13476 & freq<18000), aes(word, freq))    
p <- p + geom_bar(stat="identity")   
p <- p + theme(axis.text.x=element_text(angle=45, hjust=1)) 
p


