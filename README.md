# Joy-Con Game Controller Framework Test

This project is a simple test application for the Game Controller framework, specifically designed to test the behavior of Nintendo Joy-Cons on macOS.

## Description

This app aims to explore the capabilities and behavior of Joy-Cons when connected to a Mac. It helps in testing individual Joy-Con connections and their haptic feedback functionality. A known issue is that when both a left and a right Joy-Con are connected, they automatically pair up as "JoyCon (L/R)" instead of being usable individually.

## Current Issue

When both Joy-Cons are connected, they appear as a single paired controller "JoyCon (L/R)" instead of two separate controllers.

![Screenshot of the issue](GameControllerTest.png)

## How to Use

1. Connect your Joy-Cons to your Mac.
2. Run the app to see how the Joy-Cons are recognized.
3. Use the app to test haptic feedback on the Joy-Cons.

## Requirements

- macOS
- Xcode
- Nintendo Joy-Cons

## License

This project is licensed under the MIT License.
