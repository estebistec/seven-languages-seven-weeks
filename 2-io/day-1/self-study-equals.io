// From: http://iolanguage.org/scm/io/docs/IoGuide.html#Syntax-Assignment
// These are all compiled to standard messages messages

// :=  Creates slot, assigns value
MyType := Object clone  // A slot of Lobby
MyType description := "An example"  // A slot of MyType

// =  Assigns value to slot if it exists, otherwise raises exception
MyType description = "An example type object"

// ::=  Creates slot, creates setter, assigns value
MyType name ::= "Default name"

// What is a "setter"?
myThing := MyType clone
myThing setName("my actual thing")
myThing name println
