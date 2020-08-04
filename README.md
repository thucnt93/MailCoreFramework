# MailCoreStaticLib
Step by step integrate mail core static lib to Mac app

1. Follow this instruction to integrate mailcore 2 to mac app not via cocoapod:
https://github.com/MailCore/mailcore2/blob/master/build-mac/README.md

2. In App Target -> Signing & Capabilities -> App sandbox:
- Enable Incoming connections server
- Enable Outcoming connections server

3. Some instruction for testing app
- port: smtp google port, imap google port, outlook port...
- username: mail,
- pass: signin to mail 
- hostname: some host name like: imap.gmail.com, smtp.gmail.com, smtp-mail.outlook.com...
- fetch gmail: before test this feature, make use you turn off 2 factor verification,
