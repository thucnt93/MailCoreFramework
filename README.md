# MailCoreFramwork
Step by step integrate mail core framework to Mac app

1. Follow this instruction to integrate mailcore 2 to mac app not via cocoapod ():
- Go to Build Phases from build target, then under 'Link Binary With Libraries', add MailCore.framework and Security.framework
- To make sure to use LLVM C++ standard library Open Build Settings, scroll down to 'C++ Standard Library', and select libc++
- Select target, in Build Phase, expand dependencies, add a Target Dependency of mailcore osx,
- Goto Editor > Add Build Phase > Copy Files
- In Build Phase, expand copy file and change it's destination to "Frameworks"
- Click the + icon and select MailCore.framework.

2. In App Target -> Signing & Capabilities -> App sandbox:
- Enable Incoming connections server
- Enable Outcoming connections server

3. Some instruction for testing app
- port: smtp google port, imap google port, outlook port...
- username: mail,
- pass: signin to mail 
- hostname: some host name like: imap.gmail.com, smtp.gmail.com, smtp-mail.outlook.com...
- fetch gmail: before test this feature, make use you turn off 2 factor verification in gmail account

------*****------
Note: this way is integrate Mac framework, for Mac static library way, please visit: https://github.com/MailCore/mailcore2/blob/master/build-mac/README.md
