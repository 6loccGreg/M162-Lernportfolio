
NASA FIRMS

1. **Registrierung:** Auf `https://firms.modaps.eosdis.nasa.gov/api/map_key/` E-Mail eintragen. 
2. **API-Key:** Ist **zwingend erforderlich** (kostenlos, Limit: 5.000 Abfragen / 10 Min). 
3. **Abruf (Beispiel HTTP GET):** `https://firms.modaps.eosdis.nasa.gov/api/area/csv/DEIN_MAP_KEY/VIIRS_SNPP_NRT/5,45,11,48/1` 
--- 
 ## 2. Wichtigste Datenfelder 
| Feldname                        | Datentyp   | Beschreibung                                                  |
| :------------------------------ | :--------- | :------------------------------------------------------------ |
| **`latitude` / `longitude`**    | Float      | Geografische Koordinaten des Hotspots                         |
| **`bright_ti4` / `bright_ti5`** | Float      | Kanaltemperatur des Satelliten in Kelvin                      |
| **`acq_date` / `acq_time`**     | String/Int | Datum & UTC-Uhrzeit der Erfassung                             |
| **`confidence`**                | String/Int | Wahrscheinlichkeit für reales Feuer (`low`, `normal`, `high`) |
| **`frp`**                       | Float      | **Fire Radiative Power** (Brandintensität in Megawatt)        |

 ---  
  ## 3. Anwendungszwecke 
* **Frühwarnsysteme:** Schnelle Erkennung von Waldbränden in unzugänglichen Gebieten. 
* **Klimaforschung:** Modellierung von CO₂-Emissionen und Rauchgasausbreitung. 
* **Naturschutz:** Überwachung illegaler Brandrodungen.