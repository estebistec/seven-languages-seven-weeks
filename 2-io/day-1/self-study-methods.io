Vehicle := Object clone
Vehicle description := "Takes persons and/or things to one or more places"

Car := Vehicle clone
Car drive := method("Vroom" println)

Ferrari := Car clone
myFerrari := Ferrari clone

myFerrari drive
