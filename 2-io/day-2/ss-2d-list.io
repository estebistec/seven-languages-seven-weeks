sum2dList := method(table,
  return table map(row, row sum) sum
)

table := list(
  list(1,2,3),
  list(4,5,6)
)

sum2dList(table) println

unevenTable := list(
  list(1),
  list(2,3),
  list(4,5,6)
)

sum2dList(unevenTable) println
