param(
    [Parameter(Mandatory = $true)]
    [string]$InputDevice,
    [Parameter(Mandatory = $true)]
    [string]$OutputDevice,
    [int]$SamplingRate = 96000,
    [int]$BitsPerSample = 24,
    [int]$Channels = 2,
    [string]$ChanCfg = "Stereo",
    [int]$BufferMs = 100,
    [int]$Buffers = 10,
    [string]$Priority = "High"
)

$arPath = "C:\Program Files\Virtual Audio Cable\audiorepeater.exe"
$argumentList = "/Input:`"$InputDevice`" /Output:`"$OutputDevice`" /SamplingRate:$SamplingRate /BitsPerSample:$BitsPerSample /Channels:$Channels /ChanCfg:`"$ChanCfg`" /BufferMs:$BufferMs /Buffers:$Buffers /Priority:$Priority /AutoStart"

Start-Process -FilePath $arPath -WindowStyle Hidden -ArgumentList $argumentList
