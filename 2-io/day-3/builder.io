Builder := Object clone do (
  indent := ""
)

Builder forward := method(
  writeln(self indent, "<", call message name, ">")
  self indent := self indent .. "  "
  call message arguments foreach(arg,
    content := self doMessage(arg);
    if(content type == "Sequence", writeln(self indent .. content))
  )
  self indent := self indent exSlice(0, -2)
  writeln(self indent, "</", call message name, ">")
)

Builder ul(
  li("Io"),
  li("Lua"),
  li("JavaScript")
)
