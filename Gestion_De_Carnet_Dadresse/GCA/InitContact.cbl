       IDENTIFICATION DIVISION.
       PROGRAM-ID. InitContacts.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT contacts ASSIGN TO 'CONTACTS.idx'
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
               RECORD KEY IS ID_Contact
               FILE STATUS IS ws-file-status.
       
       DATA DIVISION.
       FILE SECTION.
       FD contacts.
       01 contact-record.
           05 ID_Contact    PIC 9(5).
           05 First_Name    PIC X(50).
           05 Last_Name     PIC X(50).
           05 Phone         PIC X(10).
           05 Email         PIC X(50).
           05 Description   PIC X(240).
       
       WORKING-STORAGE SECTION.
       01 ws-file-status PIC XX VALUE SPACES.
       
       
       PROCEDURE DIVISION.
       BEGIN.
           OPEN OUTPUT contacts
           IF ws-file-status NOT = "00"
               DISPLAY "Erreur création fichier : " ws-file-status
               STOP RUN
           END-IF
       
           MOVE 1 TO ID_Contact
           MOVE "Jean" TO First_Name
           MOVE "Dupont" TO Last_Name
           MOVE "0102030405" TO Phone
           MOVE "jean.dupont@mail.com" TO Email
           MOVE "Premier contact" TO Description
           WRITE contact-record
       
           MOVE 2 TO ID_Contact
           MOVE "Alice" TO First_Name.
           MOVE "Martin" TO Last_Name
           MOVE "0607080910" TO Phone
           MOVE "alice.martin@mail.com" TO Email
           MOVE "Deuxième contact" TO Description
           WRITE contact-record

           MOVE 3 TO ID_Contact
           MOVE "Bob" TO First_Name.
           MOVE "Richard" TO Last_Name
           MOVE "0656219845" TO Phone
           MOVE "bob.richard@mail.com" TO Email
           MOVE "Ce mec est horible quoi" TO Description
           WRITE contact-record

           CLOSE contacts

           OPEN INPUT contacts.
           PERFORM UNTIL ws-file-status = "10"  *> code fin fichier
               READ contacts NEXT
                   AT END
                   MOVE "10" TO ws-file-status
               NOT AT END
                   DISPLAY "Contact : " First_Name " " Last_Name " " Pho
      -    ne " " Email
           END-READ
           END-PERFORM.
           CLOSE contacts
           
           DISPLAY "Fichier initialisé avec deux enregistrements."
           STOP RUN.
       