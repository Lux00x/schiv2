# Datenbank

In der finalen Version fällt die Tabelle IMAGES raus, da die Bilder, welche auf der Webseite 
verwendet werden, im speicher des Frameworks liegen.

Da Apex es uns nicht erlaubt hat, statische Listen mit Beschreibungen zu erstellen,
kommt die Tabelle Meeting_text hinzu, welche Standartbeschreibungen für Meetings enthält.

Zur Root tabelle wurde eine id hinzugefügt, um immer sicher zu stellen, dass nur ein 
password existiert.

Users und Root enthalten die Spalten password und passowordhash. In passwordhash wird das
gehashte password gespeichert. Die password Spalte ist zum schreiben, also ändern, des passwordhashes.
Werte die dort geschrieben werden, werden als hash im passwordhash abgespeichert.
Dies wurde so gemacht, damit beim ändern des hash Verfahrens nicht die ganze Applikation
durschsucht werden muss.

Gändert werden müssen nur die Funktionen zum login eines nutzers und die Trigger zum schreiben
der Tabelle. Ein neuer Hashverfahren kann so auch in einer neuen Spalte gespeichert werden.

Hinzugekommen ist auch lastlogin. Es wird in der Administration verwendet, so dass man Nuzter
finden kann, die sich schon seit längerem nicht angemeldet haben.

![Aktuelles Datenbankschema (Erstellt mit mysql-workbench)](../images/db_final.png)

