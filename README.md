# weather_shell

Dieses Shell-Skript verwendet die OpenWeatherMap API, um Wettervorhersagen für eine bestimmte Stadt zu liefern.

## Voraussetzungen

- Bash
- curl
- jq

## Konfiguration

Erstellen Sie eine `configWeather.sh` Datei im selben Verzeichnis wie das Skript mit folgendem Inhalt:

API_KEY="Ihr_OpenWeatherMap_API_Schlüssel"
DEFAULT_CITY="Standardstadt"
COUNTRY_CODE="DE"
DEFAULT_METRIC="Metric"