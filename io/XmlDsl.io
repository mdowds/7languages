Builder := Object clone

Builder indent := 0

Builder make_indent := method(" " repeated(indent))

Builder forward := method(
    writeln(make_indent, "<", call message name, attrs, ">")
    indent = indent + 3
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(make_indent, content))
    )
    indent = indent - 3
    writeln(make_indent, "</", call message name, ">")
)

Builder ul(
    li("Io")
    li("Lua")
    li("JavaScript")
)
