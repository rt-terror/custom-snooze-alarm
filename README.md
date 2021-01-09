<h1 align="center">CustomSnooze</h1>
<p align="center"><em>A Seamless Way to Personalise your Snooze Alarms</em></p>

CustomSnooze is a mobile application for iOS and Android that allows users to set custom snooze times and set alarms based on that.

CustomSnooze was built over a course of 24 hours for the hackathon [Hack&Roll 2021](https://hacknroll.nushackers.org). The team members are:
* [Tan Yu Li, James](https://www.github.com/iamjamestan)
* [Andrea Tan Ker Yue](https://github.com/andreatanky)
* [Nicholas Toh](https://github.com/nicktohzyu)

The core packages/dependencies used are:
* [shared_preferences](https://pub.dev/packages/shared_preferences)
* [assets_audio_player](https://pub.dev/packages/assets_audio_player)

Other packages used for both production and development can be found in [pubspec.yaml](pubspec.yaml).

This project was developed with [Flutter](https://flutter.dev/) and [Dart](https://dart.dev/).

## Features

With CustomSnooze, you get the following benefits by using our alarm:
* Customisable snooze interval
* Automatically stored preferences even upon quitting the app
* Ability to postpone alarm by snooze interval before alarm rings
* Toggleable flashing background upon alarm ring.

Simply hit the SNOOZE button. It's that easy!

## Project Structure
```bash
custom_snooze_alarm
├── android/
├── assets/
├── build/
├── fonts/
├── images/
├── ios/
├── sounds/
├── test/
└── lib/
    ├── first_view/
    ├── click_page.dart
    ├── countdown.dart
    ├── main.dart
    ├── settings_form.dart
    └── timer_page.dart

```
