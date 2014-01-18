fib := method(n,
  if(n < 2, return n)
  last := 1
  current := 1
  for(i, 2, n - 1,
    tmp := last
    last = current
    current = current + tmp
  )
  return current
)

fib(1) println
fib(4) println
