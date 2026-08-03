# LazyVirtualAudioCable

![CI](https://github.com/fenneh/LazyVirtualAudioCable/actions/workflows/ci.yml/badge.svg)

One-click Virtual Audio Cable configuration. Because clicking through audio settings repeatedly is not how anyone wants to spend their evening.

## Setup

1. Edit `VAC.ps1`. Set `-InputDevice` and `-OutputDevice` to the device names as they appear in Audio Repeater's dropdown. The names must match exactly.

2. Run `VAC.ps1` to start the repeaters.

For automatic startup, run `Register-ScheduledTask.ps1` as administrator once. It registers a logon task that runs `VAC.ps1` each time you sign in. To remove it, run `Unregister-ScheduledTask.ps1` as administrator.

## Scripts

- `VAC.ps1` - starts the repeaters; edit this to set your device names
- `Start-AudioRepeater.ps1` - launches a single audiorepeater instance with given devices
- `Stop-VAC.ps1` - kills any running audio repeater processes
- `Restart-VAC.ps1` - stops running repeaters and starts fresh
- `Get-VACStatus.ps1` - reports whether audio repeaters are currently running
- `Register-ScheduledTask.ps1` - registers a logon scheduled task for `VAC.ps1`
- `Unregister-ScheduledTask.ps1` - removes the logon scheduled task

## Requirements

- Virtual Audio Cable installed
- PowerShell
