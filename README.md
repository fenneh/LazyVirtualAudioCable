# LazyVirtualAudioCable

![CI](https://github.com/fenneh/LazyVirtualAudioCable/actions/workflows/ci.yml/badge.svg)

One-click Virtual Audio Cable configuration. Because clicking through audio settings repeatedly is not how anyone wants to spend their evening.

## Usage

Run `VAC.ps1` to start the audio repeaters.

To have it run automatically at every login, run `Register-ScheduledTask.ps1` once as administrator. It registers a scheduled task that fires `VAC.ps1` on logon, then you never have to think about it again.

## Scripts

- `VAC.ps1` - runs both batch scripts
- `Stop-VAC.ps1` - kills any running audio repeater processes
- `VAC_Speakers.bat` - configures speaker routing
- `VAC_Dac.bat` - configures DAC routing
- `Register-ScheduledTask.ps1` - registers a logon scheduled task for `VAC.ps1`

## Requirements

- Virtual Audio Cable installed
- PowerShell
