squareBrackets := method(
  call message arguments
)

l := [0,1,2,3]
writeln(l type)
writeln(l at(2))

List squareBrackets := method(index,
  return self at(index)
)

writeln(l[2])
