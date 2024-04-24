# gem_app2

A new Flutter project.

## Getting Started
## Figma Url
(https://www.figma.com/file/atc4asYu4uNOB1hcCOwL5w/ChampionFit?type=design&node-id=16-415&mode=design&t=pJPkjS2LAHdLhs1Y-0)
## flutter cli (https://www.youtube.com/watch?v=FkFvQ0SaT1I)
## fix error  => Cleartext HTTP traffic to 10.0.2.2 not permitted flutter
=>E/RecaptchaCallWrapper( 3827): Initial task failed for action RecaptchaAction(action=signInWithPassword)with exception - An internal error has occurred. [ Cleartext HTTP traffic to 10.0.2.2 not permitted ]
///////////
## (https://github.com/firebase/flutterfire/discussions/7769)

Thanks to this answer, I didn't realize there are two AndroidManifest.xml files... When you run the flutter app directly inside IDE like Intellij, it is using the src/debug/AndroidManifest.xml instead of the src/main/AndroidManifest.xml. If you only modified the src/debug/AndroidManifest.xml you won't see effect for android emulator or real device with debug apk.


FCM SEND TO ALL 
https://stackoverflow.com/questions/38237559/how-do-you-send-a-firebase-notification-to-all-devices-via-curl
Also you can add the network config to allow specific domain https://developer.android.com/privacy-and-security/security-config

In src/debug/AndroidManifest.xml i

<application android:networkSecurityConfig="@xml/network_security_config"/>
Create a src/main/res/xml/network_security_config.xml and put

<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <domain-config cleartextTrafficPermitted="true">
        <domain>10.0.2.2:9199</domain>
    </domain-config>
</network-security-config>
///// show doc
Adding a line of code to your app's test config to connect to the emulator.

From the root of your local project directory, running firebase emulators:start.

Using the Local Emulator Suite UI for interactive prototyping, or the Authentication emulator REST API for non-interactive testing.

Call useAuthEmulator() to specify the emulator address and port:


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


////
trainer acc
trainer@gmail.com
trainer123
///
manager acc
manager@gmail.com
manager123
