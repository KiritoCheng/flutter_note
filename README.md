# Flutter APP Demo

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为了让我们更好的深入学习 Flutter 的架构与设计，在这里，我们制作出了一个以 Flutter 为基础框架的移动端 APP，该 APP 是一个简单的便签记事本，具备基本的增删改查功能，网络请求等，好方便我们对 Flutter 有一个系统的认识。  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;接下来，请看我们如何起步一个 Flutter 应用。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In order to better understand the structure and design of Flutter, we created a mobile APP based on the Flutter framework. The APP is a simple notepad, with basic functions of adding, deleting, modifying and checking, network requests, etc.So that we have a systematic understanding of the Flutter.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Then, see how we get started with a Flutter app.

<div align="center">

[English](#englishDoc) / [中文文档](#chineseDoc)

</div>

## <span id="englishDoc">System requirements</span>

To install and run Flutter, your development environment must meet these minimum requirements:

- **Operating Systems**: Windows 7 SP1 or later (64-bit), x86-64 based.

- **Disk Space**: 1.64 GB (does not include disk space for IDE/tools).

- **Tools**: Flutter depends on these tools being available in your environment.
  - [Windows PowerShell 5.0](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell) or newer (this is pre-installed with Windows 10)
  - [Git for Windows 2.x](https://git-scm.com/download/win), with the Use Git from the Windows Command Prompt option
    If Git for Windows is already installed, make sure you can run git commands from the command prompt or PowerShell.

## Get the Flutter SDK

&nbsp;&nbsp;&nbsp;1.Download the following installation bundle to get the latest stable release of the Flutter SDK:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[flutter_windows_2.2.3-stable.zip](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_2.2.3-stable.zip)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For other release channels, and older builds, see the [SDK releases](https://flutter.dev/docs/development/tools/sdk/releases) page.

&nbsp;&nbsp;&nbsp;2.Extract the zip file and place the contained <font color=#008f83>flutter</font>flutter in the desired installation location for the Flutter SDK (for example, <font color=#008f83>C:\Users\\\<your-user-name>\Documents</font>).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<table><tr><td bgcolor=#fff3cd>
<font color=#856404>
<text style="font-weight:bold">Warning:</text> Do not install Flutter in a directory like C:\Program Files\ that requires elevated privileges.</font>
</td></tr></table>
If you don’t want to install a fixed version of the installation bundle, you can skip steps 1 and 2. Instead, get the source code from the [Flutter repo](https://github.com/flutter/flutter) on GitHub, and change branches or tags as needed. For example:

    C:\src>git clone https://github.com/flutter/flutter.git -b stable

You are now ready to run Flutter commands in the Flutter Console.

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
If flutter doctor returns that either the Flutter plugin or Dart plugin of Android Studio are not installed, move on to [Set up an editor](#setEditorEnglish) to resolve this issue.</font></td></tr></table>

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
      ![avatar](https://flutter.dev/images/setup/xcode-account.png)
      Development and testing is supported for any Apple ID. Enrolling in the Apple Developer Program is required to distribute your app to the App Store. For details about membership types, see [Choosing a Membership](https://developer.apple.com/support/compare-memberships).
    - The first time you use an attached physical device for iOS development, you need to trust both your Mac and the Development Certificate on that device. Select Trust in the dialog prompt when first connecting the iOS device to your Mac.

      ![avatar](https://flutter.dev/images/setup/trust-computer.png)

      Then, go to the Settings app on the iOS device, select **General > Device Management** and trust your Certificate. For first time users, you may need to select **General > Profiles > Device Management** instead.

    - If automatic signing fails in Xcode, verify that the project’s **General > Identity > Bundle Identifier** value is unique.

    ![avatar](https://flutter.dev/images/setup/xcode-unique-bundle-id.png)

3.  Start your app by running <font color=#008f83>flutter run</font> or clicking the Run button in Xcode.

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

## Web setup

Flutter has support for building web applications in the stable channel. Any app created in Flutter 2 automatically builds for the web. To add web support to an existing app, follow the instructions on [Building a web](#buildWeb) application with Flutter when you’ve completed the setup above.

---

## <span id="setEditorEnglish">Set up an editor</span>

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

### Build

Run the following command to generate a release build:

    $ flutter build web

A release build uses [dart2js](https://dart.dev/tools/dart2js) (instead of the [development compiler](https://dart.dev/tools/dartdevc)) to produce a single JavaScript file <font color=#0c5460>main.dart.js.</font> You can create a release build using release mode (<font color=#0c5460>flutter run --release</font>) or by using <font color=#0c5460>flutter build web.</font> This populates a build/web directory with built files, including an assets directory, which need to be served together.

You can also include <font color=#0c5460>--web-renderer html</font> or <font color=#0c5460>--web-renderer canvaskit</font> to select between the HTML or CanvasKit renderers, respectively. For more information, see [Web renderers](https://flutter.dev/docs/development/tools/web-renderers).

### Create and run a simple Flutter app

To create your first Flutter app and test your setup, follow these steps:

1.  Create a new Flutter app by running the following from the command line:

        $ flutter create my_app

2.  A <font color="#008f83">my_app</font> directory is created, containing Flutter’s starter app. Enter this directory:

        $ cd my_app

3.  To launch the app in the Simulator, ensure that the Simulator is running and enter:

        $ flutter run

---

## <span id="chineseDoc">1. 系统要求</span>

要安装和运行 Flutter，您的开发环境必须满足以下最低要求:

- **操作系统：**: Windows 7 SP1 及以上版本(64 位)，基于 x86-64。

- **磁盘空间**: 1.64 GB (不包括用于 IDE/工具的磁盘空间).

- **工具**: Flutter 取决于这些工具在您的环境中是否可用。
  - [Windows PowerShell 5.0](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell)或者更改版本 (这是预装在 Windows 10 上的)
  - [Git for Windows 2.x](https://git-scm.com/download/win)
    如果已经安装了 Git for Windows，请确保可以从命令提示符或 PowerShell 中运行 Git 命令。

## 2. 安装 Flutter SDK

### 正常安装

&nbsp;&nbsp;&nbsp;1.下载以下安装包，以获得 Flutter SDK 的最新稳定版本:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[flutter_windows_2.2.3-stable.zip](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_2.2.3-stable.zip)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;要了解其他发布渠道和更早的版本，请参阅[SDK 发布页面](https://flutter.dev/docs/development/tools/sdk/releases)。

&nbsp;&nbsp;&nbsp;2.提取上面下载的 zip 文件并解压到 SDK 所需的安装位置（例如：C:\Users\\\<your-user-name>\Documents）
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<table><tr><td bgcolor=#fff3cd>
<font color=#856404>
<text style="font-weight:bold">注意</text> 不要将Flutter安装在像C:\Program Files\这样需要提升权限的目录中。</font>
</td></tr></table>

### 仓库地址安装

如果您不想安装安装包的固定版本，可以跳过步骤 1 和步骤 2。相反，我们可以从 GitHub 的[地址仓库](https://github.com/flutter/flutter)下载，并根据需要更改分支或标签。例如：

    C:\src>git clone https://github.com/flutter/flutter.git -b stable

### 使用镜像

由于在国内访问 Flutter 有时可能会受到限制，Flutter 官方为中国开发者搭建了临时镜像，大家可以将如下环境变量加入到用户环境变量中：

    export PUB_HOSTED_URL=https://pub.flutter-io.cn
    export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

注意： 此镜像为临时镜像，并不能保证一直可用，读者可以参考[官方地址](https://flutter.io/community/china)以获得有关镜像服务器的最新动态。

现在我们已经做好了执行 Flutter 命令的准备了。

## 3. 更新环境变量

如果你希望在常规 Windows 控制台中运行 Flutter 命令，请执行以下步骤将 Flutter 添加到 PATH 环境变量中:

- 从开始搜索栏, 输入"环境变量"并选择**编辑账户的环境变量**。
- 在**用户变量**下检查是否有一个名为**Path**的条目:

  - 如果条目存在，双击 Path，点击**新建**，添加一条**Flutter 的安装路径\flutter\bin**，安装路径需要目录指向直到结尾为 bin 。如果是手动输入添加，请记住用分号作为分隔符隔开。

  - 如果该条目不存在，则点击**新建**，创建一个名为 Path 的新用户变量，变量值为**Flutter 的安装路径\flutter\bin**。

要使这些更改生效，必须关闭并重新打开任何现有控制台窗口。

<table><tr><td bgcolor=#d1ecf1>
<font color=#0c5460>
<text style="font-weight:bold;">提示：</text>在Flutter的1.19.0开发发布版中，Flutter SDK在Flutter中旁边包含了dart命令，这样您就可以更容易地运行dart命令行程序。下载Flutter SDK也会附带下载Dart的兼容版本，但如果您单独下载了Dart SDK，请确保在您的路径中首先下载Dart的Flutter版本，因为这两个版本可能不兼容。下面的命令告诉您Flutter和Dart命令是否来自同一个bin目录，以此进行兼容。</font>
</td></tr></table>

````
C:\> where flutter dart
C:\path-to-flutter-sdk\bin\flutter
C:\path-to-flutter-sdk\bin\flutter.bat
C:\path-to-dart-sdk\bin\dart.exe :: this should go after `C:\path-to-flutter-sdk\bin\ commands`
C:\path-to-flutter-sdk\bin\dart
C:\path-to-flutter-sdk\bin\dart.bat```
````

## 4. 运行 flutter doctor

在控制台中（如果你未进行上一步操作，需要在 Flutter 目录下的控制台）运行以下命令，来查看是否还需要安装其它依赖，如果需要，安装它们：

    C:\src\flutter>flutter doctor

该命令检查您的环境并显示 Flutter 安装状态的报告。仔细检查输出是否需要安装其他软件或执行进一步的任务。

运行示例:

     [-] Android toolchain - develop for Android devices
    • Android SDK at D:\Android\sdk
    ✗ Android SDK is missing command line tools; download from https://goo.gl/XxQghQ
    • Try re-installing or updating your Android SDK,
      visit https://flutter.dev/setup/#android-setup for detailed instructions.

以下部分描述如何执行这些任务并完成安装过程。一旦您安装了任何缺失的依赖项，您可以再次运行 flutter doctor 命令，以验证您已经正确地设置了所有内容。

<table><tr><td bgcolor=#d1ecf1>
<font color=#0c5460>

<text style="font-weight:bold;">提示：</text>
如果 flutter doctor 返回，Android Studio 的 Flutter 插件或 Dart 插件没有安装，继续[设置编辑器](#setEditorChinese)来解决这个问题。</font></td></tr></table>

---

## 5. 设置支持

### Windows

#### 额外的 Windows 需求

对于 Windows 桌面开发，除了 Flutter SDK 外，还需要以下工具:

- [Visual Studio 2019](https://visualstudio.microsoft.com/downloads/) (not to be confused with Visual Studio Code). [Visual Studio 2019](https://visualstudio.microsoft.com/downloads/)

#### 启用桌面支持

在命令行中，执行以下命令来启用 Win32 桌面支持:

    $ flutter config --enable-windows-desktop

对于 Windows UWP 桌面支持，执行以下命令切换到 dev 通道，升级 Flutter，并启用 UWP。

    $ flutter channel dev
    $ flutter upgrade
    $ flutter config --enable-windows-uwp-desktop

有关更多信息，请参见桌面对[Flutter 的支持](https://flutter.dev/desktop)

### macOS

#### 额外的 macOS 需求

对于 macOS 桌面开发，除了 Flutter SDK 外，您还需要以下工具:

- [Xcode](https://developer.apple.com/xcode/)
- 如果你使用插件 [CocoaPods](https://cocoapods.org/)

#### 启用桌面支持

在命令行中，执行以下命令以启用桌面支持

    flutter config --enable-macos-desktop

有关更多信息，请参见 [桌面对 Flutter 的支持](https://flutter.dev/desktop)

### Web 设置

Flutter 支持在稳定通道中构建 web 应用程序。在 Flutter 2 中创建的任何应用程序都会自动为 web 构建。要在现有的应用程序中添加 web 支持，请在完成上述设置后，按照使用 Flutter[构建 web 应用程序](#buildWebChinese)的说明进行操作。

---

## 6. 移动设备设置

macOS 支持在 iOS、Android 和 web 上开发 Flutter 应用程序(技术预览版)，windows 上并不支持 ios 开发。现在至少完成一个平台设置步骤，以便能够构建和运行您的第一个 Flutter 应用程序。

### 安卓设置

<table><tr><td bgcolor=#d1ecf1>
<font color=#0c5460>
<text style="font-weight:bold;">提示：</text> 
 Flutter依赖于Android Studio的完整安装来提供它对Android平台的依赖。不过，你可以在许多编辑器中编写Flutter应用程序;后面的步骤将对此进行讨论。
 </font></td></tr></table>

#### 安装 Android Studio

1. 下载并安装 [Android Studio](https://developer.android.com/studio).
2. 启动 Android Studio，并通过“Android Studio 安装向导”。这将安装最新的 Android SDK、Android SDK 命令行工具和 Android SDK 构建工具，这些都是 Flutter 在为 Android 开发时所需要的。
3. 玉兴 <font color=#008f83>flutter doctor</font> 确认 Flutter 已经定位到 Android Studio 的安装。 如果 Flutter 找不到它, 运行 <font color=#008f83>flutter config --android-studio-dir \<directory></font> 来手动设置 Android Studio 的安装目录。

#### 设置你的 Android 设备

为了准备在 Android 设备上运行和测试 Flutter 应用程序，您需要一台运行 Android 4.1 (API 级别 16)或更高的 Android 设备。

1. 在您的设备上启用**开发人员选项**和**USB 调试**。详细的说明可以在[Android 文档](https://developer.android.com/studio/debug/dev-options)中找到。
2. 仅 windows:安装 [Google USB Driver](https://developer.android.com/studio/run/win-usb)。
3. 用 USB 数据线把手机和电脑连接起来。如果在您的设备上出现提示，请授权您的计算机访问您的设备。
4. 在终端, 运行 <font color=#0c5460>flutter devices</font> 命令来验证 Flutter 是否识别您连接的 Android 设备. 默认情况下，Flutter 使用基于<font color=#0c5460>adb</font>工具的 Android SDK 版本。如果希望 Flutter 使用不同的 Android SDK 安装，则必须将<font color=#0c5460>ANDROID_SDK_ROOT</font> 环境变量设置为该安装目录。

#### 设置安卓模拟器

要准备在 Android 模拟器上运行和测试 Flutter 应用程序，请遵循以下步骤:

1. 确认你的计算机 bios 里，已经开启了[VM acceleration](https://developer.android.com/studio/run/emulator-acceleration)设置。
2. 打开**Android Studio**, 点击 **AVD Manager** 图标, 并且选择 **Create Virtual Device…**

   - 在旧版本的 Android Studio 中, 你应该点击 **Android Studio > Tools > Android > AVD Manager** 并且选择 **Create Virtual Device….** (视图上 **Android** 子菜单只在 Android 项目中出现。)

   - 如果你没有打开项目，点击 **Configure > AVD Manager** 并且选择 **Create Virtual Device…**

3. 选择一个设备，点击 **Next**.
4. 为要模拟的 Android 版本选择一个或多个系统映像, 点击 **Next**. 推荐使用 x86 或 x86_64 的镜像.
5. 在 Emulated Performance 中, 选择 **Hardware - GLES 2.0** 启用 [hardware acceleration](https://developer.android.com/studio/run/emulator-acceleration).
6. 验证 AVD 配置是否正确， 点击 **Finish**.
   想了解更多的步骤, 请前往 [Managing AVDs](https://developer.android.com/studio/run/managing-avds).
7. 在 **Android Virtual Device Manager**, 在工具栏点击 **Run**. 模拟器就启动了。

#### 同意 Android 许可

在使用 Flutter 之前，您必须同意 Android SDK 平台的许可。这个步骤应该在安装了上面列出的工具之后完成。

1. 确保安装了 Java 8 版本，并将 <font color=#0c5460>JAVA_HOME</font> 环境变量设置为 JDK 的文件夹。
   Android Studio 2.2 及更高版本附带 JDK，所以这应该已经完成了。

2. 打开一个控制台窗口并运行以下命令开始签名许可证。

   `$ flutter doctor --android-licenses`

3. 在同意每个许可条款之前，请仔细审查这些条款。
4. 一旦你同意了许可证，运行 flutter doctor 再次确认你准备使用 Flutter。

### iOS 设置

#### 安装 Xcode

要开发适用于 iOS 的 Flutter 应用程序，你需要一台安装 Xcode 的 Mac 电脑。

1.  安装最新稳定版本的 Xcode(使用 [web 下载](https://developer.apple.com/xcode/) 或 [Mac App Store](https://itunes.apple.com/us/app/xcode/id497799835))。
2.  配置 Xcode 命令行工具，使用新安装的 Xcode 版本，从命令行运行以下命令::

        $ sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
        $ sudo xcodebuild -runFirstLaunch

    当你想要使用 Xcode 的最新版本时，这是大多数情况下正确的路径。如果您需要使用不同的版本，请指定该路径。

3.  确保 Xcode 许可协议是通过打开 Xcode 一次并确认或从命令行运行<font color="#008f83">sudo xcodebuild -license</font> 来签署的。

比最新稳定版本更老的版本仍然可以工作，但不推荐用于 Flutter 开发。不支持使用旧版本的 Xcode 来定位 bitcode，而且很可能无法工作。

通过 Xcode，你可以在 iOS 设备或模拟器上运行 Flutter 应用程序。

#### 设置 iOS 模拟器

要准备在 iOS 模拟器上运行和测试 Flutter 应用程序，请遵循以下步骤:

1.  在你的 Mac 上，通过 Simulator via Spotlight 或使用以下命令找到模拟器:

         $ open -a Simulator

2.  通过模拟器里设置的 **Hardware > Device** 菜单，确认你的模拟器是使用 64-bit 设备 (iPhone 5s 或更高版本)。

3.  根据开发机器的屏幕大小，模拟的高屏幕密度 iOS 设备可能会溢出你的屏幕。如果你的电脑分辨率足够高的话，拖拽模拟器的角落并拖动它来改变比例。你也能通过 **Window > Physical Size** 或 **Window > Pixel Accurate** 选项来进行设置。

    - 如果你使用的是比 9.1 版本更早的 Xcode，你应该在 **Window > Scale** 菜单中设置设备规模。

#### 连接 iOS 真机设备

要将 Flutter 应用部署到物理 iOS 设备上，你需要在 Xcode 中设置物理设备部署和苹果开发者账户。如果你的应用使用 Flutter 插件，你还需要第三方 CocoaPods 依赖管理器。

1.  如果你的应用程序不依赖于带有本地 iOS 代码的 [Flutter 插件](https://flutter.dev/docs/development/packages-and-plugins/developing-packages#types)，你可以跳过这一步。运行以下命令 [安装和设置 CocoaPods](https://guides.cocoapods.org/using/getting-started.html#installation):

        $ sudo gem install cocoapods

    <table><tr><td bgcolor=#d1ecf1>
    <font color=#0c5460>
    <text style="font-weight:bold;">提示：</text>
    Ruby 的默认版本需要 <font color="#008f83">sudo</font> 来安装 CocoaPods gem。如果您使用的是 Ruby 版本管理器，则可能需要在不使用 <font color="#008f83">sudo</font> 的情况下运行。
    </font>
    </td></tr></table>

2.  遵循 Xcode 签名流程来提供项目:

    - 在项目中打开默认的 Xcode 工作区，在 Flutter 项目目录的终端窗口中运行 <font color=#0c5460>open ios/Runner</font>。。
    - 在运行按钮旁边的设备下拉菜单中选择要部署的设备
    - 在左侧导航面板中选择 <font color=#0c5460>Runner</font> 项目。

    - 在<font color=#0c5460>Runner</font>的 **Signing & Capabilities > Team.** 设置中, 确保您的开发团队被选中。

     <br/>
    当你选择一个团队时，Xcode会创建并下载一个开发证书，用你的账户注册你的设备，并创建并下载一个配置文件(如果需要的话)。

    - 要开始你的第一个 iOS 开发项目，你可能需要用你的苹果 ID 登录到 Xcode。
      ![avatar](https://flutter.dev/images/setup/xcode-account.png)
      支持任何 Apple ID 的开发和测试。要想将你的应用发布到 app Store，你需要注册 Apple Developer Program。有关成员类型的详细信息，请参见 [选择成员](https://developer.apple.com/support/compare-memberships)。

    - 当你第一次使用附加的物理设备进行 iOS 开发时，你需要同时信任你的 Mac 和该设备上的开发证书。当第一次将 iOS 设备连接到你的 Mac 时，在对话框提示中选择信任。

      ![avatar](https://flutter.dev/images/setup/trust-computer.png)

      然后，在 iOS 设备上进入设置，选择 **General > Device Management**信任你的证书。对于第一次使用的用户，可能设置路径是 **General > Profiles > Device Management**。

    - 如果 Xcode 中的自动签名失败，验证项目的 **General > Identity > Bundle Identifier** 值是唯一的。

    ![avatar](https://flutter.dev/images/setup/xcode-unique-bundle-id.png)

3.  通过运行 flutter run 或点击 Xcode 中的 run 按钮来启动应用程序。

---

## <span id="setEditorChinese">7. 设置编辑器</span>

您可以使用任何文本编辑器与命令行工具结合使用 Flutter 构建应用程序。但是，我们推荐使用我们的编辑器插件，以获得更好的体验。这些插件提供了代码完成、语法高亮显示、小部件编辑辅助、运行和调试支持等等。

### 安装 VS Code

VS Code 是一个轻量级编辑器，支持 Flutter 应用程序的执行和调试。

- [VS Code](https://code.visualstudio.com/), 最新稳定版本。

#### 安装 Flutter 和 Dart 插件

1. 打开 VS Code
2. 调用 **View > Command Palette….**
3. 输入"install", 选择 **Extensions: Install Extensions.**
4. 在扩展搜索栏中输入"flutter"，在列表中选择 **flutter**，然后点击 **安装** 。这也安装了所需的 Dart 插件。

#### 用 Flutter Doctor 验证你的设置

1. 调用 **View > Command Palette….**
2. 输入 "doctor", 选择 **Flutter: Run Flutter Doctor.**
3. 查看 **OUTPUT** 窗格中的输出是否存在任何问题。请确保从不同输出选项的下拉菜单中选择 Flutter。

### Android Studio 或者 IntelliJ

Android Studio 为 Flutter 提供了完整的集成 IDE 体验。

- [Android Studio](https://developer.android.com/studio), 版本 3.0 或更高版本

或者，您也可以使用 IntelliJ：

- [IntelliJ IDEA Community](https://www.jetbrains.com/idea/download/), 版本 2017.1 或更高版本
- [IntelliJ IDEA Ultimate](https://www.jetbrains.com/idea/download/), 版本 2017.1 或更高版本

#### 安装 Flutter 和 Dart 插件

安装说明因平台而异。

##### Mac

macos 的使用说明如下:

1. 开启 Android Studio.
2. 打开 plugin preferences (**Preferences > Plugins** 截至 v3.6.3.0 或更高版本).
3. 选择 Flutter 插件并单击 **Install**。
4. 当提示安装 Dart 插件时，单击 **Yes**。
5. 安装完成后，提示时点击 **Restart** 。

##### Linux 或 Windows

对于 Linux 或 WIndows 操作系统，请使用以下说明:

1. 打开 plugin preferences **(File > Settings > Plugins)**.
2. 选择 **Marketplace**, 选择 Flutter 插件并单击 **Install.**

### Install Emacs

Emacs 是一个轻量级编辑器，支持 Flutter 和 Dart。

- [Emacs](https://www.gnu.org/software/emacs/download.html), 最新稳定版本

#### 安装 lsp-dart 包

有关如何安装和使用该包的信息，请参阅[lsp-dart 文档](https://emacs-lsp.github.io/lsp-dart/)。

---

## <span id="buildWebChinese">构建 web 应用程序</span>

您可以使用下面的步骤来创建一个新的 web 支持项目。

### Web 运行环境设置

运行以下命令使用最新版本的 Flutter SDK:

     $ flutter channel stable
     $ flutter upgrade

如果安装了 Chrome, <font color=#0c5460>flutter devices</font>命令输出一个 <font color=#0c5460>Chrome</font> 设备，该设备在运行应用程序时打开 Chrome 浏览器，以及一个 Web 服务器，该服务器提供应用程序的 URL。

     $ flutter devices
     1 connected device:

     Chrome (web) • chrome • web-javascript • Google Chrome 88.0.4324.150

在你的 IDE 中，你应该在设备下拉框中看到 **Chrome (web)** 选项。

### 创建并且运行一个项目

创建一个 web 支持的新项目与官方示例 [creating a new Flutter](https://flutter.dev/docs/get-started/test-drive) 其他平台的项目没有什么不同。

#### IDE

在 IDE 中创建一个新应用程序，它会自动创建 iOS、Android 和 web 版本的应用程序(如果你启用了桌面支持，也可以创建 macOS)。从设备的下拉菜单中，选择 Chrome (web)并运行你的应用程序，以看到它在 Chrome 中启动。

#### 命令行

要创建一个包含 web 支持(除了移动支持)的新应用程序，运行以下命令，用你的项目名称替换 myapp:

    $ flutter create myapp
    $ cd myapp

要在 Chrome 中从本地主机服务你的应用程序，输入以下内容:

    $ flutter run -d chrome

<table><tr><td bgcolor=#fff3cd>
<font color=#856404>
<text style="font-weight:bold">警告:</text> 目前，Flutter支持热重启，但不支持web浏览器热重新加载。</font>
</td></tr></table>

### 编译

运行以下命令生成发布版本:

    $ flutter build web

发布版本使用了 [dart2js](https://dart.dev/tools/dart2js)（而不是 [development compiler](https://dart.dev/tools/dartdevc) ）来生成一个 JavaScript 文件 main.dart.js。您可以使用 （<font color=#0c5460>flutter run --release</font>）或使用 release 模式下的 <font color=#0c5460>flutter build web.</font> 创建一个 release 构建包。这将使用构建文件填充构建/web 目录，包括需要一起服务的资产目录。

你也可以包含<font color=#0c5460>--web-renderer html</font>或<font color=#0c5460>--web-renderer canvaskit</font>来分别选择 html 或 canvaskit 渲染器。有关更多信息，请参见 [Web renderers](https://flutter.dev/docs/development/tools/web-renderers)。

---

### 8. 创建并运行一个简单的 Flutter 应用

要创建您的第一个 Flutter 应用程序并测试您的设置，请遵循以下步骤:

1.  通过从命令行运行以下命令创建一个新的 Flutter 应用程序:

        $ flutter create my_app

2.  创建了一个 <font color="#008f83">my_app</font>目录，其中包含 Flutter 的启动应用程序。

        $ cd my_app

3.  要在模拟器中启动应用程序，请确保模拟器正在运行并输入:

        $ flutter run
