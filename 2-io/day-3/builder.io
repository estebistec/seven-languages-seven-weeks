OperatorTable addAssignOperator(":", "atPutPair")

curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doMessage(arg)
  )
  r
)

Map atPutPair := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

Builder := Object clone do (
  indent := ""
)

Builder forward := method(

  write(self indent, "<", call message name)
  arguments := call message arguments
  first := arguments at(0)
  if(first name == "curlyBrackets",
    attributes := self doMessage(first)
    arguments = arguments slice(1),
    attributes := {}
  )
  attributes foreach(name, value,
    write(" " .. name .. "=\"" .. value .. "\"")
  )
  writeln(">")

  self indent := self indent .. "  "

  call message arguments foreach(arg,
    content := self doMessage(arg);
    if(content type == "Sequence", writeln(self indent .. content))
  )
  self indent := self indent exSlice(0, -2)
  writeln(self indent, "</", call message name, ">")
)

doFile("html.io")
