import nativesockets, osproc, std/paths, strutils

let host = getHostname()
let pwd = getCurrentDir().string
let prompt = "[" & host & "] " & pwd & " "

proc cd(input: string): string =
  let splited = split(input, " ")
  try:
    write(stdout, "that you path: " & splited[1] & "\n")
  except:
    write(stdout, "Error: Input a path argument\n")


while true:
  # -> PROMPT
  write(stdout, prompt)
  # -> INPUT
  let input = readLine(stdin)
  #CASE
  case input
  of "exit":
    break
  if startsWith(input, "cd"):
    let cd = cd(input)
  else: 
    let result = execProcess("dash -c " & "\"" & input & "\"")
    write(stdout, result)
 
