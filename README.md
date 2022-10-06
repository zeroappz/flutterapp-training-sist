# flutterapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Github URL:
- [Flutter App](https://github.com/zeroappz/flutterapp-training-sist)

## App Screen Defaults
    - Scaffold is a widget that provides a default app bar and drawer.
    - appBar (title bar : leading icon, actions [], title)
    - body (any Widget) - Tabs (4 or 5 different pages and we are calling it through a List)
    - floatingActionButton
    - drawer: ListView( children: [ ListTile(), ListTile(),])
    - bottomNavigationBar
    - Ternary Operator
    - condition ? value_if_true : value_if_false

## Create own Library
    - Making any folder as a library
    - Step 1: create an empty file and mention: library library_name;
        - keep all your required imports in it
    - Step 2: Make every file as apart of this library

## Other Widgets
    - SafeArea() - This will be handling notches
    - Expanded() - 
    - AnimatedContainer() is used to create a container that animates its height and width
    - EdgeInsets() - symmetric(vertical, horizontal) - Padding the widgets
    - EdgeInsets() - all(top, right, bottom, left)
    - BorderRadius() - to set the border radius according to the design
    - Padding()
    - Fluttertoast() - Pop up message shown in any of the corner in your screen
    - ElevatedButton()
    - PageController()

## Global package and bundle id rename package
    - add rename package in pubspec.yaml
    - flutter pub global activate rename
    - flutter pub global run rename --bundleId "com.algoxfusion.sist"
    - flutter pub global run rename --appname "Algoxfusion Sist"

## Generate SHA fingerprint keys for application
    - cd android
    - ./gradlew signingReport 


## Changing the App Icon
    - launcher icon using the following commands
    - [Flutter Launcher Icon Package](https://pub.dev/packages/flutter_launcher_icons)
    - flutter pub run flutter_launcher_icons:main

## Local & Cloud Push Notifications
    - add package "flutter_local_notifications"
    - https://chat.whatsapp.com/HTXUMH0Ovnq3AFDYiw0DZd

## Firebase based Authentications
    - Sign in with google
    - Sign in with Email and Password

## Google Console APIs
    - https://console.cloud.google.com/apis/library?project=algoxfusion-training
    - Add APIs you want
    - Check it in the dashboard
    - Distance Matrix (to find the distance and time between two locations)

## REST API Integrations (Object response - JSON)
    - HTTP(Protocols)
        - GET (fetch records or information)
        - PUT 
        - POST
        - DELETE
    - Database - Server - (HTTP - JSON) Service - converted to Map(dart) - Data Interpolating