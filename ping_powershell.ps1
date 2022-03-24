function ping-ip {

    try{
        $startip = Read-Host -Prompt 'Start IP Address: '

        $first3oct = ($startip -split "\.")[0..2] -join "."
        $startdigit = $startip.Split('.')[-1]
        $startdigit = [int]$startdigit

        $endip = Read-Host -Prompt 'End IP Address: '
        $enddigit = $endip.Split('.')[-1]
        $enddigit = [int]$enddigit




        #validate the start is smaller than end
        if ($enddigit -lt $startdigit){
            throw
        }

    }

    catch{
        "Not valid input!"
        exit

    }


    while ($startdigit -le $enddigit) {

        $IP = $first3oct + '.' + $startdigit 

        $result = Test-Connection -ComputerName $IP -count 1 -Quiet

        if ($result -match "True") {
       
            Write-Host "$IP is UP" -ForegroundColor Cyan
        } else {
            Write-Host "$IP is NOT pingable" -ForegroundColor Yellow
        }

    $startdigit++
    }
}

ping-ip 