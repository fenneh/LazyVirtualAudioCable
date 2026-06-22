# LazyVirtualAudioCable

![CI](https://github.com/fenneh/LazyVirtualAudioCable/actions/workflows/ci.yml/badge.svg)

One-click Virtual Audio Cable configuration. Because clicking through audio settings repeatedly is not how anyone wants to spend their evening.

## Setup

1. Edit `VAC_Speakers.bat` and `VAC_Dac.bat`. Set `arInput` and `arOutput` to the device names as they appear in Audio Repeater's dropdown. The names must match exactly.

2. Run `VAC.ps1` to start the repeaters.

For automatic startup, run `Register-ScheduledTask.ps1` as administrator once. It registers a logon task that runs `VAC.ps1` each time you sign in.

## Scripts

- `VAC.ps1` - runs both batch scripts
- `Stop-VAC.ps1` - kills any running audio repeater processes
- `VAC_Speakers.bat` - configures speaker routing
- `VAC_Dac.bat` - configures DAC routing
- `Register-ScheduledTask.ps1` - registers a logon scheduled task for `VAC.ps1`

## Requirements

- Virtual Audio Cable installed
- PowerShell
