# PowerShell report

## 1. Overview
This project was built using Generative AI tools. From PowerShell, a weather URL from [OpenWeather](https://openweathermap.org/api) is invoked, and the message is parsed and transformed into a report that is displayed in Windows console. 
This version of the script works with a JSON message from OpenWeather that exists in file /test/resources/weatherMessage.json. The report is presented below.

## 2. Application run

The PowerShell v7 report could be built by invoking the PS file with Windows command line `pwsh openweather.ps1`, or with Eclipse and IDEA built-in capabilities to run PS scripts. 
Eclipse has also the plugin [EasyShell](https://marketplace.eclipse.org/content/easyshell). 

The system must also have installed the [JQ JSON parser](https://jqlang.github.io/jq/).

## 3. AWS features used
- [Amazon Q](https://aws.amazon.com/q/) Chat, [Free Tier](https://aws.amazon.com/q/developer/pricing/) version

## 4. Generative AI
The syntax of the script was generated and adjusted in IDEA IDE, using [Amazon Q Chat](https://plugins.jetbrains.com/plugin/24267-amazon-q). 
I had few ideas about PowerShell, but code generation in unknown languages is one of the rapidly growing use-cases of Generative AI. 
From an initial text that described the program in natural language, Amazon Q generated a first version, that I chaged according to business needs, with subsequent requests done in same chat session that was initiated. 

## 5. Report sample
```
DateTime      FeelsLike WindSpeed WeatherDescription
--------      --------- --------- ------------------
2024-08-09 22    24         1     Rain (light rain)
2024-08-09 23    24         3     Rain (heavy intensity rain)
2024-08-10 00    23         3     Rain (moderate rain)
2024-08-10 01    22         2     Clouds (overcast clouds)
2024-08-10 02    21         2     Clouds (overcast clouds)
2024-08-10 03    19         2     Clouds (overcast clouds)
2024-08-10 04    18         3     Clear (clear sky)
2024-08-10 05    18         2     Clear (clear sky)
2024-08-10 06    18         1     Clear (clear sky)
2024-08-10 07    19         1     Clear (clear sky)
2024-08-10 08    21         1     Clear (clear sky)
2024-08-10 09    24         2     Clear (clear sky)
2024-08-10 10    26         2     Clear (clear sky)
2024-08-10 11    28         2     Clouds (broken clouds)
2024-08-10 12    29         2     Clouds (broken clouds)
2024-08-10 13    30         3     Clouds (broken clouds)
2024-08-10 14    31         4     Clouds (broken clouds)
2024-08-10 15    32         4     Clouds (broken clouds)
2024-08-10 16    32         4     Clear (clear sky)
2024-08-10 17    32         4     Clear (clear sky)
2024-08-10 18    32         4     Clear (clear sky)
2024-08-10 19    31         4     Clouds (few clouds)
2024-08-10 20    29         4     Clouds (few clouds)
2024-08-10 21    27         3     Clouds (few clouds)
2024-08-10 22    25         2     Clear (clear sky)
2024-08-10 23    24         3     Clear (clear sky)
2024-08-11 00    23         3     Clear (clear sky)
2024-08-11 01    23         3     Clear (clear sky)
2024-08-11 02    22         3     Clear (clear sky)
2024-08-11 03    22         2     Clear (clear sky)
2024-08-11 04    21         2     Clear (clear sky)
2024-08-11 05    21         2     Clear (clear sky)
2024-08-11 06    20         2     Clear (clear sky)
2024-08-11 07    21         2     Clear (clear sky)
2024-08-11 08    24         3     Clear (clear sky)
2024-08-11 09    27         3     Clear (clear sky)
2024-08-11 10    29         3     Clear (clear sky)
2024-08-11 11    30         3     Clear (clear sky)
2024-08-11 12    31         2     Clear (clear sky)
2024-08-11 13    33         2     Clear (clear sky)
2024-08-11 14    34         2     Clear (clear sky)
2024-08-11 15    34         3     Clear (clear sky)
2024-08-11 16    34         3     Clear (clear sky)
2024-08-11 17    34         3     Clear (clear sky)
2024-08-11 18    34         3     Clear (clear sky)
2024-08-11 19    33         3     Clear (clear sky)
2024-08-11 20    30         3     Clear (clear sky)
2024-08-11 21    28         3     Clear (clear sky)

Weather alerts:
{
  "SenderName": "Administrația Națională de Meteorologie",
  "Event": "awareness_type=5, awareness_level=2",
  "Start": "2024-08-01 10:00:00",
  "End": "2024-08-01 21:00:00",
  "Description": "Thermal discomfort will be high. Maximum temperatures will reach 35...36 degrees.",
  "Tags": "Other dangers"
}
{
  "SenderName": "Administrația Națională de Meteorologie",
  "Event": "awareness_type=5, awareness_level=3",
  "Start": "2024-08-02 10:00:00",
  "End": "2024-08-03 10:00:00",
  "Description": "Maximum temperatures will reach 38...39 degrees. Thermal discomfort will be very high. Minimum temperatures will not decrease below 20 degrees.",
  "Tags": "Other dangers"
}

```