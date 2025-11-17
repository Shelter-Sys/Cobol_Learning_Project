       IDENTIFICATION DIVISION. 
       PROGRAM-ID. GCA.
       

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT contacts ASSIGN TO 'CONTACTS.idx'
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS ID_Contact .
       
       DATA DIVISION. 
       FILE SECTION. 
       FD contacts.
       01 contact-record.
           05 ID_Contact Pic 9(5).
           05 First_Name PIC  X(50).
           05 Last_Name PIC X(50).
           05 Phone PIC X(10).
           05 Email PIC X(50).
           05 Description PIC X(240).

       WORKING-STORAGE SECTION. 
       01 ws-file-status PIC XX.
       01 choice PIC 9(1).

       PROCEDURE DIVISION .
           OPEN I-O contacts.
           IF ws-file-status NOT = "00"
           DISPLAY "Erreur ouverture fichier"
           STOP RUN.
       
       Main-Menu.
           DISPLAY "1: Add new contact; 2: Modify contact"
           DISPLAY "3: Dellete contact, 4: Display contact"
           DISPLAY "5: Close "
           ACCEPT choice.
           EVALUATE choice
              WHEN 1 PERFORM Add-Contact 
              WHEN 2 PERFORM Modify-Contact
              WHEN 3 PERFORM Delet-Contact
              WHEN 4 PERFORM Display-Contact
              WHEN 5 STOP RUN
              WHEN OTHER DISPLAY 'Invalide choice'
               
           
           END-EVALUATE.
           GO TO Main-Menu.

       Add-Contact.
           DISPLAY 'Choice 1'
           EXIT.

       Modify-Contact.
           DISPLAY 'Choice 2'
           EXIT .

       Delet-Contact.
           DISPLAY 'Choice 3'
           EXIT .

       Display-Contact.
           DISPLAY 'Choice 4'
           EXIT .


           CLOSE contacts.
           STOP RUN .
       