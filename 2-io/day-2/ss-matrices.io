Matrix := List clone do(
  dim := method(x, y,
    // Truncate rows in case dim is called twice on a matrix
    self removeAll

    Range 0 to(x - 1) foreach(index,
      row := list()
      Range 0 to(y - 1) foreach(column, row append(nil))
      self append(row)
    )
  )
  get := method(x, y, return self at(x) at(y))
  set := method(x, y, newValue,
    oldValue := self get(x, y)
    self at(x) atPut(y, newValue)
    return oldValue
  )
  transpose := method(
    transposed := Matrix clone
    xSize := at(0) size
    ySize := self size
    transposed dim(xSize, ySize)
    Range 0 to(xSize - 1) foreach(x,
      Range 0 to(ySize - 1) foreach(y,
        transposed set(x, y, self get(y, x))
      )
    )
    return transposed
  )
  writeToFile := method(filePath,
    f := File with(filePath)
    f remove
    f openForUpdating
    self foreach(row,
      Range 0 to(row size - 1) foreach(column,
        if(column > 0, f write(","))
        f write(row at(column) asString)
      )
      f write("\n")
    )
    f close
  )
  readFromFile := method(filePath,
    f := File with(filePath)
    lines := f readLines
    f close

    self removeAll
    lines foreach(line,
      self append(line split(",") map(itemData, self _parseValue(itemData)))
    )
  )
  _parseValue := method(data,
    dataCleaned := data strip

    // TODO expand value parsing capabilities here
    if(dataCleaned == "nil", return nil)
    if(dataCleaned == "nan", return "nan" asNumber)  // TODO cleaner way to just get the nan value?
    maybeNumber := dataCleaned asNumber
    if(maybeNumber asString != "nan", return maybeNumber)
    return dataCleaned
  )
)

m := Matrix clone
m dim(2, 3)
m set(1, 2, "3")
m set(1, 1, "Z")
m get(1, 2) println
m println
m transpose writeToFile("matrix.csv")
m readFromFile("matrix.csv")
m println
