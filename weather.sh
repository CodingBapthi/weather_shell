#!/bin/bash

# Konfigurationdatei einbinden
source configWeather.sh

# Benutzer nach der Stadt fragen und Standardwert verwenden, falls keine Eingabe erfolgt
read -p "Gib den Namen einer Stadt ein (Standard: Marburg): " CITY
CITY="${CITY:-$DEFAULT_CITY}"

read -p "Gib ein in welcher Metric (Standard, Metric or Imperial) du die Temperatur haben möchtest (Standard: Metric): " METRIC
UNITS="${METRIC:-$DEFAULT_METRIC}"

# Koordinaten der Stadt abrufen
COORDS=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$CITY,$COUNTRY_CODE&appid=$API_KEY" | jq '.coord')
LAT=$(echo $COORDS | jq '.lat')
LON=$(echo $COORDS | jq '.lon')

# API URL
URL="http://api.openweathermap.org/data/2.5/forecast?q=$CITY&exclude=current,minutely,daily,alerts&appid=$API_KEY&units=$UNITS&lang=DE"

# Abrufen der Wetterdaten
weather=$(curl -s $URL)

# Beispiel, um die Temperatur und Beschreibung für die nächsten 12 Stunden auszugeben
for i in {0..3}
do
    # Extrahiere und formatiere die benötigten Daten
    dt_txt=$(echo $weather | jq -r ".list[$i].dt_txt")
    temp=$(echo $weather | jq ".list[$i].main.temp")
    description=$(echo $weather | jq -r ".list[$i].weather[0].description")

    echo "$dt_txt: $description, Temperatur: $temp °C"
done
