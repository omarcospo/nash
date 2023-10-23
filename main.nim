import nativesockets, osproc, std/paths, strutils

let host = getHostname()
let pwd = getCurrentDir().string
let prompt = "[" & host & "] " & pwd & " "

proc cd(input: string): string =
  if startsWith(input, "cd"):
    let splited = split(input, " ")
    write(stdout, "that you path: " & splited[1] & "\n")


while true:
  # -> PROMPT
  write(stdout, prompt)
  let input = readLine(stdin)
  # -> INPUT
  let result = execProcess("dash -c " & "\"" & input & "\"")
  write(stdout, result)
  let cd = cd(input)
  #CASE
  case input
  of "exit":
      break
