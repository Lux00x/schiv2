#Funktionale Beschreibung des Projektes

Ziel des Projekts ist es eine Sprechstundenverwaltung im Internet mit Hilfe
von Oracle Application Express zu entwickeln. Dazu gelten die folgenden Anforderungen
gegliedert nach Benutzrgruppen.

##Allgemein

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

##Student

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


##Dozent

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


##Administrator

Die Funktionen eines Administrators werden zusätzlich zu den Funktionen eines Studenten oder Dozenten gewährt.
Ein Administrator kann aus einem Studentenkonto ein Dozentkonto machen und umgekert.
Dabei kann ein Administrator sich nicht selber zu einem Dozenten machen, jedoch von einem
Dozenten zu einem Studenten. Darüber hinaus ist es möglich als Administrator ein anderes Benutzerkonto
zu sperren oder gar zu löschen. Zusätzlich kann ein Administrator Fakultäten hinzufügen, bearbeiten
oder entfernen.


##Root-Benutzer

Der Root-Benutzer hat kein normales Benutzerkonto (d.h. ist weder Student noch Dozent). Aufgrund dessen
verfügt der Root-Benutzer über ein eigenes Login, dabei wird lediglich das Passwort benötigt.
Die Funktionen des Root-Kontos sind deckungsgleich mit denen eines Administrators. Zusätzlich kann der
Root-Benutzer jedoch auch Administratorrechte gewähren oder enziehen. Als einzige Kontoeinstellung
kann der Root-Benutzer das Passwort ändern.


##Zusätzliche Funktionen

Sofern es möglich ist werden noch folgende, nach Priorität
sortierte, Funktionen (oder eine Auswahl von diesen) zusätzlich implementiert.

- Einbau von Mehrsprachlichkeit der Anwendung
- Rücksetzungsfunktion für das Passwort
- Bestätigungs-E-Mail während des Regestrierungsvorgangs
- Änderung der in der Applikation verwendeten Bilder durch den Root-Benutzer
- E-Mailbenachrichtigung für den Studenten bei Änderungen bei einer eingetragenen Sprechstunde
- Zusammenfassungs-E-Mail für den Dozenten mit allen anfallenden Terminen des Tages
- E-Mailerrinerung für den Studenten für anstehende Sprechstunden


