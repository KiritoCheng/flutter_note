# flutter_note

flutter 制作便签 app

## Windows install

## macOS install

---

## System requirements

To install and run Flutter, your development environment must meet these minimum requirements:

- **Operating Systems**: Windows 7 SP1 or later (64-bit), x86-64 based.

- **Disk Space**: 1.64 GB (does not include disk space for IDE/tools).

- **Tools**: Flutter depends on these tools being available in your environment.
  - [Windows PowerShell 5.0](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell) or newer (this is pre-installed with Windows 10)
  - [Git for Windows 2.x](https://git-scm.com/download/win), with the Use Git from the Windows Command Prompt option
    If Git for Windows is already installed, make sure you can run git commands from the command prompt or PowerShell.

---

## Get the Flutter SDK

&nbsp;&nbsp;&nbsp;1.Download the following installation bundle to get the latest stable release of the Flutter SDK:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[flutter_windows_2.2.3-stable.zip](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_2.2.3-stable.zip)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For other release channels, and older builds, see the SDK releases page.

&nbsp;&nbsp;&nbsp;2.Extract the zip file and place the contained <font color=#008f83>flutter</font>flutter in the desired installation location for the Flutter SDK (for example, <font color=#008f83>C:\Users\<your-user-name>\Documents</font>).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<table><tr><td bgcolor=#fff3cd>
<font color=#856404>
<text style="font-weight:bold">Warning:</text> Do not install Flutter in a directory like C:\Program Files\ that requires elevated privileges.</font>
</td></tr></table>
If you don’t want to install a fixed version of the installation bundle, you can skip steps 1 and 2. Instead, get the source code from the [Flutter repo](https://github.com/flutter/flutter) on GitHub, and change branches or tags as needed. For example:

    C:\src>git clone https://github.com/flutter/flutter.git -b stable

You are now ready to run Flutter commands in the Flutter Console.

---

## Update your path

If you wish to run Flutter commands in the regular Windows console, take these steps to add Flutter to the PATH environment variable:

- From the Start search bar, enter ‘env’ and select **Edit environment variables for your account**.
- Under **User variables** check if there is an entry called **Path**:
  - If the entry exists, append the full path to <font color=#008f83>flutter\bin</font> using ; as a separator from existing values.
  - If the entry doesn’t exist, create a new user variable named <font color=#008f83>Path</font> with the full path to <font color=#008f83>flutter\bin</font> as its value.

You have to close and reopen any existing console windows for these changes to take effect.

<table><tr><td bgcolor=#d1ecf1>
<font color=#0c5460>
<text style="font-weight:bold;">Note:</text>As of Flutter’s 1.19.0 dev release, the Flutter SDK contains the dart command alongside the flutter command so that you can more easily run Dart command-line programs. Downloading the Flutter SDK also downloads the compatible version of Dart, but if you’ve downloaded the Dart SDK separately, make sure that the Flutter version of dart is first in your path, as the two versions might not be compatible. The following command tells you whether the flutter and dart commands originate from the same bin directory and are therefore compatible.</font>
</td></tr></table>

````
C:\> where flutter dart
C:\path-to-flutter-sdk\bin\flutter
C:\path-to-flutter-sdk\bin\flutter.bat
C:\path-to-dart-sdk\bin\dart.exe :: this should go after `C:\path-to-flutter-sdk\bin\ commands`
C:\path-to-flutter-sdk\bin\dart
C:\path-to-flutter-sdk\bin\dart.bat```
````

---

## Run flutter doctor

From a console window that has the Flutter directory in the path (see above), run the following command to see if there are any platform dependencies you need to complete the setup:

    C:\src\flutter>flutter doctor

This command checks your environment and displays a report of the status of your Flutter installation. Check the output carefully for other software you might need to install or further tasks to perform (shown in bold text).

For example:

     [-] Android toolchain - develop for Android devices
    • Android SDK at D:\Android\sdk
    ✗ Android SDK is missing command line tools; download from https://goo.gl/XxQghQ
    • Try re-installing or updating your Android SDK,
      visit https://flutter.dev/setup/#android-setup for detailed instructions.

The following sections describe how to perform these tasks and finish the setup process. Once you have installed any missing dependencies, you can run the flutter doctor command again to verify that you’ve set everything up correctly.

<table><tr><td bgcolor=#d1ecf1>
<font color=#0c5460>
<text style="font-weight:bold;">Note:</text> 
If flutter doctor returns that either the Flutter plugin or Dart plugin of Android Studio are not installed, move on to Set up an editor to resolve this issue.</font></td></tr></table>

---

## Platform setup

macOS supports developing Flutter apps in iOS, Android, and the web (technical preview release). Complete at least one of the platform setup steps now, to be able to build and run your first Flutter app.

### Android setup

<table><tr><td bgcolor=#d1ecf1>
<font color=#0c5460>
<text style="font-weight:bold;">Note:</text> 
 Flutter relies on a full installation of Android Studio to supply its Android platform dependencies. However, you can write your Flutter apps in a number of editors; a later step discusses that.
 </font></td></tr></table>

#### Install Android Studio

1. Download and install [Android Studio](https://developer.android.com/studio).
2. Start Android Studio, and go through the ‘Android Studio Setup Wizard’. This installs the latest Android SDK, Android SDK Command-line Tools, and Android SDK Build-Tools, which are required by Flutter when developing for Android.
3. Run <font color=#008f83>flutter doctor</font> to confirm that Flutter has located your installation of Android Studio. If Flutter cannot locate it, run <font color=#008f83>flutter config --android-studio-dir \<directory></font> to set the directory that Android Studio is installed to.

#### Set up your Android device

To prepare to run and test your Flutter app on an Android device, you need an Android device running Android 4.1 (API level 16) or higher.

1. Enable **Developer options** and **USB debugging** on your device. Detailed instructions are available in the [Android documentation](https://developer.android.com/studio/debug/dev-options).
2. Windows-only: Install the [Google USB Driver](https://developer.android.com/studio/run/win-usb).
3. Using a USB cable, plug your phone into your computer. If prompted on your device, authorize your computer to access your device.
4. In the terminal, run the <font color=#0c5460>flutter devices</font> command to verify that Flutter recognizes your connected Android device. By default, Flutter uses the version of the Android SDK where your <font color=#0c5460>adb</font> tool is based. If you want Flutter to use a different installation of the Android SDK, you must set the <font color=#0c5460>ANDROID_SDK_ROOT</font> environment variable to that installation directory.

#### Set up the Android emulator

To prepare to run and test your Flutter app on the Android emulator, follow these steps:

1. Enable [VM acceleration](https://developer.android.com/studio/run/emulator-acceleration) on your machine.
2. Launch **Android Studio**, click the **AVD Manager** icon, and select **Create Virtual Device…**

   - In older versions of Android Studio, you should instead launch **Android Studio > Tools > Android > AVD Manager** and select **Create Virtual Device….** (The **Android** submenu is only present when inside an Android project.)

   - If you do not have a project open, you can choose **Configure > AVD Manager** and select **Create Virtual Device…**

3. Choose a device definition and select **Next**.
4. Select one or more system images for the Android versions you want to emulate, and select **Next**. An x86 or x86_64 image is recommended.
5. Under Emulated Performance, select **Hardware - GLES 2.0** to enable [hardware acceleration](https://developer.android.com/studio/run/emulator-acceleration).
6. Verify the AVD configuration is correct, and select **Finish**.
   For details on the above steps, see [Managing AVDs](https://developer.android.com/studio/run/managing-avds).

7. In Android Virtual Device Manager, click **Run** in the toolbar. The emulator starts up and displays the default canvas for your selected OS version and device.

#### Agree to Android Licenses

Before you can use Flutter, you must agree to the licenses of the Android SDK platform. This step should be done after you have installed the tools listed above.

1. Make sure that you have a version of Java 8 installed and that your <font color=#0c5460>JAVA_HOME</font> environment variable is set to the JDK’s folder.
   Android Studio versions 2.2 and higher come with a JDK, so this should already be done.

2. Open an elevated console window and run the following command to begin signing licenses.

   `$ flutter doctor --android-licenses`

3. Review the terms of each license carefully before agreeing to them.
4. Once you are done agreeing with licenses, run <font color=#0c5460>flutter doctor</font> again to confirm that you are ready to use Flutter.

---

### iOS setup

#### Install Xcode

To develop Flutter apps for iOS, you need a Mac with Xcode installed.

1.  Install the latest stable version of Xcode (using [web download](https://developer.apple.com/xcode/) or the [Mac App Store](https://itunes.apple.com/us/app/xcode/id497799835)).
2.  Configure the Xcode command-line tools to use the newly-installed version of Xcode by running the following from the command line:

        $ sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
        $ sudo xcodebuild -runFirstLaunch

    This is the correct path for most cases, when you want to use the latest version of Xcode. If you need to use a different version, specify that path instead.

3.  Make sure the Xcode license agreement is signed by either opening Xcode once and confirming or running <font color="#008f83">sudo xcodebuild -license</font> from the command line.

Versions older than the latest stable version may still work, but are not recommended for Flutter development. Using old versions of Xcode to target bitcode is not supported, and is likely not to work.

With Xcode, you’ll be able to run Flutter apps on an iOS device or on the simulator.

#### Set up the iOS simulator

To prepare to run and test your Flutter app on the iOS simulator, follow these steps:

1.  On your Mac, find the Simulator via Spotlight or by using the following command:

         $ open -a Simulator

2.  Make sure your simulator is using a 64-bit device (iPhone 5s or later) by checking the settings in the simulator’s **Hardware > Device** menu.

3.  Depending on your development machine’s screen size, simulated high-screen-density iOS devices might overflow your screen. Grab the corner of the simulator and drag it to change the scale. You can also use the **Window > Physical Size** or **Window > Pixel Accurate** options if your computer’s resolution is high enough.

    - If you are using a version of Xcode older than 9.1, you should instead set the device scale in the **Window > Scale** menu.

#### Create and run a simple Flutter app

To create your first Flutter app and test your setup, follow these steps:

1.  Create a new Flutter app by running the following from the command line:

        $ flutter create my_app

2.  A <font color="#008f83">my_app</font> directory is created, containing Flutter’s starter app. Enter this directory:

        $ cd my_app

3.  To launch the app in the Simulator, ensure that the Simulator is running and enter:

        $ flutter run

#### Deploy to iOS devices

To deploy your Flutter app to a physical iOS device you’ll need to set up physical device deployment in Xcode and an Apple Developer account. If your app is using Flutter plugins, you will also need the third-party CocoaPods dependency manager.

1.  You can skip this step if your apps do not depend on [Flutter plugins](https://flutter.dev/docs/development/packages-and-plugins/developing-packages#types) with native iOS code. [Install and set up CocoaPods](https://guides.cocoapods.org/using/getting-started.html#installation) by running the following commands:

        $ sudo gem install cocoapods

    <table><tr><td bgcolor=#d1ecf1>
    <font color=#0c5460>
    <text style="font-weight:bold;">Note:</text>  The default version of Ruby requires <font color="#008f83">sudo</font> to install the CocoaPods gem. If you are using a Ruby Version manager, you may need to run without <font color="#008f83">sudo</font>.
    </font>
    </td></tr></table>

2.  Follow the Xcode signing flow to provision your project:

    - Open the default Xcode workspace in your project by running <font color=#0c5460>open ios/Runner.xcworkspace</font> in a terminal window from your Flutter project directory.
    - Select the device you intend to deploy to in the device drop-down menu next to the run button.
    - Select the <font color=#0c5460>Runner</font> project in the left navigation panel.
    - In the <font color=#0c5460>Runner</font> target settings page, make sure your Development Team is selected under **Signing & Capabilities > Team.**

    <br/>
    When you select a team, Xcode creates and downloads a Development Certificate, registers your device with your account, and creates and downloads a provisioning profile (if needed).

    - To start your first iOS development project, you might need to sign into Xcode with your Apple ID.
      Development and testing is supported for any Apple ID. Enrolling in the Apple Developer Program is required to distribute your app to the App Store. For details about membership types, see [Choosing a Membership](https://developer.apple.com/support/compare-memberships).
    - The first time you use an attached physical device for iOS development, you need to trust both your Mac and the Development Certificate on that device. Select Trust in the dialog prompt when first connecting the iOS device to your Mac.
      Then, go to the Settings app on the iOS device, select **General > Device Management** and trust your Certificate. For first time users, you may need to select **General > Profiles > Device Management** instead.
    - If automatic signing fails in Xcode, verify that the project’s **General > Identity > Bundle Identifier** value is unique.

3.  Start your app by running <font color=#008f83>flutter run</font> or clicking the Run button in Xcode.

When you select a team, Xcode creates and downloads a Development Certificate, registers your device with your account, and creates and downloads a provisioning profile (if needed).

---

## macOS setup

<table><tr><td bgcolor=#fff3cd>
<font color=#856404>

<text style="font-weight:bold">Warning: Beta!</text>
This area covers desktop support, which is available as a beta release. Beta support still has notable feature gaps,
including accessibility support. You can try a beta snapshot of desktop support on the stable channel,or you can keep up with the latest changes to desktop on the beta channel. For more information, see the <text style="font-weight:bold">Desktop</text> section in [What’s new in Flutter 2.2](https://medium.com/flutter/whats-new-in-flutter-2-2-fd00c65e2039), a free article on Medium.

</font>
</td></tr></table>

### Additional macOS requirements

For macOS desktop development, you need the following in addition to the Flutter SDK:

- [Xcode](https://developer.apple.com/xcode/)
- [CocoaPods](https://cocoapods.org/) if you use plugins

### Enable desktop support

At the command line, perform the following command to enable desktop support

    flutter config --enable-macos-desktop

For more information, see [Desktop support for Flutter](https://flutter.dev/desktop)

---

## Windows setup

<table><tr><td bgcolor=#fff3cd>
<font color=#856404>
<text style="font-weight:bold">Warning:Beta (Win32) and Dev (UWP)!</text> 
  This area covers Windows desktop support, which is available in beta release (Win32) and alpha release (UWP).

The Win32 variant still has notable feature gaps, including accessibility support, while the UWP variant is still in very active development.

You can try a beta snapshot of Win32 desktop support on the stable channel, or you can keep up with the latest changes to desktop on the <font color=#008f83>beta</font> channel. For Windows UWP you need to be on the <font color=#008f83>dev</font> channel.

For more information, see the <text style="font-weight:bold">Desktop</text> section in [What’s new in Flutter 2.2](https://medium.com/flutter/whats-new-in-flutter-2-2-fd00c65e2039), a free article on Medium.

</font>
</td></tr></table>

### Additional Windows requirements

For Windows desktop development, you need the following in addition to the Flutter SDK:

- [Visual Studio 2019](https://visualstudio.microsoft.com/downloads/) (not to be confused with Visual Studio Code). For Win32 you need the “Desktop development with C++” workload installed, including all of its default components. For UWP you need the “Universal Windows Platform development” workload installed, with the optional UWP C++ tools.

### Enable desktop support

At the command line, perform the following command to enable Win32 desktop support:

    $ flutter config --enable-windows-desktop

For Windows UWP desktop support perform the following commands to switch to the dev channel, upgrade Flutter, and enable UWP.

    $ flutter channel dev
    $ flutter upgrade
    $ flutter config --enable-windows-uwp-desktop

For more information, see [Desktop support for Flutter](https://flutter.dev/desktop)

---

## Web setup

Flutter has support for building web applications in the stable channel. Any app created in Flutter 2 automatically builds for the web. To add web support to an existing app, follow the instructions on [Building a web](#buildWeb) application with Flutter when you’ve completed the setup above.

---

## Set up an editor

You can build apps with Flutter using any text editor combined with our command-line tools. However, we recommend using one of our editor plugins for an even better experience. These plugins provide you with code completion, syntax highlighting, widget editing assists, run & debug support, and more.

### Install VS Code

VS Code is a lightweight editor with Flutter app execution and debug support.

- [VS Code](https://code.visualstudio.com/), latest stable version

#### Install the Flutter and Dart plugins

1. Start VS Code
2. Invoke **View > Command Palette….**
3. Type “install”, and select **Extensions: Install Extensions.**
4. Type “flutter” in the extensions search field, select **Flutter** in the list, and click **Install**. This also installs the required Dart plugin.

#### Validate your setup with the Flutter Doctor

1. Invoke **View > Command Palette….**
2. Type “doctor”, and select the **Flutter: Run Flutter Doctor.**
3. Review the output in the **OUTPUT** pane for any issues. Make sure to select Flutter from the dropdown in the different Output Options.

### Android Studio and IntelliJ

Android Studio offers a complete, integrated IDE experience for Flutter.

- [Android Studio](https://developer.android.com/studio), version 3.0 or later

Alternatively, you can also use IntelliJ:

- [IntelliJ IDEA Community](https://www.jetbrains.com/idea/download/), version 2017.1 or later
- [IntelliJ IDEA Ultimate](https://www.jetbrains.com/idea/download/), version 2017.1 or later

#### Install the Flutter and Dart plugins

The installation instructions vary by platform.

#### Mac

Use the following instructions for macos:
1.Start Android Studio.
2.Open plugin preferences (**Preferences > Plugins** as of v3.6.3.0 or later).
3.Select the Flutter plugin and click **Install**.
4.Click **Yes** when prompted to install the Dart plugin.
5.Click **Restart** when prompted.

#### Linux or Windows

Use the following instructions for Linux or WIndows:

1.Open plugin preferences **(File > Settings > Plugins)**.
2.Select **Marketplace**, select the Flutter plugin and click **Install.**

### Install Emacs

Emacs is a lightweight editor with support for Flutter and Dart.

- [Emacs](https://www.gnu.org/software/emacs/download.html), latest stable version

#### Install the lsp-dart package

For information on how to install and use the package, see the [lsp-dart documentation](https://emacs-lsp.github.io/lsp-dart/).

---

## <span id="buildWeb">Create a new project with web support</span>

You can use the following steps to create a new project with web support.

## Set up

Run the following commands to use the latest version of the Flutter SDK:

     $ flutter channel stable
     $ flutter upgrade

If Chrome is installed, the <font color=#0c5460>flutter devices</font> command outputs a <font color=#0c5460>Chrome</font> device that opens the Chrome browser with your app running, and a <font color=#0c5460>Web Server</font> that provides the URL serving the app.

     $ flutter devices
     1 connected device:

     Chrome (web) • chrome • web-javascript • Google Chrome 88.0.4324.150

In your IDE, you should see **Chrome (web)** in the device pulldown.

## Create and run

Creating a new project with web support is no different than [creating a new Flutter](https://flutter.dev/docs/get-started/test-drive) project for other platforms.

### IDE

Create a new app in your IDE and it automatically creates iOS, Android, and web versions of your app. (And macOS, too, if you’ve enabled desktop support.) From the device pulldown, select Chrome (web) and run your app to see it launch in Chrome.

### Command line

To create a new app that includes web support (in addition to mobile support), run the following commands, substituting myapp with the name of your project:

    $ flutter create myapp
    $ cd myapp

To serve your app from <font color=#0c5460>localhost</font> in Chrome, enter the following from the top of the package:

    $ flutter run -d chrome

<table><tr><td bgcolor=#fff3cd>
<font color=#856404>
<text style="font-weight:bold">Warning:</text> Hot reload is not supported in a web browser Currently, Flutter supports hot restart, but not hot reload in a web browser.</font>
</td></tr></table>

---

### Build

Run the following command to generate a release build:

    $ flutter build web

A release build uses [dart2js](https://dart.dev/tools/dart2js) (instead of the [development compiler](https://dart.dev/tools/dartdevc)) to produce a single JavaScript file <font color=#0c5460>main.dart.js.</font> You can create a release build using release mode (<font color=#0c5460>flutter run --release</font>) or by using <font color=#0c5460>flutter build web.</font> This populates a build/web directory with built files, including an assets directory, which need to be served together.

You can also include <font color=#0c5460>--web-renderer html</font> or <font color=#0c5460>--web-renderer canvaskit</font> to select between the HTML or CanvasKit renderers, respectively. For more information, see [Web renderers](https://flutter.dev/docs/development/tools/web-renderers).
