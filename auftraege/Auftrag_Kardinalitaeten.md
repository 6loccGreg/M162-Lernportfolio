#Auftrag: Definieren sie die Kardinalitaeten

| Entität 1     | Kardinalität (Links) |        Verbindung        | Kardinalität (Rechts) | Entität 2    |
| :------------ | :------------------: | :----------------------: | :-------------------: | :----------- |
| Adresse       |          1           |            —             |           N           | Person       |
| Buch          |          N           |            —             |           M           | Autor        |
| Mutter        |          1           |            —             |           N           | Kind         |
| Mann          |          1           |            —             |           1           | Frau         |
| Mitarbeiter   |          N           |            —             |           1           | Vorgesetzte  |
| Eltern        |          1           |            —             |           N           | Kind         |
| Klasse        |          N           |            —             |           M           | Lehrperson   |
| Zeitung       |          N           |            —             |           M           | Inserat      |
| Fahrzeug      |          1           |            —             |           1           | Lenkrad      |
| Geschäft      |          N           |            —             |           M           | Kunde        |
| Person        |          N           |            —             |           1           | Geburtsort   |
| rechte Schuhe |          1           |          Paare           |           1           | linke Schuhe |
| Abteilung     |          1           |     Abteilungsleiter     |           M           | Personal     |
| Person        |          N           | Abteilungszugehoerigkeit |           1           | Abteilungen  |
| Kinder        |          N           |  Familienzugehoerigkeit  |           1           | Ehepaare     |
| Person        |          N           |   Parteizugehoerigkeit   |           1           | Parteien     |
| Projekte      |          N           |     ist Unterprojekt     |           1           | Projekte     |
| Vorlesungen   |          N           |     Einschreibungen      |           M           | Studenten    |
| Personen      |          N           |      Freundschaften      |           M           | Personen     |

---

In einer Firma wird erfasst, wer mit welchem Auto gerade unterwegs ist.

| Entität 1 | Kardinalität (Links) |  Verbindung   | Kardinalität (Rechts) | Entität 2 |
| :-------- | :------------------: | :-----------: | :-------------------: | :-------- |
| Auto      |          1           | faehrt gerade |           1           | Person    |

Der Besitzer jedes Autos wird erfasst.
| Entität 1 | Kardinalität (Links) | Verbindung | Kardinalität (Rechts) | Entität 2 |
| :-------- | :------------------: | :-----------: | :-------------------: | :-------- |
| Auto | N | besitzt | 1 | Person |

Die Angestellten werden fuer einen Ausflug auf die Autos verteilt
| Entität 1 | Kardinalität (Links) | Verbindung | Kardinalität (Rechts) | Entität 2 |
| :-------- | :------------------: | :-----------: | :-------------------: | :-------- |
| Auto | 1 | verteilt | N | Person |

Die Fahrlizenzen fuer die verschiedenen Autos werden fuer die verschiedenen Personen erfasst.
| Entität 1 | Kardinalität (Links) | Verbindung | Kardinalität (Rechts) | Entität 2 |
| :-------- | :------------------: | :-----------: | :-------------------: | :-------- |
| Auto | N | Lizenz erfasst | M | Person |
