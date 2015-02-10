read.template <- function(fileName, sheetName)
{
  library(xlsx)
  #Loading required package: rJava
  #Loading required package: xlsxjars
  
  fileName = "Plantillas pelagicos.xlsx"
  
  if(sheetName = "Anchoveta")
  {
    tabla = read.xlsx(file = fileName, sheetName = sheetName, startRow = 21, endRow = 52, colIndex = 2:11)
    laboratorio = read.xlsx(file = fileName, sheetName = sheetName, rowIndex = 6, colIndex = 4, header = FALSE)
    Date = read.xlsx(file = fileName, sheetName = sheetName, rowIndex = 7, colIndex = 13:15, header = FALSE)
    d = Date[1]
    m = Date[2]
    y = Date[3]
    
    header = read.xlsx(file = fileName, sheetName = sheetName, rowIndex = 20, colIndex = 3:11, header = FALSE, stringsAsFactors = FALSE)
    
    anchoveta = read.xlsx(file = fileName, sheetName = sheetName, startRow = 21, endRow = 52, colIndex = 2:5)
    colnames(anchoveta)[2:4] = header[1:3]
    samasa = read.xlsx(file = fileName, sheetName = sheetName, startRow = 21, endRow = 52, colIndex = c(2,6:8))
    colnames(samasa)[2:4] = header[4:6]
    sardina = read.xlsx(file = fileName, sheetName = sheetName, startRow = 21, endRow = 52, colIndex = 9:11)
    colnames(sardina)[2:3] = header[8:9]
  }
  
  if(sheetName = "Jurel Caballa")
  {
    tabla = read.xlsx(file = fileName, sheetName = sheetName, startRow = 21, endRow = 62, colIndex = 2:11)
    laboratorio = read.xlsx(file = fileName, sheetName = sheetName, rowIndex = 6, colIndex = 4, header = FALSE)
    puerto = read.xlsx(file = fileName, sheetName = sheetName, rowIndex = 6, colIndex = 9, header = FALSE)
    Date = read.xlsx(file = fileName, sheetName = sheetName, rowIndex = 7, colIndex = 13:15, header = FALSE)
    d = Date[1]
    m = Date[2]
    y = Date[3]
    
    header = read.xlsx(file = fileName, sheetName = sheetName, rowIndex = 20, colIndex = 3:14, header = FALSE, stringsAsFactors = FALSE)
    
    jurel = read.xlsx(file = fileName, sheetName = sheetName, startRow = 21, endRow = 62, colIndex = 2:5)
    colnames(jurel)[2:4] = header[1:3]
    caballa = read.xlsx(file = fileName, sheetName = sheetName, startRow = 21, endRow = 62, colIndex = c(2,6:8))
    colnames(caballa)[2:4] = header[4:6]
    bonito = read.xlsx(file = fileName, sheetName = sheetName, startRow = 21, endRow = 62, colIndex = c(2,9:11))
    colnames(bonito)[2:4] = header[7:9]
    jurelFino = read.xlsx(file = fileName, sheetName = sheetName, startRow = 21, endRow = 62, colIndex = c(2,12:14))
    colnames(jurelFino)[2:4] = header[10:12]
  }
}
