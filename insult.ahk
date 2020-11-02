#Warn  ; Enable warnings to assist with detecting common errors.
linenum := 1 ;assumes first time running and start at insult number 1

F7:: ;share AHK script URL for those who want to use it
Send, https://github.com/aplawson/insult-generator {Enter}
return

F6:: ;resets script to paste insults starting from line #1 again
linenum := 1
return

F5:: ;paste insult into chat
insult := GetNextInsult(linenum)
Send, %insult% {Enter}
linenum++
return

GetNextInsult(ln) {
    Loop
    {
        FileReadLine, line, insults.txt, %A_Index% ;read line # from file (A_Index)
        If (A_Index = ln)
        {
            break ;don't read next line (yet)
        }
    }
    return %line%
}
