BeforeAll {
    $script:repoRoot = Split-Path -Parent $PSScriptRoot
}

Describe 'Start-AudioRepeater.ps1' {
    BeforeEach {
        Mock Test-Path { $true }
        Mock Start-Process
    }

    It 'starts audiorepeater with the requested devices' {
        & "$script:repoRoot/Start-AudioRepeater.ps1" `
            -InputDevice 'Line 1 (Virtual Audio Cable)' `
            -OutputDevice 'Speakers (AudioQuest DragonFly)'

        Should -Invoke Start-Process -Times 1 -Exactly -ParameterFilter {
            $joined = $ArgumentList -join ' '
            $FilePath -eq 'C:\Program Files\Virtual Audio Cable\audiorepeater.exe' -and
            $joined.Contains('/Input:"Line 1 (Virtual Audio Cable)"') -and
            $joined.Contains('/Output:"Speakers (AudioQuest DragonFly)"')
        }
    }

    It 'passes the default format options' {
        & "$script:repoRoot/Start-AudioRepeater.ps1" -InputDevice 'in' -OutputDevice 'out'

        Should -Invoke Start-Process -Times 1 -Exactly -ParameterFilter {
            $joined = $ArgumentList -join ' '
            $joined.Contains('/SamplingRate:96000') -and
            $joined.Contains('/BitsPerSample:24') -and
            $joined.Contains('/Channels:2') -and
            $joined.Contains('/ChanCfg:"Stereo"') -and
            $joined.Contains('/BufferMs:100') -and
            $joined.Contains('/Buffers:10') -and
            $joined.Contains('/Priority:High') -and
            $joined.Contains('/AutoStart')
        }
    }

    It 'passes overridden format options' {
        & "$script:repoRoot/Start-AudioRepeater.ps1" -InputDevice 'in' -OutputDevice 'out' `
            -SamplingRate 44100 -BitsPerSample 16 -Channels 1 -BufferMs 50 -Buffers 4 -Priority Normal

        Should -Invoke Start-Process -Times 1 -Exactly -ParameterFilter {
            $joined = $ArgumentList -join ' '
            $joined.Contains('/SamplingRate:44100') -and
            $joined.Contains('/BitsPerSample:16') -and
            $joined.Contains('/Channels:1') -and
            $joined.Contains('/BufferMs:50') -and
            $joined.Contains('/Buffers:4') -and
            $joined.Contains('/Priority:Normal')
        }
    }

    It 'fails with a clear error when audiorepeater is not installed' {
        Mock Test-Path { $false }

        { & "$script:repoRoot/Start-AudioRepeater.ps1" -InputDevice 'in' -OutputDevice 'out' } |
            Should -Throw '*audiorepeater.exe not found*'

        Should -Invoke Start-Process -Times 0 -Exactly
    }
}

Describe 'Get-VACStatus.ps1' {
    It 'reports when no repeaters are running' {
        Mock Get-Process
        Mock Write-Host

        & "$script:repoRoot/Get-VACStatus.ps1"

        Should -Invoke Write-Host -Times 1 -Exactly -ParameterFilter {
            $Object -eq 'No audio repeaters running.'
        }
    }

    It 'lists the pids of running repeaters' {
        Mock Get-Process { @([pscustomobject]@{ Id = 123 }, [pscustomobject]@{ Id = 456 }) }
        Mock Write-Host

        & "$script:repoRoot/Get-VACStatus.ps1"

        Should -Invoke Write-Host -Times 1 -Exactly -ParameterFilter {
            $Object -eq '2 audio repeater(s) running (PID: 123, 456).'
        }
    }
}

Describe 'Stop-VAC.ps1' {
    It 'stops every running repeater' {
        Mock Get-Process { @([pscustomobject]@{ Id = 123 }, [pscustomobject]@{ Id = 456 }) }
        Mock Stop-Process

        & "$script:repoRoot/Stop-VAC.ps1"

        Should -Invoke Stop-Process -Times 2 -Exactly
    }

    It 'does nothing when no repeaters are running' {
        Mock Get-Process
        Mock Stop-Process

        & "$script:repoRoot/Stop-VAC.ps1"

        Should -Invoke Stop-Process -Times 0 -Exactly
    }
}
