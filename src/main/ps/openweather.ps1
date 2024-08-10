# Fetch JSON data from the URL / jsonMessage
cd $PSScriptRoot
$json = Get-Content -Path '.\..\..\test\resources\weatherMessage.json' -Raw

# Convert JSON response to a PowerShell object
$jsonData = $json | ConvertFrom-Json

$jsonDataHourly = $jsonData.hourly

# Extract data using JSONPath
$hourlyData = $jsonData.hourly | ForEach-Object {
		$weatherDescription = $_.weather | ForEach-Object { "$($_.main) ($($_.description))" }
        [PSCustomObject]@{
			DT = [System.TimeZoneInfo]::ConvertTimeFromUtc((Get-Date 01.01.1970).AddSeconds($_.dt), [System.TimeZoneInfo]::FindSystemTimeZoneById((Get-WmiObject win32_timezone).StandardName)).ToString('yyyy-MM-dd HH')
            FeelsLike = [Math]::Round($_.feels_like, 0).ToString("N0")
            WindSpeed = [Math]::Round($_.wind_speed, 0).ToString("N0")
			WeatherDescription = $weatherDescription -join ", "
        }
    }

# Display data in a tabular format
$hourlyData | Format-Table -Property @{Expression={$_.DT}; Label="DateTime"}, @{Expression={$_.FeelsLike}; Label="FeelsLike"; Alignment="Center"}, @{Expression={$_.WindSpeed}; Label="WindSpeed"; Alignment="Center"}, @{Expression={$_.WeatherDescription}; Label="WeatherDescription"}


$jsonDataAlerts = $jsonData.alerts

if ($null -ne $jsonDataAlerts) {
	 Write-Output "Weather alerts:"
    $jsonDataAlerts | ForEach-Object {
        $prettifiedAlert = [PSCustomObject]@{
            SenderName = $_.sender_name
            Event = $_.event
            Start = [System.TimeZoneInfo]::ConvertTimeFromUtc((Get-Date 01.01.1970).AddSeconds($_.start), [System.TimeZoneInfo]::FindSystemTimeZoneById((Get-WmiObject win32_timezone).StandardName)).ToString('yyyy-MM-dd HH:mm:ss')
            End = [System.TimeZoneInfo]::ConvertTimeFromUtc((Get-Date 01.01.1970).AddSeconds($_.end), [System.TimeZoneInfo]::FindSystemTimeZoneById((Get-WmiObject win32_timezone).StandardName)).ToString('yyyy-MM-dd HH:mm:ss')
            Description = $_.description
            Tags = $_.tags -join ", "
        }
        $prettifiedAlert | ConvertTo-Json -Depth 100 -EscapeHandling EscapeNonAscii | jq
    }
}

PAUSE
