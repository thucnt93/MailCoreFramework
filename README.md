# MailCore2Framwork integration demo

1. Step by step integrate mailcore2 framework to Mac app:
- Checkout MailCore2 into a directory relative to your project.
- Under the build-mac directory, locate the mailcore2.xcodeproj file, and drag this into your Xcode project.
- Link against MailCore 2 as a framework:
   - Go to Build Phases from build target, then under 'Link Binary With Libraries', add MailCore.framework and Security.framework
   - To make sure to use LLVM C++ standard library Open Build Settings, scroll down to 'C++ Standard Library', and select libc++
   - Select target, in Build Phase, expand dependencies, add a Target Dependency of mailcore osx,
   - Goto Editor > Add Build Phase > Copy Files
   - In Build Phase, expand copy file and change it's destination to "Frameworks"
   - Click the + icon and select MailCore.framework.

2. To allow mailcore function work properly, in Xcode -> App Target -> Signing & Capabilities -> App sandbox:
- Enable Incoming connections server
- Enable Outcoming connections server

3. Some instruction for testing app
- port: smtp google port, imap google port, outlook port...
- username: mail,
- pass: signin to mail 
- hostname: some host name like: imap.gmail.com, smtp.gmail.com, smtp-mail.outlook.com...
- fetch gmail: before test this feature, make use you turn off 2 factor verification in gmail account

------00000------
- Note: this way is integrate Mac framework, for Mac static library way, please visit: https://github.com/MailCore/mailcore2/blob/master/build-mac/README.md
