# M162 LB2 Theory Exam: High-Yield Revision Cheatsheet & Reference Guide

### 1. ERM & ERD Core Concepts and Terminology

Entity-Relationship Modelling (ERM) and Entity-Relationship Diagrams (ERD) form the theoretical and structural foundation of relational database engineering. Designing a robust database requires converting unstructured real-world business requirements into precise conceptual and logical constructs. Rigorous conceptual definition at the initial modelling stage prevents costly structural flaws—such as unresolvable dependencies, orphaned records, structural rigidity, and systemic data redundancy—from propagating into downstream physical implementation and SQL Data Definition Language (DDL) execution.

#### 1.1 Core Components Deconstruction

Relational models rely on five fundamental constructs to define data structures and their interdependencies:

- **Entity (**_**Entität**_**):** A distinct real-world object, concept, or event that is uniquely identifiable and relevant within the system context (e.g., Customer, Order, Class).
- **Attribute (**_**Attribut**_**):** A single property, trait, or characteristic that describes an entity or a relationship (e.g., Email Address, First Name, Order Date).
- **Relationship (**_**Beziehung**_**):** An association or logical link between two or more entities that defines how they interact or correlate according to business rules.
- **Primary Key (**_**Primärschlüssel**_ **/ PK):** An attribute or composite set of attributes that uniquely identifies every distinct instance of an entity.
- **Foreign Key (**_**Fremdschlüssel**_ **/ FK):** An attribute in one entity/table that references the Primary Key of another entity/table, establishing referential integrity across relational boundaries.

|   |   |   |
|---|---|---|
|Component|Definition & Logical Purpose|Visual Representation Rules|
|**Entity (**_**Entität**_**)**|Represents a distinct real-world object or domain concept.|Rectangular box containing the entity name in singular form.|
|**Attribute (**_**Attribut**_**)**|Captures specific properties or data points belonging to an entity.|Listed inside the entity box (or linked ovals in classic Chen ERD).|
|**Relationship (**_**Beziehung**_**)**|Connects entities to express structural or operational dependencies.|Connecting line between entity boxes (or diamond symbols in Chen ERD).|
|**Primary Key (PK)**|Enforces entity integrity; guarantees record uniqueness.|Labeled with `PK` prefix inside entity tables/attribute lists.|
|**Foreign Key (FK)**|Enforces referential integrity across related tables.|Explicitly labeled with `FK` (e.g., `FK1`, `FK2`) in attribute lists.|

#### 1.2 KPRIM Exam Pitfall Alert: ERD Definitions

### KPRIM Exam Pitfall Alert: ERD Definitions

- **RULE 1 (TRUE):** A line drawn between entity boxes explicitly represents a **Beziehung** (Relationship). The graphical symbols located at the absolute ends of these lines represent **Kardinalitäten** (Cardinalities) (_Source Image 2_).
- **RULE 2 (TRUE):** The number of entity boxes directly equals the number of represented entities. An ERD featuring 4 distinct rectangular boxes represents exactly 4 entities (_Source Image 2_).
- **RULE 3 (FALSE):** Foreign keys in ERDs and junction tables are designated by explicit text labels (e.g., `FK`, `FK1`, `FK2`). Formatting an attribute in bold text is **not** the rule for denoting a foreign key relationship (_Source Image 4_).

Precision in identifying basic visual components ensures accurate translation into quantitative cardinality notation systems.

### 2. Cardinality Notations & Relationship Dynamics (Zehnder/Swiss mc vs. Crow's Foot)

Defining relationship cardinalities specifies the exact minimum and maximum number of entity instances that can participate in a relationship. Precise cardinality mapping enforces business logic and guarantees structural data integrity across database boundaries.

#### 2.1 Dual-Notation Breakdown

Database engineering utilizes both textual notation systems—such as the **Swiss/Zehnder mc-notation** (`1`, `c`, `m`, `mc`)—and visual graphic standards like **Crow's Foot (**_**Krähenfuss**_**) notation**.

|   |   |   |   |
|---|---|---|---|
|Zehnder Code|Logical Meaning|Crow's Foot Graphical Symbol|Participation / Quantity Bound|
|`**1**`|Exactly one|Straight perpendicular line / Cross-bar (`\||`)|
|`**c**` (`0..1`)|Zero or one|Circle followed by a straight line (`o\|`)|Conditional / Optional Single (0..1)|
|`**m**` (`1..*`)|One or many|Straight line followed by a Crow's Foot (`\|<{`)|Mandatory Multiple (1..*)|
|`**mc**` (`0..*`)|Zero or many|Circle followed by a Crow's Foot (`o<{`)|Conditional / Optional Multiple (0..*)|

#### 2.2 Relationship Directionality & Reading Rules

Relationships are inherently bidirectional and must be interpreted independently from both directions:

- **Bidirectional Reading:** Reading from Entity A to Entity B yields one side of the cardinality constraint, whereas reading from Entity B to Entity A yields the opposing side. Consequently, a single relationship line is designated as `mc-m` or `m-mc` depending entirely on the direction of reading (_Source Image 6_).
- **Mandatory Existence Rules:** In an `mc-m` relationship configuration between `Person` and `Class` (`Klasse`), where the `m` (1..*) bound rests on the `Person` side and the `mc` (0..*) bound rests on the `Class` side (_Source Image 6_):
    - Reading from `Klasse` to `Person`: Every class _must_ be connected to at least one person (`m`). Therefore, a class **cannot** exist without assigned persons (**TRUE** / _richtig_ in exam key) (_Source Image 6_).
    - Reading from `Person` to `Klasse`: A person can be assigned to zero, one, or many classes (`mc`).

#### 2.3 Quick Decision Tree: Cardinality Selection

```
[Start Cardinality Analysis]
          │
          ▼
Is Entity B mandatory for Entity A to exist? (Minimum Bound)
          ├──────► YES ──► Minimum = 1 (Mandatory)
          └──────► NO  ──► Minimum = 0 (Conditional / Optional "c")
          │
          ▼
Can Entity A link to multiple instances of Entity B? (Maximum Bound)
          ├──────► YES ──► Maximum = Many ("m" / "*")
          └──────► NO  ──► Maximum = 1
          │
          ▼
[Synthesize Notation Code]
          ├──────► Min 1, Max 1    ==>  "1"   (Mandatory Single)
          ├──────► Min 0, Max 1    ==>  "c"   (Optional Single / 0..1)
          ├──────► Min 1, Max Many ==>  "m"   (Mandatory Multiple / 1..*)
          └──────► Min 0, Max Many ==>  "mc"  (Optional Multiple / 0..*)
```

The choice and structural expression of cardinalities directly dictate how models transform across abstraction layers.

### 3. Data Model Abstraction Levels (Conceptual, Logical, Physical)

Database design progresses through three distinct abstraction tiers. Decoupling high-level business rules from technical database implementation details ensures cross-platform portability, system scalability, and structural clarity.

#### 3.1 Comparative Abstraction Matrix

|   |   |   |   |
|---|---|---|---|
|Evaluation Criteria|Conceptual ERD (_Konzeptionell_)|Logical ERD (_Logisch_)|Physical Model (_Physisch_)|
|**Target Audience**|Business Domain Experts, Analysts|Database Architects, Developers|Database Administrators (DBA), Engineers|
|**Representation**|High-level entities and domain concepts.|Formal entities with complete attribute lists.|Concrete physical tables, columns, and indexes.|
|**Handling of** **m:n** **Links**|Represented **directly** as m:n / mc:mc links.|Resolved into junction entities or explicitly mapped.|Resolved into **physical junction tables** (_Zwischentabellen_).|
|**Inclusion of Keys**|Omitted (Keys not defined at this stage).|**Explicitly displays** both PKs and FKs.|Displays physical PKs, FKs, constraints, and indexes.|
|**Data Types**|Omitted.|Abstract data types (optional).|**Concrete DBMS types** (e.g., `VARCHAR(100)`, `INTEGER`).|

#### 3.2 Model Transformation Rules & Exam Edge Cases

- **Conceptual Models:** Focus exclusively on business domain boundaries. m:n (or mc:m) relationships are modeled directly between entities **without** requiring physical junction tables (_Zwischentabellen_) (_Source Image 5, Source Image 6_). Conceptual models lack DBMS execution details and do **not** contain sufficient specifications to generate SQL DDL scripts directly (_Source Image 5_).
- **Logical Models:** Introduce relational structure. They display entities and attributes precisely while explicitly defining key structures (Primary Keys and Foreign Keys) across relationships (_Source Image 5_).
- **Physical Models:** Finalize database execution details. They assign concrete DBMS data types (e.g., `VARCHAR(100)`, `INTEGER`) and resolve all m:n relationships into physical tables using junction tables (_Source Image 5, Source Image 6_).
- **Exam Edge Case (Source Image 2 Diagram Analysis):** An ERD diagram showing entity boxes connected by Crow's Foot cardinality lines—but completely lacking attribute listings, PK/FK declarations, and data types—is classified as a **Conceptual ERD** (_Konzeptionelles ERD_), **not** a logical ERD (_Source Image 2, Source Image 6_).

#### 3.3 KPRIM Exam Pitfall Alert: Abstraction Confusions

### KPRIM Exam Pitfall Alert: Abstraction Confusions

- **RULE 1 (TRUE /** _**richtig**_**):** A logical data model explicitly displays both Primary Keys (PK) and Foreign Keys (FK) (_Source Image 5_).
- **RULE 2 (TRUE /** _**richtig**_**):** Data types such as `VARCHAR(100)` or `INTEGER` are standard components of physical data models (_Source Image 5_).
- **RULE 3 (FALSE /** _**falsch**_**):** A conceptual data model maps an m:n relationship by already including the necessary junction table (_Zwischentabelle_). _(Conceptual models map_ _m:n_ _directly)_ (_Source Image 5_).
- **RULE 4 (FALSE /** _**falsch**_**):** A conceptual data model contains all the information required to directly derive SQL DDL scripts for table creation on a database (_Source Image 5_).

Resolving conceptual models into physical schemas requires implementing robust key structures and intermediary junction entities.

### 4. Primary Keys, Foreign Keys, and Junction Tables (Zwischentabellen)

Relational models establish logical linkages between discrete entities through primary and foreign key constraints, guaranteeing entity and referential integrity.

#### 4.1 Structural Role of Primary & Foreign Keys

- **Primary Key (PK):** Enforces entity integrity by ensuring every record within a table is uniquely identifiable. A primary key must never contain `NULL` values.
- **Foreign Key (FK):** Enforces referential integrity by referencing an existing Primary Key in a parent table, establishing a verifiable linkage.
- **Composite Primary Key (**_**Zusammengesetzter Primärschlüssel**_**):** A primary key formed by combining two or more attributes within a single table. This structure is required in associative/junction tables to guarantee that specific combinations of foreign keys remain unique (_Source Image 4_).

#### 4.2 Resolution of Many-to-Many (m:n) Relationships

Relational database engines cannot natively implement direct m:n or mc:mc relationships between two physical tables. They must be resolved using a **Junction Table** (_Zwischentabelle_ / associative entity):

1. **Deconstruction:** The direct m:n link is split into two separate 1:n (or 1:mc) relationships.
2. **Key Migration:** The Primary Keys of both participating base entities migrate into the junction table as Foreign Keys (`PersonID` becomes `FK1`, `KlasseID` becomes `FK2`) (_Source Image 4_).
3. **Composite Key Creation:** The migrated foreign keys combine to form a composite Primary Key (`PK, FK1 PersonID` + `PK, FK2 KlasseID`), preventing duplicate pairing insertions (_Source Image 4_).
4. **Payload Attributes:** Context-specific attributes belonging strictly to the relationship instance (e.g., `RolleID` mapped as `FK3` to designate a person's specific role in that class) are placed directly inside the junction table (_Source Image 4_).

```
+-------------------+        +-----------------------------------+        +-------------------+
|      Person       |        |          PersonHatKlasse          |        |      Klasse       |
+-------------------+        +-----------------------------------+        +-------------------+
| PK  PersonID      |<-------| PK, FK1  PersonID                 |------->| PK  KlasseID      |
|     Vorname       |        | PK, FK2  KlasseID                 |        |     Bezeichnung   |
|     Nachname      |        |      FK3 RolleID                  |        +-------------------+
|     E-Mail        |        +-----------------------------------+
+-------------------+                         │
                                              │
                                              ▼
                                     +-------------------+
                                     |       Rolle       |
                                     +-------------------+
                                     | PK  RolleID       |
                                     |     Bezeichnung   |
                                     +-------------------+
```

#### 4.3 KPRIM Exam Pitfall Alert: Key Misconceptions

### KPRIM Exam Pitfall Alert: Key Misconceptions

- **RULE 1 (FALSE /** _**falsch**_**):** A 1:n relationship (such as between `Order` / `Bestellung` and `Order Item` / `Bestellposition`) requires a junction table for database implementation. _(Junction tables are required exclusively for_ _m:n_ _relationships;_ _1:n_ _relationships embed the FK directly into the child table)_ (_Source Image 2_).
- **RULE 2 (FALSE /** _**falsch**_**):** Every entity in an ERD must possess exactly one single attribute as its Primary Key. _(Junction tables frequently utilize composite keys composed of multiple attributes)_ (_Source Image 4_).
- **RULE 3 (FALSE /** _**falsch**_**):** Foreign key attributes in junction tables (e.g., `RolleID` in `PersonHatKlasse`) must be formatted in bold text. _(Foreign keys are identified via structural labels like_ `_FK_`_, not bold text formatting)_ (_Source Image 4_).
- **RULE 4 (TRUE /** _**richtig**_**):** The relationship between `Person` and `Class` can also be modeled without a junction table (_Die Beziehung zwischen Person und Klasse liesse sich auch ohne Zwischentabelle modellieren_). _(At the conceptual modeling layer or in object-relational mapping,_ _m:n_ _links are represented directly between the two base entities without an intermediate junction box)_ (_Source Image 4_).

Failing to resolve complex relationships or ignoring key constraints leads directly to data redundancy and database anomalies.

### 5. Redundancies and Database Anomalies

Un-normalized databases containing duplicated attributes present severe operational risks. Redundancy degrades system performance and causes corrupt or inconsistent datasets.

#### 5.1 Categorization of Database Anomalies

1. **Insertion Anomaly (**_**Einfüge-Anomalie**_**):** Occurs when valid data regarding a specific entity cannot be inserted into the database without forcibly introducing irrelevant, dummy, or unrelated data for a completely separate entity.
2. **Update Anomaly (**_**Änderungs-Anomalie**_**):** Occurs when redundant data is updated in one location/row but remains unchanged in other rows, leaving the database in an inconsistent state.
3. **Deletion Anomaly (**_**Lösch-Anomalie**_**):** Occurs when deleting a specific record to remove an entity instance inadvertently destroys critical, non-recoverable data belonging to an entirely different entity.

#### 5.2 Real-World Case Analysis (Un-normalized Course/Lecturer Table)

Consider the un-normalized flat table schema from the practice exam (_Source Image 1_):

|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|Kurs-ID|Kursname|Dozent-ID|Dozent|Dozent-E-Mail|Teilnehmer-ID|Teilnehmer|Teilnehmer-E-Mail|
|**K01**|Datenbanken|D01|Anna Keller|anna.keller@schule.ch|T01|Max Müller|max.mueller@mail.ch|
|**K01**|Datenbanken|D01|Anna Keller|anna.keller@schule.ch|T02|Lea Meier|lea.meier@mail.ch|
|**K01**|Datenbanken|D01|Anna Keller|anna.keller@schule.ch|T03|Tim Weber|tim.weber@mail.ch|
|**K02**|Programmieren|D02|Peter Huber|peter.huber@schule.ch|T01|Max Müller|max.mueller@mail.ch|
|**K02**|Programmieren|D02|Peter Huber|peter.huber@schule.ch|T02|Lea Meier|lea.meier@mail.ch|
|**K03**|Netzwerke|D01|Anna Keller|anna.keller@schule.ch|T04|Nina Graf|nina.graf@mail.ch|
|**K03**|Netzwerke|D01|Anna Keller|anna.keller@schule.ch|T05|Jan Frei|jan.frei@mail.ch|

- **Redundancy Analysis:** The lecturer email `anna.keller@schule.ch` is duplicated across five separate participant rows. Storing repeated lecturer emails across multiple rows constitutes redundant data (**TRUE**) (_Source Image 1_).
- **Deletion Anomaly Manifestation:** Deleting participant records `T04` and `T05` to remove them from course `K03` (Netzwerke) inadvertently deletes the entire course record and lecturer mapping for `K03`. Thus, a deletion anomaly can cause unintended loss of course information (**TRUE**) (_Source Image 1_).
- **Update Anomaly Manifestation:** Updating `Max Müller`'s email address in only the first row creates an **Update Anomaly** (_Änderungs-Anomalie_). Labeling this failure an "Insertion Anomaly" is **FALSE** (_Source Image 1_).

#### 5.3 KPRIM Exam Pitfall Alert: Anomaly Definitions

### KPRIM Exam Pitfall Alert: Anomaly Definitions

- **RULE 1 (TRUE /** _**richtig**_**):** A deletion anomaly can cause unintended loss of course information when deleting a participant record (_Source Image 1_).
- **RULE 2 (TRUE /** _**richtig**_**):** Storing repeated lecturer emails across multiple rows constitutes redundant data (_Source Image 1_).
- **RULE 3 (FALSE /** _**falsch**_**):** Updating a student's email address in only the first row is called an "Insertion Anomaly". _(This is explicitly an_ _**Update Anomaly**__)_ (_Source Image 1_).
- **RULE 4 (FALSE /** _**falsch**_**):** An insertion anomaly means that data is automatically duplicated or saved multiple times during insertion. _(An insertion anomaly means valid data_ _**cannot**_ _be inserted without adding unrelated placeholder attributes)_ (_Source Image 1_).

Database normalization provides the structured mathematical framework required to eliminate redundancies and eliminate anomalies.

### 6. Normalization Rules (1NF, 2NF, and 3NF)

Normalization is a progressive refinement technique that decomposes flat, un-normalized data structures into rigorous relational entities up to the Third Normal Form (3NF).

#### 6.1 Detailed Breakdown of Normal Forms & Formal Notation

```
Un-normalized Relation (0NF)
       │
       ▼ [Rule: Ensure scalar values / Eliminate multi-valued lists]
First Normal Form (1NF)  ──►  A -> scalar (Atomicity)
       │
       ▼ [Rule: Remove partial key dependencies on composite keys]
Second Normal Form (2NF) ──►  X -> Y where X is the FULL Primary Key
       │
       ▼ [Rule: Remove transitive dependencies on non-key attributes]
Third Normal Form (3NF)  ──►  X -> Y -> Z is eliminated (Only PK -> Non-Key)
```

##### First Normal Form (1NF)

- **Prerequisite:** Dataset must be organized in tabular structure.
- **Formal Rule:** Attribute values must be scalar/atomic: \forall A, \text{val}(A) \in \text{Domain}.
- **Core Principle:** **Atomicity (**_**Atomarität**_**)**. Every cell must contain exactly one single value. No repeating groups, arrays, or composite lists are permitted within a single field.
- **Target Defect:** Multi-valued entries (e.g., storing quantities as `"1 Stück, 1 Karton"` in a single column violates 1NF) (_Source Image 3_).

##### Second Normal Form (2NF)

- **Prerequisite:** Relation must already satisfy **1NF**.
- **Formal Rule:** Full functional dependency on candidate keys: \forall (X \rightarrow Y), where X is a composite Primary Key, no partial key P \subset X can determine Y (P \not\rightarrow Y).
- **Core Principle:** **Full Functional Dependency (**_**Vollständige funktionale Abhängigkeit**_**)**. Every non-key attribute must depend on the _entire_ Primary Key. Applies specifically to tables with composite primary keys.
- **Target Defect:** Partial key dependencies.

##### Third Normal Form (3NF)

- **Prerequisite:** Relation must already satisfy **2NF**.
- **Formal Rule:** Non-transitive dependency constraint: For every non-trivial functional dependency X \rightarrow A, X must be a superkey, or A must be a prime attribute. No non-key attribute may determine another non-key attribute (X \rightarrow Y \rightarrow Z).
- **Core Principle:** **Non-Transitive Dependency (**_**Keine transitiven Abhängigkeiten**_**)**. All non-key attributes must depend _exclusively_ on the Primary Key.
- **Target Defect:** Transitive dependencies between non-key attributes.

#### 6.2 Exam Case Study Analysis (Order-Product Table)

Examine the exam reference table (_Source Image 3_):

|   |   |   |   |   |   |
|---|---|---|---|---|---|
|Bestell-ID|Produkt-ID|Menge|Produktname|Unterkategorie|Oberkategorie|
|**B001**|**P101**|2|USB-C-Kabel|Kabel|Elektronikzubehör|
|**B001**|**P205**|1|Bluetooth-Maus|Mäuse|Computerzubehör|
|**B002**|**P101**|3|USB-C-Kabel|Kabel|Elektronikzubehör|

- **Declared Primary Key:** Composite Primary Key (`Bestell-ID` + `Produkt-ID`).
- **Functional Dependency Breakdown:**
    - `Bestell-ID, Produkt-ID` \rightarrow `Menge` (Full dependency on composite PK).
    - `Produkt-ID` \rightarrow `Produktname`, `Unterkategorie` (Partial key dependency: depends ONLY on `Produkt-ID`, violating 2NF).
    - `Unterkategorie` \rightarrow `Oberkategorie` (Transitive dependency: non-key attribute determines non-key attribute, violating 3NF).
- **Pedagogical Note on Moodle Grading (**_**Source Image 3**_**):** When evaluating the dropdown prompt _"Wählen Sie die höchste noch erfüllte Normalform aus"_, selecting `1. Normalform` returned a Red X in the interface context. Why? Because while the table satisfies cell atomicity (1NF), the presence of partial key dependencies (`Produkt-ID` \rightarrow `Produktname`) breaks 2NF, and transitive dependencies break 3NF. If an exam platform evaluates a table containing un-normalized partial/transitive structures as failing relational integrity altogether, or if composite attributes are present, it forces a classification below 1NF (Un-normalized / 0NF). Students must verify whether partial key violations disqualify higher form compliance in specific automated testing prompts.

#### 6.3 KPRIM Exam Pitfall Alert: Normalization Rules

### KPRIM Exam Pitfall Alert: Normalization Rules

|   |   |   |
|---|---|---|
|Statement / Rule Context (German & English)|Correct Choice|Key Technical Justification|
|_Die 1NF verlangt, dass jede Tabelle genau einen Primärschlüssel besitzt._<br>(1NF requires every table to possess exactly one primary key.)|**FALSE /** _**falsch**_|1NF governs attribute atomicity. Relational tables frequently use composite primary keys (_Source Image 3_).|
|_Eine Tabelle in der 2NF befindet sich automatisch auch in der 1NF._<br>(A table in 2NF is automatically also in 1NF.)|**TRUE /** _**richtig**_|Normal forms are strictly hierarchical; 1NF is a prerequisite for 2NF (_Source Image 3_).|
|_Durch die Überführung einer Tabelle in die 2NF werden alle Redundanzen beseitigt._<br>(Transitioning a table to 2NF eliminates all redundancies.)|**FALSE /** _**falsch**_|2NF eliminates partial key dependencies. Transitive dependencies persist until 3NF is reached (_Source Image 3_).|
|_Würde die Menge als 1 Stück, 1 Karton oder 1 Palett in einer Spalte gespeichert, dann ist die 1NF verletzt._<br>(Storing quantities as "1 Stück, 1 Karton" in one column violates 1NF.)|**TRUE /** _**richtig**_|Combining non-atomic, compound values into a single cell violates 1NF atomicity (_Source Image 3_).|
|_In der 3NF sind alle Attribute funktional vom Primärschlüssel abhängig._<br>(In 3NF, all attributes are functionally dependent on the Primary Key.)|**TRUE /** _**richtig**_|3NF removes non-key transitive dependencies, leaving attributes dependent strictly on the PK (_Source Image 3_).|

Mastering normalization rules ensures top-tier performance on the M162 LB2 Theory Exam.

### 7. Comprehensive KPRIM Master Reference & Rapid-Fire Exam Summary

#### 7.1 Consolidated KPRIM Scoring Strategy

KPRIM exam questions consist of four statements per question block, each requiring an independent True (_richtig_) or False (_falsch_) decision. Partial credit is awarded according to the official TBZ grading scale (_Source Images 1–6_):

\text{KPRIM Score} = \begin{cases} \text{100\% Points} & \text{0 Errors (4/4 correct decisions)} \\ \text{50\% Points} & \text{1 Error (3/4 correct decisions)} \\ \text{0\% Points} & \text{>1 Error (\le 2/4 correct decisions)} \end{cases}

#### 7.2 Master KPRIM True/False Rule Matrix

|                      |                                                                                                                                                                                                                                        |                      |                                                                                                                                           |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Domain               | Exam Statement (German Phrasing & English Translation)                                                                                                                                                                                 | Correct Choice       | Ground Truth Technical Justification                                                                                                      |
| **Anomalies**        | _Eine Lösch-Anomalie kann dazu führen, dass beim Löschen eines Teilnehmers unbeabsichtigt Informationen über einen Kurs verloren gehen._<br>(A deletion anomaly can cause unintended loss of course info when deleting a participant.) | **TRUE** (_richtig_) | Deleting the last participant record in an un-normalized table erases the course record (_Source Image 1_).                               |
| **Anomalies**        | _Die E-Mail-Adresse von Anna Keller liegt als redundanten Information in der Tabelle vor._<br>(Storing repeated lecturer emails across multiple rows constitutes redundant data.)                                                      | **TRUE** (_richtig_) | Repeated non-key data across rows represents structural redundancy (_Source Image 1_).                                                    |
| **Anomalies**        | _Wird nur in der ersten Zeile die E-Mail angepasst, spricht man von Einfüge-Anomalie._<br>(Updating an email in only the first row is called an Insertion Anomaly.)                                                                    | **FALSE** (_falsch_) | Partial updating causing inconsistent state is an **Update Anomaly** (_Änderungs-Anomalie_) (_Source Image 1_).                           |
| **Anomalies**        | _Eine Einfüge-Anomalie bedeutet, dass Daten beim Einfügen automatisch doppelt gespeichert werden._<br>(Insertion anomaly means data is automatically duplicated during insertion.)                                                     | **FALSE** (_falsch_) | Insertion anomaly means valid data cannot be added without incomplete/dummy fields (_Source Image 1_).                                    |
| **ERD Notation**     | _Das ERD stellt 4 Entitäten dar._<br>(An ERD displaying 4 distinct rectangular boxes represents 4 entities.)                                                                                                                           | **TRUE** (_richtig_) | Entity boxes map 1:1 to represented entity concepts (_Source Image 2_).                                                                   |
| **ERD Notation**     | _Der Strich wird als Beziehung bezeichnet. Die Symbole am Ende werden als Kardinalitäten bezeichnet._<br>(Lines represent relationships; end symbols represent cardinalities.)                                                         | **TRUE** (_richtig_) | Standard ERD notation semantics (_Source Image 2_).                                                                                       |
| **ERD Notation**     | _Für die Umsetzung auf der Datenbank ist für die Beziehung zwischen Bestellung und Bestellposition eine Zwischentabelle nötig._<br>(A 1:n relationship requires a junction table for DB implementation.)                               | **FALSE** (_falsch_) | 1:n relationships embed a Foreign Key directly into the child table; no junction table needed (_Source Image 2_).                         |
| **ERD Notation**     | _Bei der Darstellung in der Aufgabenstellung handelt es sich um ein logisches ERD._<br>(The diagram lacking attribute lists, PK/FK labels, and data types is a logical ERD.)                                                           | **FALSE** (_falsch_) | Diagrams missing attribute lists and key definitions represent **Conceptual ERDs** (_Source Image 2_).                                    |
| **Normal Forms**     | _Die 1NF verlangt, dass jede Tabelle genau einen Primärschlüssel besitzt._<br>(1NF requires every table to possess exactly one primary key.)                                                                                           | **FALSE** (_falsch_) | 1NF governs cell atomicity, not primary key count constraints (_Source Image 3_).                                                         |
| **Normal Forms**     | _Eine Tabelle in der 2NF befindet sich automatisch auch in der 1NF._<br>(A table in 2NF is automatically also in 1NF.)                                                                                                                 | **TRUE** (_richtig_) | Progression across normal forms is strictly cumulative and hierarchical (_Source Image 3_).                                               |
| **Normal Forms**     | _Durch die Überführung einer Tabelle in die 2NF werden alle Redundanzen beseitigt._<br>(Transitioning a table to 2NF eliminates all redundancies.)                                                                                     | **FALSE** (_falsch_) | Transitive dependencies persist in 2NF until decomposed under 3NF rules (_Source Image 3_).                                               |
| **Normal Forms**     | _Würde die Menge als 1 Stück, 1 Karton in einer Spalte gespeichert, ist die 1NF verletzt._<br>(Storing non-atomic quantities in a single column violates 1NF.)                                                                         | **TRUE** (_richtig_) | Non-atomic composite strings directly violate 1NF atomicity (_Source Image 3_).                                                           |
| **Normal Forms**     | _In der 3NF sind alle Attribute funktional vom Primärschlüssel abhängig._<br>(In 3NF, all attributes are functionally dependent on the Primary Key.)                                                                                   | **TRUE** (_richtig_) | 3NF eliminates all non-key transitive dependencies (_Source Image 3_).                                                                    |
| **Keys & Junctions** | _Jede Entität im ERD hat genau ein Attribut als Primärschlüssel._<br>(Every entity in an ERD must have exactly one attribute as its PK.)                                                                                               | **FALSE** (_falsch_) | Junction tables frequently utilize **composite primary keys** (_Source Image 4_).                                                         |
| **Keys & Junctions** | _Eine Person kann mehreren Klassen zugewiesen werden. Pro Zuweisung kann die Rolle gewählt werden._<br>(A person can be assigned to multiple classes with a role per assignment.)                                                      | **TRUE** (_richtig_) | Valid interpretation of payload attributes (`FK3 RolleID`) in junction tables (_Source Image 4_).                                         |
| **Keys & Junctions** | _RolleID in PersonHatKlasse müsste Fett dargestellt werden, weil es ein FK ist._<br>(Foreign keys must be formatted in bold text.)                                                                                                     | **FALSE** (_falsch_) | FKs are identified via labels (`FK`, `FK1`), not bold formatting (_Source Image 4_).                                                      |
| **Keys & Junctions** | _Die Beziehung zwischen Person und Klasse liesse sich auch ohne Zwischentabelle modellieren._<br>(The relationship between Person and Class can also be modeled without a junction table.)                                             | **TRUE** (_richtig_) | At the conceptual modeling level, m:n relationships are represented directly between entities without junction tables (_Source Image 4_). |
| **Abstraction**      | _Bei einem logischen Datenmodell werden sowohl Primärschlüssel wie auch Fremdschlüssel dargestellt._<br>(Logical models display both PKs and FKs.)                                                                                     | **TRUE** (_richtig_) | Key mapping is an essential requirement of logical data models (_Source Image 5_).                                                        |
| **Abstraction**      | _Datentypen wie VARCHAR(100) oder INTEGER sind typische Bestandteile des physischen Datenmodells._<br>(Concrete data types belong to physical models.)                                                                                 | **TRUE** (_richtig_) | Physical models define exact DBMS storage parameters (_Source Image 5_).                                                                  |
| **Abstraction**      | _Ein konzeptionelles Datenmodell bildet eine m-m-Beziehung bereits inkl. nötiger Zwischentabelle ab._<br>(Conceptual models map m:m links using junction tables.)                                                                      | **FALSE** (_falsch_) | Conceptual models map m:m relationships directly (_Source Image 5_).                                                                      |
| **Abstraction**      | _Das konzeptionelle Datenmodell enthält bereits alle Informationen, um daraus SQL abzuleiten._<br>(Conceptual models contain all info required to generate SQL scripts.)                                                               | **FALSE** (_falsch_) | Conceptual models lack key definitions, physical tables, and DBMS data types (_Source Image 5_).                                          |
| **Cardinalities**    | _Die Beziehung sagt aus, dass eine Klasse ohne zugewiesene Personen nicht existieren darf._<br>(Under the diagram's `mc-m` link, a Class cannot exist without assigned Persons.)                                                       | **TRUE** (_richtig_) | The mandatory bound (`m` / 1..*) rests on the `Person` side when reading from `Klasse` (_Source Image 6_).                                |
| **Cardinalities**    | _Die Beziehung zwischen Person und Klasse ist eine mc-m-Beziehung (oder m-mc)._<br>(The relationship is an `mc-m` or `m-mc` relationship depending on reading direction.)                                                              | **TRUE** (_richtig_) | Designation depends strictly on bidirectional reading direction (_Source Image 6_).                                                       |
| **Cardinalities**    | _Beim abgebildeten Diagramm handelt es sich um ein konzeptionelles ERD._<br>(The diagram showing entities and cardinalities without attribute lists is conceptual.)                                                                    | **TRUE** (_richtig_) | Diagram lacks attribute lists, PK/FK markers, and data types (_Source Image 6_).                                                          |
| **Cardinalities**    | _Im physischen ERD wird diese Beziehung mit zwei Tabellen modelliert: Person und Klasse._<br>(In the physical ERD, this m:n link is modeled with only two tables.)                                                                     | **FALSE** (_falsch_) | Physical resolution of m:n requires **three** tables (Base A + Junction + Base B) (_Source Image 6_).                                     |