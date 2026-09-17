# M162 LB1 Ultimate Final Cheatsheet & Game Plan

This master cheatsheet combines the 20-minute Theory open-book lookup rules and the 45-minute Practical Excel workflow into one reference guide for the M162 LB1 assessment.

---

## 🧠 Part 1: Theory Exam Open-Book Quick Lookup (20 Mins)

### 1. Data Structures & Data Types
- **Queue vs. Stack**:
  - **Queue** (*Warteschlange*): **FIFO** (First-In, First-Out; e.g. print queue, process scheduling).
  - **Stack** (*Stapel*): **LIFO** (Last-In, First-Out; e.g. undo history, function call stack).
- **Tuples**: Ordered, fixed-length, immutable records — **NOT** multidimensional arrays.
- **Boolean Memory Representation**: Stored as a **Byte (8 bits)** because modern CPU architectures address and retrieve memory in increments of at least 1 byte. Byte storage avoids expensive CPU bit-masking operations.
- **Fixed-Point vs. Floating-Point Numbers**:
  - **Fixed-Point** (*Festkommazahl*): Exact precision, limited dynamic range (ideal for financial/currency values).
  - **Floating-Point** (*Gleitkommazahl*): High dynamic range, prone to IEEE 754 floating-point rounding errors.
- **Signed vs. Unsigned Integer**:
  - Signed `INTEGER`: Includes negative whole numbers.
  - Unsigned `INTEGER`: Non-negative whole numbers only ($0$ and positive).

### 2. Character Encoding (ASCII & UTF-8)
- **ASCII**: 7 bits = 128 characters ($2^7$). Extended ASCII = 8 bits (256 characters).
- **UTF-32**: Fixed 4 bytes (32 bits) per character.
- **UTF-8 Multi-Byte Structure Rules**:
  - 1-byte sequence (ASCII compatible): Starts with `0xxxxxxx`.
  - 2-byte sequence: Leading byte starts with `110xxxxx`, followed by **exactly one** continuation byte `10xxxxxx`.
  - 3-byte sequence: Leading byte starts with `1110xxxx`, followed by **two** continuation bytes `10xxxxxx`.
  - 4-byte sequence: Leading byte starts with `11110xxx`, followed by **three** continuation bytes `10xxxxxx`.
  - *KPRIM Exam Trap*: A byte sequence starting with `1101 0011` without a following `10xxxxxx` continuation byte is **invalid / incomplete**.

### 3. Measurement Scales (*Skalentypen*) & Feature Types
- **Nominal**: Unordered categories (e.g. blood type, hair colour, postal codes, eye colour).
- **Ordinal**: Ordered categories with unequal or undefined intervals (e.g. school grades, sports rankings, customer satisfaction levels).
- **Interval**: Ordered + equal intervals, **arbitrary zero point** (e.g. Temperature in °C, calendar year, IQ score).
- **Ratio** (*Verhältnisskala*): Ordered + equal intervals + **absolute natural zero point** (e.g. Temperature in Kelvin, height, weight, revenue, volume, count).
- **Häufbar vs. Nicht-häufbar**:
  - *Häufbar*: Multiple choice selections allowed simultaneously for a single observation (e.g. *"Which programming languages do you know?"*).
  - *Nicht-häufbar*: Only one single value selectable (e.g. *"What is your primary nationality?"*).

### 4. Data Protection & Security (*Datenschutz vs. Datensicherheit*)
- **Datenschutz**: Protects **personal data and individual privacy rights** of natural persons (governed by DSG / GDPR).
- **Datensicherheit**: Technical protection of **confidentiality, integrity, and availability** for ALL data (including corporate secrets, system logs, and non-personal data).
- **Pseudonymised Data**: Replaces personal identifiers with IDs — **STILL personal data** under *Datenschutz* because re-identification is possible via an encryption key or lookup table.
- **Anonymised Data**: Re-identification is irreversibly impossible — exempt from *Datenschutz*.
- **Data Deletion**: Complete deletion requires removing temporary files, caches, log files, and shadow copies.

### 5. Data Formats (JSON / XML) & Visualisation
- **JSON Syntax Rules**:
  - Key names **MUST** be enclosed in double quotes (`"key": "value"`). Unquoted keys are invalid JSON.
  - Allowed value types: string, number, object, array, boolean, null. Trailing commas are strictly illegal.
  - Schemaless: Objects in a JSON array do not strictly need identical structures.
- **Diagram Types**:
  - **Säulendiagramm** (*Column Chart*): Strictly **vertical** bars. Ideal for comparing discrete categories.
  - **Balkendiagramm** (*Bar Chart*): Strictly **horizontal** bars. Ideal for rankings or long category labels.
  - **Liniendiagramm** (*Line Chart*): Best for showing **temporal developments / trends over time**.
  - **Kreisdiagramm** (*Pie Chart*): Shows static part-to-whole proportions at a single point in time — **NEVER** for temporal trends over time.
  - **Grouped / Clustered Charts**: Best for inter-categorical comparisons across sub-groups at a single point in time.

---

## 📊 Part 2: Practical Excel Exam Workflow (45 Mins)

### The 5-Step Master Execution Checklist

| Step | Goal | Best Tool / Excel Path | Key Formulas & Shortcuts |
| :--- | :--- | :--- | :--- |
| **1. Rohdaten** | Import & Audit | **Daten → Aus Text/CSV** (UTF-8) | Duplicate sheet to `Bereinigte_Daten` |
| **2. Säuberung** | Clean Data | Power Query or Excel Tools | `=GLÄTTEN(SÄUBERN(A2))` <br> `=WERT(B2)` <br> `Ctrl + Shift + L` (Filter) <br> `Ctrl + H` (Replace) |
| **3. Auswertung** | Analysis | Excel Formulas & PivotTable | `=SUMMEWENN(Bereich; Kriterium; Summe_Bereich)` <br> `=ZÄHLENWENN(Bereich; Kriterium)` <br> `=XVERWEIS(Suchkriterium; Suchmatrix; Rückgabematrix)` <br> `=WENNFEHLER(Formel; "Alternativtext")` |
| **4. Diagramme** | Visualisation | **Einfügen → Diagramme** | **Checklist:** Descriptive Title, Axis Unit Label, Legend (if >1 series), Data Labels (Pie). |
| **5. Doku** | Logging | Dedicated `Dokumentation` Tab | Copy-Paste Log Table + 4 Quality Dimensions |

### Power Query Quick-Fixes
- **Trailing Text (e.g. `"1.5 zimmer"`)**: Select column → **Transformieren → Extrahiere → Text vor Trennzeichen** (Delimiter: space ` `).
- **Dot vs. Comma (`1.5` vs `1,5`)**: Right-click header → **Typ ändern → Mit Gebietsschema... → Dezimalzahl → Englisch (USA)**.
- **Replace Red Errors**: Right-click header → **Fehler ersetzen → `0`**.

---

### Step 5 Documentation Templates (Copy-Paste Ready)

#### 1. Bereinigungsprotokoll (Log Table)

| Bereich / Spalte | Identifiziertes Problem | Durchgeführte Massnahme | Ergebnis / Auswirkung |
| :--- | :--- | :--- | :--- |
| **Datenset** | Doppelte Einträge vorhanden | *Daten → Duplikate entfernen* | Duplikate entfernt; eindeutige Datenbasis hergestellt. |
| **Spalte A (Text)** | Leerzeichen & Steuerzeichen | `=GLÄTTEN(SÄUBERN())` angewendet | Einheitliche Textdarstellung ohne Artefakte. |
| **Spalte B (Betrag)** | Zahlen als Text formatiert | `=WERT()` / *Text in Spalten* genutzt | Format als `Währung (CHF)` umgestellt, berechenbar. |
| **Spalte C (Kategorie)** | Uneinheitliche Casing-Schreibweisen | *Suchen & Ersetzen* (`Ctrl + H`) | Kategorienamen durchgehend vereinheitlicht. |
| **Spalte D (Werte)** | Fehlende / Null-Einträge | Gefilterte Blanks mit `0` / `"Unbekannt"` ersetzt | Fehlerfreie Formelausführung in der Auswertung. |

#### 2. Datenqualitäts-Bewertung

```text
1. Vollständigkeit (Completeness):
Das Datenset wurde vollständig auf fehlende Werte geprüft. Alle erforderlichen Pflichtfelder sind nach der Bereinigung belegt bzw. transparent als "Unbekannt" oder 0 deklariert.

2. Konsistenz (Consistency):
Einheitliche Formate (Währung CHF mit 2 Dezimalstellen, Datumsformate YYYY-MM-DD) und konsistente Kategorienschreibweisen wurden durchgehend angewendet.

3. Gültigkeit (Validity):
Sämtliche Wertebereiche und Datentypen wurden auf Plausibilität geprüft (z. B. keine negativen Mengen oder unplausiblen Datumsangaben).

4. Genauigkeit & Prüfungsfähigkeit (Accuracy & Traceability):
Alle Aggregationen und Kennzahlen basieren auf dynamischen Excel-Formeln (SUMMEWENN, XVERWEIS, PivotTables). Die Ergebnisse sind zu 100 % nachvollziehbar und transparent dokumentiert.
```

---

# 🚀 Exam Day Strategy

1. **Theory Exam (20 mins)**:
   * **Pace Target**: ~1.5 minutes per question block.
   * Answer what you know immediately; use this guide for UTF-8 multi-byte bitwise rules, scale zero-point distinctions, and JSON syntax constraints.
2. **Practical Exam (45 mins)**:
   * **Pace Target**: Complete Steps 1–4 in **25–30 minutes**.
   * Use your initial LLM prompt immediately if you encounter a complex formula or Power Query error.
   * Spend 5 minutes pasting and refining your **Step 5 Documentation** to secure full points.
