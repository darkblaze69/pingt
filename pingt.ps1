param( [string]$HostName, [int]$BufferSize=32 )

function main {
    param ( [string]$HostName,[int]$BufferSize )
    $start = Get-Date
    $count = 0
    $success = 0
    $rttArray = @()
    $host.ui.RawUI.WindowTitle = "Pinging $HostName"
    try {
        while($true){
            $ping = Test-Connection $HostName -BufferSize $BufferSize -Count 1 -ErrorAction SilentlyContinue
            if ($ping) {
                $success ++
                "$((Get-Date).ToString('HH:mm:ss')) Reply from $($ping.ProtocolAddress): bytes=$($ping.ReplySize) time=$($ping.ResponseTime)ms TTL=$($ping.TimeToLive)"
                $rttArray += [int]($ping.ResponseTime)
                } # if ping
            else { "$((Get-Date).ToString('HH:mm:ss')) Request timed out." }
            $count ++
            Start-Sleep -Milliseconds 800
            } #while
        } #try
    
    finally { 
        $finish = Get-Date
        $totaltime = ($finish - $start).TotalSeconds
        $loss = [math]::Round(($count - $success) / $count * 100,1)
        $rttmin = [math]::Round(($rttArray | Measure-Object -Minimum).Minimum,1)
        $rttmax = [math]::Round(($rttArray | Measure-Object -Maximum).Maximum,1)
        $rttavg = [math]::Round(($rttArray | Measure-Object -Average).Average,1)
        Write-Host "`n--- $HostName ping statistics ---"
        if ($success -gt 0 ) { Write-Host "response min/avg/max = $($rttmin)/$($rttavg)/$($rttmax) ms" }
        Write-Host "$success packets transmitted, $($count-$success) failed, $loss% packet loss, time $([math]::Round($totaltime,2)) sec"
        } # finally
} # function

if (-not ($HostName)) {"Pingt - Pinging with timestamp`nNo host specified`nUsage: pingt.ps1 HOSTNAME [-BufferSize 32]"; break }
main -HostName $HostName -BufferSize $BufferSize
