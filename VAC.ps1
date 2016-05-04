function SetUpVAC {
    Start-Process -FilePath .\VAC_Speakers.bat -WindowStyle Hidden
    Start-Process -FilePath .\VAC_Dac.bat -WindowStyle Hidden
}

SetUpVAC