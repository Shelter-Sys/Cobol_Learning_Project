       IDENTIFICATION DIVISION. 
       PROGRAM-ID. GCA.
       

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT contacts ASSIGN TO 'CONTACTS.idx'
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
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
       01 Last_ID PIC 9(5).

       01 Contact_ID Pic 9(5).
       01 New_First_Name PIC  X(50).
       01 New_Last_Name PIC X(50).
       01 New_Phone PIC X(10).
       01 New_Email PIC X(50).
       01 New_Description PIC X(240).

       PROCEDURE DIVISION .
           OPEN I-O contacts.
           PERFORM DISPLAY-CONTACT.
       
       Main-Menu.
           PERFORM UNTIL ws-file-status = "10"  
           READ contacts NEXT
               AT END
                   MOVE "10" TO ws-file-status
               NOT AT END
                   MOVE ID_CONTACT TO LAST_ID
           END-READ
           END-PERFORM.

           DISPLAY "1: Add new contact; 2: Modify contact"
           DISPLAY "3: Dellete contact, 4: Display contact"
           DISPLAY "5: Close "
           ACCEPT choice.
           EVALUATE choice
              WHEN 1 PERFORM Add-Contact 
              WHEN 2 PERFORM Modify-Contact
              WHEN 3 PERFORM Delet-Contact
              WHEN 4 PERFORM Display-Contact
              WHEN 5 PERFORM Exit-Contact
              WHEN OTHER DISPLAY 'Invalide choice'
               
           
           END-EVALUATE.
           GO TO Main-Menu.

       Add-Contact.
           MOVE LAST_ID TO CONTACT_ID.
           ADD 1 to CONTACT_ID.
           
           DISPLAY "Enter new First Name".
           ACCEPT NEW_FIRST_NAME.
           DISPLAY "Enter new Last Name".
           ACCEPT NEW_LAST_NAME.
           DISPLAY "Enter new Phone Number".
           ACCEPT NEW_PHONE.
           DISPLAY "Enter new Email".
           ACCEPT NEW_EMAIL.
           DISPLAY "Enter new Description".
           ACCEPT NEW_DESCRIPTION.
           
           MOVE CONTACT_ID TO ID_Contact
           MOVE NEW_FIRST_NAME TO First_Name.
           MOVE NEW_LAST_NAME TO Last_Name
           MOVE NEW_PHONE TO Phone
           MOVE NEW_EMAIL TO Email
           MOVE NEW_DESCRIPTION TO Description
           WRITE contact-record
           
           GO TO MAIN-MENU.


       Modify-Contact.
      d    DISPLAY 'Choice 2'
           GO TO MAIN-MENU.
           

       Delet-Contact.
      d    DISPLAY 'Choice 3'
           GO TO MAIN-MENU.
           

       Display-Contact.
       
           PERFORM UNTIL ws-file-status = "10"  
               READ contacts NEXT
               AT END
                   MOVE "10" TO ws-file-status  
               NOT AT END
                   DISPLAY "Contact : " First_Name " | " Last_Name " | " 
           Phone " | " Email" | "Description
           END-READ
           END-PERFORM.

       Exit-Contact.
           CLOSE contacts.
           DISPLAY "End of the Program"
           STOP RUN .
           
           GO TO MAIN-MENU.

           EXIT .
           CLOSE contacts.
           STOP RUN .
       