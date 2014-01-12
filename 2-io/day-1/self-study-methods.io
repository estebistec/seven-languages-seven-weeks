Vehicle := Object clone
Vehicle description := "Takes persons and/or things to one or more places"

Car := Vehicle clone
Car drive := method("Vroom" println)
Car driveTo := method(place,
  self drive  // We need to make the noises, like when we were kids, right?!? :P
  self place := place
)

Ferrari := Car clone
myFerrari := Ferrari clone

myFerrari driveTo("Kansas City")
myFerrari place println
