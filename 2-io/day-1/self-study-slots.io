// How can you tell what slots a prototype supports

Vehicle := Object clone
Vehicle description := "Takes persons and/or things to one or more places"

Car := Vehicle clone
Car drive := method("Vroom" println)

Ferrari := Car clone
myFerrari := Ferrari clone

// slotNames only tells you for the current object
// You could try a particular message and see if any prototype in the chain responds to it
// However, you can also trace the chain of prototypes to accumulate the supported slot names

myFerrari slotNames println
// ==> list()

myFerrari proto type println
// ==>  Ferrari

myFerrari proto slotNames println
// ==> list(type)

myFerrari proto proto type println
// ==>  Car

myFerrari proto proto slotNames println
// ==> list(type, drive)

myFerrari proto proto proto type println
// ==>  Vehicle

myFerrari proto proto proto slotNames println
// ==> list(type, description)

myFerrari proto proto proto proto type println
// ==>  Object


myFerrari proto proto proto proto slotNames println
// ==>  list(or, coroDo, returnIfError, ...)
