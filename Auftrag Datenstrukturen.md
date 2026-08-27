

### Fragestellung 1
Sie müssen eine Adressliste verwalten mit mehreren 100 Datensätzen. Welche Strukturen kommen in Frage und warum?

Queue, Verkette Liste, Stack oder Vorrangewarteschlange. Diese Datenstrukturen brauchen im Vergleich zu einem Array keine fixe Grösse.  

### Fragestellung 2
Sie müssen viele Werte speichern und mit wenig Zeitverlust darauf zugreifen können. Welche Strukturen kommen in Frage und warum?

Array, falls fixe Grösse, HashMap oder HashTable

### Fragestellung 3
Sie müssen einen Sortieralgorithmus für Zahlen programmieren. Welche Strukturen kommen in Frage und warum?
Vorrangewarteschlange, hier werden die Zahlen in der Warteschlange sortiert.
Array wird bei MergeSort verwendet. 

### Fragestellung 4
Die Universität Zürich hatte in jedem Semester das Problem, dass ihre Server überlastet waren während der Modulregistrierung in neuen Semestern. Jeder Student wollte so schnell als möglich einen Platz für spezifische Vorlesungen reservieren, weil die Plätze jeweils limitiert sind. Dabei mussten die offenen Modulregistrierungs-Anfragen geschickt gespeichert werden.

Mit welcher Struktur kann man dieses Problem lösen (und wurde so auch gelöst)?

Queue, mit FIFO Prinzip
