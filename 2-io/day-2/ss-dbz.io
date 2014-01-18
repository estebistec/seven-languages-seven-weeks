baseDivide := Number getSlot("/")
Number / := method(d,
  if(d != 0, return self baseDivide(d), return 0)
)

4 / 0 println
4 / 2 println
