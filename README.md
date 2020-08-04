# MailCoreStaticLib
Step by step integrate mail core static lib to Mac app

1. Follow this instruction to integrate mailcore 2 to mac app not via cocoapod:
https://github.com/MailCore/mailcore2/blob/master/build-mac/README.md

2. In App Target -> Signing & Capabilities -> App sandbox:
- Enable Incoming connections server
- Enable Outcoming connections server
