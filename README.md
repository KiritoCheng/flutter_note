# flutter_note

flutter 制作便签 app

## 搭建环境

## Windows install

### System requirements

To install and run Flutter, your development environment must meet these minimum requirements:

- **Operating Systems**: Windows 7 SP1 or later (64-bit), x86-64 based.

- **Disk Space**: 1.64 GB (does not include disk space for IDE/tools).

- **Tools**: Flutter depends on these tools being available in your environment.
  - [Windows PowerShell 5.0](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell) or newer (this is pre-installed with Windows 10)
  - [Git for Windows 2.x](https://git-scm.com/download/win), with the Use Git from the Windows Command Prompt option
    If Git for Windows is already installed, make sure you can run git commands from the command prompt or PowerShell.

### Get the Flutter SDK

&nbsp;&nbsp;&nbsp;1.Download the following installation bundle to get the latest stable release of the Flutter SDK:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[flutter_windows_2.2.3-stable.zip](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_2.2.3-stable.zip)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For other release channels, and older builds, see the SDK releases page.

&nbsp;&nbsp;&nbsp;2.Extract the zip file and place the contained <font color=#008f83>flutter</font>flutter in the desired installation location for the Flutter SDK (for example, <font color=#008f83>C:\Users\<your-user-name>\Documents</font>).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color=#856404>Warning: Do not install Flutter in a directory like C:\Program Files\ that requires elevated privileges.</font>

If you don’t want to install a fixed version of the installation bundle, you can skip steps 1 and 2. Instead, get the source code from the [Flutter repo](https://github.com/flutter/flutter) on GitHub, and change branches or tags as needed. For example:

    C:\src>git clone https://github.com/flutter/flutter.git -b stable

You are now ready to run Flutter commands in the Flutter Console.

### Update your path

If you wish to run Flutter commands in the regular Windows console, take these steps to add Flutter to the PATH environment variable:

- From the Start search bar, enter ‘env’ and select **Edit environment variables for your account**.
- Under **User variables** check if there is an entry called **Path**:
  - If the entry exists, append the full path to <font color=#008f83>flutter\bin</font> using ; as a separator from existing values.
  - If the entry doesn’t exist, create a new user variable named <font color=#008f83>Path</font> with the full path to <font color=#008f83>flutter\bin</font> as its value.

You have to close and reopen any existing console windows for these changes to take effect.

> Note: <font color=#0c5460>As of Flutter’s 1.19.0 dev release, the Flutter SDK contains the dart command alongside the flutter command so that you can more easily run Dart command-line programs. Downloading the Flutter SDK also downloads the compatible version of Dart, but if you’ve downloaded the Dart SDK separately, make sure that the Flutter version of dart is first in your path, as the two versions might not be compatible. The following command tells you whether the flutter and dart commands originate from the same bin directory and are therefore compatible.</font>

````
C:\> where flutter dart
C:\path-to-flutter-sdk\bin\flutter
C:\path-to-flutter-sdk\bin\flutter.bat
C:\path-to-dart-sdk\bin\dart.exe :: this should go after `C:\path-to-flutter-sdk\bin\ commands`
C:\path-to-flutter-sdk\bin\dart
C:\path-to-flutter-sdk\bin\dart.bat```
````

### Run flutter doctor

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

> Note: <font color=#0c5460>If flutter doctor returns that either the Flutter plugin or Dart plugin of Android Studio are not installed, move on to Set up an editor to resolve this issue.</font>

### Set up an editor

You can build apps with Flutter using any text editor combined with our command-line tools. However, we recommend using one of our editor plugins for an even better experience. These plugins provide you with code completion, syntax highlighting, widget editing assists, run & debug support, and more.

<hr/>

#### Install VS Code

VS Code is a lightweight editor with Flutter app execution and debug support.

- [VS Code](https://code.visualstudio.com/), latest stable version

#### Install the Flutter and Dart plugins

1.Start VS Code
2.Invoke **View > Command Palette….**
3.Type “install”, and select **Extensions: Install Extensions.**
4.Type “flutter” in the extensions search field, select **Flutter** in the list, and click **Install**. This also installs the required Dart plugin.

#### Validate your setup with the Flutter Doctor

1.Invoke **View > Command Palette….**
2.Type “doctor”, and select the **Flutter: Run Flutter Doctor.**
3.Review the output in the **OUTPUT** pane for any issues. Make sure to select Flutter from the dropdown in the different Output Options.

<hr/>

#### Android Studio and IntelliJ

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

<hr/>

#### Install Emacs

Emacs is a lightweight editor with support for Flutter and Dart.

- [Emacs](https://www.gnu.org/software/emacs/download.html), latest stable version

#### Install the lsp-dart package

For information on how to install and use the package, see the [lsp-dart documentation](https://emacs-lsp.github.io/lsp-dart/).

<hr/>

### Create a new project with web support

You can use the following steps to create a new project with web support.

### Set up

Run the following commands to use the latest version of the Flutter SDK:

     $ flutter channel stable
     $ flutter upgrade

If Chrome is installed, the <font color=#0c5460>flutter devices</font> command outputs a <font color=#0c5460>Chrome</font> device that opens the Chrome browser with your app running, and a <font color=#0c5460>Web Server</font> that provides the URL serving the app.

     $ flutter devices
     1 connected device:

     Chrome (web) • chrome • web-javascript • Google Chrome 88.0.4324.150

In your IDE, you should see **Chrome (web)** in the device pulldown.

### Create and run

Creating a new project with web support is no different than [creating a new Flutter](https://flutter.dev/docs/get-started/test-drive) project for other platforms.

##### IDE

Create a new app in your IDE and it automatically creates iOS, Android, and web versions of your app. (And macOS, too, if you’ve enabled desktop support.) From the device pulldown, select Chrome (web) and run your app to see it launch in Chrome.

##### Command line

To create a new app that includes web support (in addition to mobile support), run the following commands, substituting myapp with the name of your project:

    $ flutter create myapp
    $ cd myapp

To serve your app from <font color=#0c5460>localhost</font> in Chrome, enter the following from the top of the package:

    $ flutter run -d chrome

<font color=#856404>Warning: Hot reload is not supported in a web browser Currently, Flutter supports hot restart, but not hot reload in a web browser.</font>

##### Build

Run the following command to generate a release build:

    $ flutter build web

A release build uses [dart2js](https://dart.dev/tools/dart2js) (instead of the [development compiler](https://dart.dev/tools/dartdevc)) to produce a single JavaScript file <font color=#0c5460>main.dart.js.</font> You can create a release build using release mode (<font color=#0c5460>flutter run --release</font>) or by using <font color=#0c5460>flutter build web.</font> This populates a build/web directory with built files, including an assets directory, which need to be served together.

You can also include <font color=#0c5460>--web-renderer html</font> or <font color=#0c5460>--web-renderer canvaskit</font> to select between the HTML or CanvasKit renderers, respectively. For more information, see [Web renderers](https://flutter.dev/docs/development/tools/web-renderers).
