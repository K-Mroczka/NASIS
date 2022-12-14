##########Check NASIS Data in R
############ Most of this code is copied from D.E. Beaudette's "Thematic Sketches Introduction to SoilProfileCollection Objects" chapter 10.4 "Thematic Sketches" 
# this can be found at http://ncss-tech.github.io/AQP/aqp/aqp-intro.html
#I use this R script to check for blank spots while filling out data in NASIS.  It makes it easier to see when I am missing data or helps with spotting wrongly entered 
# data. The colored visuals make the entered data easy to see and intuitive to understand.  I often miss things when scrolling through tables and droped downs in 
#NASIS so this helps with QC of data entry. 





#Pedon Soil Profile Collection plot again, this time using new colors
library(aqp) # provides "SoilProfileCollection" object & more
library(soilDB) # provides database access methods

# get pedons from NASIS selected set
test1 <- fetchNASIS(from = 'pedons')

# inspect the result
str(test1, max.level = 2)

# make a profile plot

# set margins smaller than default
par(mar=c(1,1,1,1))

# make profile plot of selected set, with userpedonid as label
plot(test1, label='pedon_id')

test <- test1[3:16, ]  #######<------------ change these numbers to see different pedons in figures

# make profile plot of selected set, with userpedonid as label
plot(test, label='pedon_id')

#!!!!!!!!!!Clay Content!!!!! by horizon  https://ncss-tech.github.io/AQP/aqp/aqp-intro.html
par(mar=c(0,0,3,0)) # tighter figure margins
plotSPC(test, name='name', color='clay', col.label='Clay Content (%)',label='pedon_id')

plotSPC(test, name='name', color='sand', col.label='sand')

plotSPC(test, name='name', color='fragvoltot', col.label='rock fragments total')

plotSPC(test, name='name', color='phfield', col.label='pH',label='pedon_id')

plotSPC(test, name='name', color= 'effclass' , col.label='effclass',label='pedon_id')

plotSPC(test, name='name', color= 'effclass' , col.label='effclass',label='pedon_id')

# calculating silt%
library(aqp) # provides "SoilProfileCollection" object & more
library(soilDB) # provides database access methods

# get pedons from NASIS selected set
test <- fetchNASIS(from = 'pedons')

# calculating silt%
str(test, max.level = 2)
cl<-test$clay
sa<-test$sand
silt<-100-(cl+sa)
silt
View(test@horizons[["silt"]])
