Get-PnpDevice -Class AudioEndpoint -Status OK |
    Select-Object -Property FriendlyName |
    Sort-Object -Property FriendlyName
