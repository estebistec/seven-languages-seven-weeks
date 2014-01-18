HasNonNumbers := Exception clone

list proto myAverage := method(
  nonNumberElementTypes := self map(e, e type) select(t, t != Number type)
  if(nonNumberElementTypes size > 0,
    nonNumberTypeList := nonNumberElementTypes map(e, e asString) sum
    HasNonNumbers raise("Has elements of types: #{nonNumberTypeList}" interpolate)
  )
  return (self sum) / (self size)
)

list(1,2,3,4,5,6) myAverage println
list(1,2,3,4,5,"6") myAverage println
