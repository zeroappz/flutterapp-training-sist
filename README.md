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