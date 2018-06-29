#Spezifikation

##Funktionen / Rechte im überblick

Die folgenden Übersicht zeigt in Stichpunkten die mininale Funktionalität.
Genaue Beschreibungen sind im Bereich [der funktionalen Beschreibung][Funktionale Beschreibung des Projektes] zu finden.
Die [möglichen Erweiterungen][Mögliche Erweiterungen] beschreiben Funktionalität bei der noch nicht fest steht ob
diese eingebaut werden können.

### Student

- Dozenten suchen
- Sprechstunden anschauen, durchsuchen
- Einschreiben in Sprechstunde
- Austragen aus Sprechstunde
- Liste mit aktuellen Eintragungen
- Liste mit vergangen Eintragungen
- Angabe der Fakultät (angepasste Suchfunktion)
- Email ändern
- Password ändern
- Account löschen

###Dozent

- Sprechstunde anlegen/bearbeiten
- Anlegen: einzeln, von - bis (wochentag), Häufigkeit (Wochentag)
- Sprechstunde entfernen/löschen
- Anfragen annehmen, ablehnen (einzeln/alle auf einmal)
- Möglichkeit für automatisches annehmen
- Liste mit aktuellen Sprechstunden
- Liste mit vergangen Sprechstunden
- Angabe der Fakultät (leichteres Auffinden)
- Email ändern
- Password ändern
- Studenten blockieren (Spam)
- Blockierung aufheben
- Account löschen

###Administrator

(zusätzliche Funktionen zum Account)

- Student zu Dozent, Dozent zu Student
- Konten löschen/sperren
- Kann sich selber nur Rechte nehmen
- Fakultäten hinzufügen/bearbeiten/löschen

###root

(rechte wie Administrator)

- Administratoren ernennen/entfernen
- Kein normaler Nutzer (Student/Dozent)
- Extra Login/Oberfläche
- Password ändern

### Mögliche Erweiterungen

- Multilingualität
- Passwort zurücksetzen mit E-mail
- Bestätigungs-E-Mail bei Registrierung
- Bilder ändern
- Tageszusammenfassung für Dozent per E-Mail
- Erinnerungs-E-Mail für Student
- E-Mail bei Änderungen


## Funktionale Beschreibung des Projektes

Ziel des Projekts ist es eine Sprechstundenverwaltung im Internet mit Hilfe
von Oracle Application Express zu entwickeln. Dazu gelten die folgenden Anforderungen
gegliedert nach Benutzrgruppen.

### Allgemein

Um die Anwendung nutzen zu können muss ein passwortgeschütztes Nutzerkonto angelegt werden.
Die Anmeldung kann nur mit einer Hochschul-E-Mailadresse durchgeführ werden. Vor- und
Nachname für die Benutzerinformationen werden aus der E-Mailadresse automatisch erfasst.

Jeder Benutzer (außer der Root-Benutzer) ist ein Student bis er von einem Administrator
zu einem Dozenten erhoben wird. Sowohl Studenten als auch Dozenten können Administrator sein.

Jeder Dozent kann beliebig viele Sprechstunden anlegen, jeder Student sich zu beliebig vielen
anmelden, jedoch pro Sprechstunde nur einmal. Zu Sprechstunden die in der Vergangenheit liegen
kann sich nicht mehr angemeldet werden, bzw. werden diese nicht mehr angezeigt. Zu einer Sprechstunde
kann angegeben werden wie viele Studenten sich maximal anmelden dürfen. Darüber hinaus beinhaltet
eine Sprechstunde die Informationen an welchem Datum und um welche Uhrzeit (von - bis)
sie stattfindet, sowie eine kurze Beschreibung (z.B. regelmäßige Sprechstunde, Klausureinsicht).

Studenten und Dozenten haben die Möglichkeit eine Fakultätszugehörigkeit anzugeben.
Dozenten können damit leichter gesucht werden, Studenten bekommen Dozenten gleicher Fakultät bei
einer Suche vorrangig angezeigt.

Aus Datenschutzgründen ist es jedem Benutzer (außer dem Root-Benutzer) möglich
sich aus dem System zu löschen.

### Student

Ein Student ist in der Lage einen Dozenten anhand des Namens oder der Fakultät suchen zu können.
Bei Bedarf kann sich auch eine Liste aller Dozenten anzeigen lassen. Ist der passende Dozent gefunden
kann der Student die angebotenen Sprechstunden einsehen und sich in eine oder mehr beliebige
davon eintragen (maximal einmal pro Sprechstunde). Wärend der Eintragung in eine Sprechstunde
kann ein Student eine Bemerkung für den Dozenten hinterlassen (z.B. Grund der Besprchung).
Aus einer Sprechstunde kann sich auch ausgetragen werden, dabei kann der Student ebenfalls
eine Bemerkung (z.B. Krankheitsfall) hinterlassen. Es kann eine Liste mit allen noch anstehenden
Terminen eingesehen werden. Zusätzlich kann auch eine Liste mit allen vergangenen Terminen
aufgerufen werden. Darüber hinaus ist es möglich einige Kontoeinstellungen zu tätigen.
Dazu zählen das Ändern der E-Mailadresse (inclusive automatischer Namensanpassung, siehe "Allgemein"),
Änderung des Passworts, einstellen der Fakultät sowie das löschen des eigenen Benutzerkontos.


### Dozent

Einem Dozenten ist es möglich eine Sprechstunde anzulegen. Dazu müssen alle im Absatz "Allgemein"
genannten Bestandteile angegeben werden. Wärend des erstellens einer Sprechstunde kann der Dozent
angeben ob der Termin einmalig, von-bis oder in einer bestimmeten Häufigkeit (z.B. drei mal) erstellt
werden soll. Der Dozent kann eine Liste mit allen noch anstehenden Sprechstundenterminen einsehen.
Ebenso wie eine Liste mit allen vergangenen Sprechstunden. Wird eine Sprechstunde aus einer der Listen
ausgewählt, so sieht der Dozent ob und wer sich für die Sprechstunde angemeldet hat. Sollten bei noch
anstehenden Sprechstunden neue Anmeldungen vorhanden sein sollten diese vom Dozenten entsprechend angenommen
oder abgelehnt werden, dabei ist es möglich alle Anfragen aufeinmal anzunehmen oder abzulehnen.
Dies dient dem Studenten als Rückmeldung. Während der Status einer Anmeldung geändert
wird kann eine Bemerkung zugefügt werden (z.B. ablehnen der Anfrage wegen Kranheitsfall). Werden alle
Anfragen einer Sprechstunde aufeinmal bearbeitet so muss dies nur einmalig durchgeführt werden.
Sowohl beim erstellen einer Sprechstunde als auch im Nachhinein kann angeben werden, dass alle Anfragen
für den Termin automatisch angenommen werden sollen. Eine Sprechstunde kann auch entfernt
oder geändert werden. Im Falle einer Änderung können alle Aspekte eines Termins verändert werden (Datum,
Uhrzeit, maximale Teilnehmer, Beschreibung). Im Falle einer Entfernung werden alle Eintragungen von Studenten automatisch
abgelehnt, der Ablehnungsgrund muss in diesem Fall nur einmal angegeben werden.
Wie auch der Student kann auch der Dozent einige Kontoeinstellungen tätigen. Dabei handelt es sich um
die Selben wie beim Studenten. Zusätzlich kann der Dozent jedoch auch Studenten blockieren um zukünftig
keine Terminanfragen von demjenigen mehr zu erhalten. Die Blockade kann auch wieder rückgangig gemacht werden.


### Administrator

Die Funktionen eines Administrators werden zusätzlich zu den Funktionen eines Studenten oder Dozenten gewährt.
Ein Administrator kann aus einem Studentenkonto ein Dozentkonto machen und umgekert.
Dabei kann ein Administrator sich nicht selber zu einem Dozenten machen, jedoch von einem
Dozenten zu einem Studenten. Darüber hinaus ist es möglich als Administrator ein anderes Benutzerkonto
zu sperren oder gar zu löschen. Zusätzlich kann ein Administrator Fakultäten hinzufügen, bearbeiten
oder entfernen.


### Root-Benutzer

Der Root-Benutzer hat kein normales Benutzerkonto (d.h. ist weder Student noch Dozent). Aufgrund dessen
verfügt der Root-Benutzer über ein eigenes Login, dabei wird lediglich das Passwort benötigt.
Die Funktionen des Root-Kontos sind deckungsgleich mit denen eines Administrators. Zusätzlich kann der
Root-Benutzer jedoch auch Administratorrechte gewähren oder enziehen. Als einzige Kontoeinstellung
kann der Root-Benutzer das Passwort ändern.


### Zusätzliche Funktionen

Sofern es möglich ist werden noch folgende, nach Priorität
sortierte, Funktionen (oder eine Auswahl von diesen) zusätzlich implementiert.

- Einbau von Mehrsprachlichkeit der Anwendung
- Rücksetzungsfunktion für das Passwort
- Bestätigungs-E-Mail während des Regestrierungsvorgangs
- Änderung der in der Applikation verwendeten Bilder durch den Root-Benutzer
- E-Mailbenachrichtigung für den Studenten bei Änderungen bei einer eingetragenen Sprechstunde
- Zusammenfassungs-E-Mail für den Dozenten mit allen anfallenden Terminen des Tages
- E-Mailerrinerung für den Studenten für anstehende Sprechstunden


## Seiteninhaltsbeschreibung

### Anmeldung

Begonnen wird alles auf einer Login-Seite. Dort können sich alle Nutzer anmelden.
Für die Anmeldung werden E-Mailadresse und ein persönliches Password verwendet.


### Registrierung

Ist ein Nutzer noch nicht im System, muss sich dieser erst Registrieren.
Möglich ist dies durch einen Klick auf den Button Registrieren welcher sich auf der Login-Seite befindet, 
wodurch er auf eine extra Seite kommt. Für die Registrierung wird eine E-Mailadresse benötigt, 
und das Password muss zweimal angegeben werden.


### Allgemeiner Seitenaufbau

In der Navigationsleiste findet sich neben dem Logout-Button der Link zur administrations Seite, 
sofern die Berechtigung freigeschalten wurde.

Die Registrierkarten enthalten die grundlegenden Seiten: "Startseite", "Vergangene Termine" und "Einstellungen".

Der Navigationspfad zeigt immer an in welchem Bereich man sich befindet. 
Inbegriffen sind auch variable Informationen wie Dozent oder Termin.

Beispiel: \
Home > Dozenten > \[dozenten.name] > \[sprechstunde.beschreibung] > Einschreibung \
Home > Dozenten > Hans Mayer > Klausureinsicht > Einschreibung


### Startseite

Nach dem Login kommt der Nutzer auf die Startseite.


#### Student

Im Falle eines Studenten ist im oberen Bereich eine Suchleiste zum Suchen von Dozenten. 
Nebenan ist noch ein Button "Alle Dozenten".
Bei der Suche oder beim Klick auf den Button "Alle Dozenten" kommt der Nutzer auf die Suchseite.

Im unteren Bereich ist eine Liste mit aktiven, bestätigten und abgelehnten Anfragen.
Sichtbar ist jeweils die Zusammenfassung einer Anfrage.
Beim Klick auf eine Anfrage kommt der Nutzer zu einer Detailansicht.


#### Dozent

Bei einem Dozenten ist im oberen Bereich nur der Button "Neue Sprechstunde erstellen" vorhanden.

Im unteren Bereich findet sich eine Liste mit den erstellten Sprechstunden.
Angezeigt wird jeweils die Zusammenfassung eines Termins.
Beim Klick auf einen Termin öffnet sich eine Detailansicht.


### Detailansicht Student

Angezeigt werden alle Informationen zu der Anfrage.
Ein Student kann sich mit dem Klick auf "Austragen" aus der Sprechstunde wieder austragen.
Jedoch muss ein Grund angegeben werden. Dieser kann aus einer Liste ausgewählt werden oder im Freitext beschrieben werden.


### Detailansicht Dozent

Bei einer Sprechstunde werden alle Informationen angezeigt.
Es ist dem Dozenten möglich Datum, Uhrzeit, Einheiten, Betreff so wie "automatisches annehmen" zu bearbeiten.
Die angezeigten Anfragen der Studenten können angenommen und abgelehnt werden. 

Ein Student kann blockiert werden. Hierzu wird bei einem Klick auf "Student blockieren" in die Einstellungen weitergeleitet.

Beim Ablehnen muss ein Grund angegeben werden. Dieser kann aus einer Liste ausgewählt oder als Freitext angegeben werden.
Auch ist es möglich die Sprechstunde zu löschen, so wie alle ausstehenden Anträge auf einmal anzunehmen oder abzulehnen.

Beim Löschen muss ein Grund angegeben und nochmals bestätigt werden.


### Neue Sprechstunde erstellen

Hier gibt es Felder für Datum, Dauer, Betreff, Anzahl der Studenten die sich maximal amelden können und 
Auswahlfelder für "wöchentliche Wiederholung" und "automatisches annehmen".

Bei Auswahl der "wöchentlichen Wiederholung" erscheint noch ein weiteres Feld für das Enddatum.

Für den Betreff gibt es eine Liste sowie die Möglichkeit Freitext anzugeben.

Die Seite kann mit "erstellen", "abbrechen" oder über den Navigationspfad verlassen werden.


### Liste mit vergangen Terminen

Bei allen Nutzern gibt es eine Seite auf der alle vergangen Termine angezeigt werden.


### Einstellungen

In den Einstellungen können E-Mailaddresse, Password und Angabe der Fakultät geändert werden.
Hier besteht auch die möglichkeit seinen eigenen Account zu löschen. Dies muss dann nochmals bestätigt werden.

#### Dozent

Bei einem Dozenten ist zusätzlich noch eine Liste mit blockierten Studenten zu sehen.
Über ein Eingabefeld kann der Name eines Studenten angegeben werden, der blockiert werden soll. Bei einer Weiterleitung 
ist das Feld bereits mit dem Namen des vorher ausgewählten Studenten ausgefüllt.
Nach bestätig wird der Student in die Liste der blockierten Studenten mit aufgenommen.
Beim eintragen des Names, wird der Dozent durch vorgabe der möglichen Namen unterstützt.

Die Blockierung kann dort auch wieder aufgehoben werden.


### Administration

Der Zugang zur Administration ist neben dem Logout-Button.
Auf dieser Seite befindet sich eine Liste aller Nutzer. 

Den Nutzern kann über ein Auswahl-Feld das Recht "Dozent" gegeben oder genommen werden.
Ist ein Nutzer "Student" so ist dieses Feld bei seinem eigenen Eintrag deaktiviert.

Ein weiteres Feld ist zum sperren des Nutzers.

Nutzer können auch aus der Liste und somit aus dem System gelöscht werden. Das Löschen muss nochmals 
bestätigt werden.


### Root-Login

Für den Root besteht eine extra Login-Seite.


### Root-Startseite

Auf der Startseite befindet sich eine Liste aller Nutzer. Grundsätzlich bestehen alle Möglichkeiten wie 
bei der Administration vorhanden. Zusätzlich kommt zu jedem Nutzer noch die Möglichkeit Administrationsrechte 
zu geben oder zu nehmen.


### Root-Einstellungen

Der Root-Nutzer kann in seinen Einstellungen das Passwort ändern.

## Datenbankschema

Die folgende Abbildung zeigt das Datenbankschema.

![Datenbankschema (Erstellt mit mysql-workbench)](../images/db_.png){#fig:style-colors width=100%}
