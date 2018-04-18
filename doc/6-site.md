#Seiteninhaltsbeschreibung

##Anmeldung

Begonnen wird alles auf einer Login-Seite. Dort können sich alle Nutzer anmelden.
Für die Anmeldung werden E-Mailadresse und ein persönliches Password verwendet.


##Registrierung

Ist ein Nutzer noch nicht im System, muss sich dieser erst Registrieren.
Möglich ist dies durch einen Klick auf den Button Registrieren welcher sich auf der Login-Seite befindet, 
wodurch er auf eine extra Seite kommt. Für die Registrierung wird eine E-Mailadresse benötigt, 
und das Password muss zweimal angegeben werden.


##Allgemeiner Seitenaufbau

In der Navigationsleiste findet sich neben dem Logout-Button der Link zur administrations Seite, 
sofern die Berechtigung freigeschalten wurde.

Die Registrierkarten enthalten die grundlegenden Seiten: "Startseite", "Vergangene Termine" und "Einstellungen".

Der Navigationspfad zeigt immer an in welchem Bereich man sich befindet. 
Inbegriffen sind auch variable Informationen wie Dozent oder Termin.

Beispiel: \
Home > Dozenten > \[dozenten.name] > \[sprechstunde.beschreibung] > Einschreibung \
Home > Dozenten > Hans Mayer > Klausureinsicht > Einschreibung


##Startseite

Nach dem Login kommt der Nutzer auf die Startseite.


###Student

Im Falle eines Studenten ist im oberen Bereich eine Suchleiste zum Suchen von Dozenten. Nebenan ist noch ein Button "Alle Dozenten".
Bei der Suche oder beim Klick auf den Button "Alle Dozenten" kommt der Nutzer auf die Suchseite.

Im unteren Bereich ist eine Liste mit aktiven, bestätigten und abgelehnten Anfragen.
Sichtbar ist jeweils die Zusammenfassung einer Anfrage.
Beim Klick auf eine Anfrage kommt der Nutzer zu einer Detailansicht.


###Dozent

Bei einem Dozenten ist im oberen Bereich nur der Button "Neue Sprechstunde erstellen" vorhanden.

Im unteren Bereich findet sich eine Liste mit den erstellten Sprechstunden.
Angezeigt wird jeweils die Zusammenfassung eines Termins.
Beim Klick auf einen Termin öffnet sich eine Detailansicht.


##Detailansicht Student

Angezeigt werden alle Informationen zu der Anfrage.
Ein Student kann sich mit dem Klick auf "Austragen" aus der Sprechstunde wieder austragen.
Jedoch muss ein Grund angegeben werden. Dieser kann aus einer Liste ausgewählt werden oder im Freitext beschrieben werden.


##Detailansicht Dozent

Bei einer Sprechstunde werden alle Informationen angezeigt.
Es ist dem Dozenten möglich Datum, Uhrzeit, Einheiten, Betreff so wie "automatisches annehmen" zu bearbeiten.
Die angezeigten Anfragen der Studenten können angenommen und abgelehnt werden. 

Ein Student kann blockiert werden. Hierzu wird bei einem Klick auf "Student blockieren" in die Einstellungen weitergeleitet.

Beim Ablehnen muss ein Grund angegeben werden. Dieser kann aus einer Liste ausgewählt oder als Freitext angegeben werden.
Auch ist es möglich die Sprechstunde zu löschen, so wie alle ausstehenden Anträge auf einmal anzunehmen oder abzulehnen.

Beim Löschen muss ein Grund angegeben und nochmals bestätigt werden.


##Neue Sprechstunde erstellen

Hier gibt es Felder für Datum, Dauer, Betreff, Anzahl der Studenten die sich maximal amelden können und 
Auswahlfelder für "wöchentliche Wiederholung" und "automatisches annehmen".

Bei Auswahl der "wöchentlichen Wiederholung" erscheint noch ein weiteres Feld für das Enddatum.

Für den Betreff gibt es eine Liste sowie die Möglichkeit Freitext anzugeben.

Die Seite kann mit "erstellen", "abbrechen" oder über den Navigationspfad verlassen werden.


##Liste mit vergangen Terminen

Bei allen Nutzern gibt es eine Seite auf der alle vergangen Termine angezeigt werden.


##Einstellungen

In den Einstellungen können E-Mailaddresse, Password und Angabe der Fakultät geändert werden.
Hier besteht auch die möglichkeit seinen eigenen Account zu löschen. Dies muss dann nochmals bestätigt werden.

###Dozent

Bei einem Dozenten ist zusätzlich noch eine Liste mit blockierten Studenten zu sehen.
Über ein Eingabefeld kann der Name eines Studenten angegeben werden, der blockiert werden soll. Bei einer Weiterleitung 
ist das Feld bereits mit dem Namen des vorher ausgewählten Studenten ausgefüllt.
Nach bestätig wird der Student in die Liste der blockierten Studenten mit aufgenommen.
Beim eintragen des Names, wird der Dozent durch vorgabe der möglichen Namen unterstützt.

Die Blockierung kann dort auch wieder aufgehoben werden.


##Administration

Der Zugang zur Administration ist neben dem Logout-Button.
Auf dieser Seite befindet sich eine Liste aller Nutzer. 

Den Nutzern kann über ein Auswahl-Feld das Recht "Dozent" gegeben oder genommen werden.
Ist ein Nutzer "Student" so ist dieses Feld bei seinem eigenen Eintrag deaktiviert.

Ein weiteres Feld ist zum sperren des Nutzers.

Nutzer können auch aus der Liste und somit aus dem System gelöscht werden. Das Löschen muss nochmals 
bestätigt werden.


##Root-Login

Für den Root besteht eine extra Login-Seite.


##Root-Startseite

Auf der Startseite befindet sich eine Liste aller Nutzer. Grundsätzlich bestehen alle Möglichkeiten wie 
bei der Administration vorhanden. Zusätzlich kommt zu jedem Nutzer noch die Möglichkeit Administrationsrechte 
zu geben oder zu nehmen.


##Root-Einstellungen

Der Root-Nutzer kann in seinen Einstellungen das Passwort ändern.
