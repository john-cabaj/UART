setMode -bs
setMode -bs
setCable -port auto
Identify 
identifyMPM 
setMode -bs
addDevice -p 3 -file "C:/Documents and Settings/cabaj/My Documents/Downloads/spart/top_level.bit"
deleteDevice -position 4
Program -p 3 
Program -p 3 
saveProjectFile -file "C:/Documents and Settings/cabaj/My Documents/Downloads/spart/spart.ipf"
setMode -bs
deleteDevice -position 1
deleteDevice -position 1
deleteDevice -position 1
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
setMode -bs
