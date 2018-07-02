# Datenbank

In der finalen Version fällt die Tabelle IMAGES raus, da die Bilder, welche auf der Webseite 
verwendet werden, im Speicher des Frameworks liegen.

Da Apex es uns nicht erlaubt hat, statische Listen mit Beschreibungen zu erstellen,
kommt die Tabelle MEETING_TEXT hinzu, welche Standartbeschreibungen für Meetings enthält.

Zur Root-Tabelle wurde eine ID hinzugefügt, um immer sicher zu stellen, dass nur ein 
Passwort existiert.

Users und Root enthalten die Spalten password und passowordhash. In passwordhash wird das
gehashte password gespeichert. Die password Spalte ist zum schreiben, also ändern, des passwordhashes.
Werte die dort geschrieben werden, werden als hash im passwordhash abgespeichert.
Dies wurde so gemacht damit, beim Ändern des Hashverfahrens, nicht die ganze Applikation
durschsucht werden muss.

Geändert werden müssen nur die Funktionen zum Login eines Nutzers und die Trigger zum Schreiben
der Tabelle. Ein neues Hashverfahren kann so auch in einer neuen Spalte gespeichert werden.

Hinzugekommen ist auch lastlogin. Es wird in der Administration verwendet, sodass man Nuzter
finden kann, die sich schon seit Längerem nicht angemeldet haben.

![Aktuelles Datenbankschema (Erstellt mit mysql-workbench)](../images/db_final.png)

