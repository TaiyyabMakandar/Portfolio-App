# Portfolio App Readme

## Introduction

This README file provides an overview of the Portfolio App, a Flutter application developed using the BLoC (Business Logic Component) architecture. It features a Welcome Page that provides information about me and a Contact Form to enable users to get in touch with me.

## Features

1. **Welcome Page**: The app's Welcome Page provides a introduction about you.

2. **Contact Form**: To facilitate user interaction and inquiries, the app includes a Contact Form accessible through a "Contact" button.

## Flutter and BLoC

This app is developed using the Flutter framework and follows the BLoC architecture pattern. BLoC is a state management pattern that helps organize and manage the flow of data and events in Flutter applications.

## Getting Started

Follow these steps to get the Portfolio App up and running on your local development environment:

1. **Clone the Repository**: Clone the app's repository to your local machine using Git.

   ```bash
   git clone <repository_url>
   ```

2. **Dependencies**: Make sure you have Flutter and Dart installed on your system. If not, follow the installation instructions provided on the [Flutter website](https://flutter.dev/docs/get-started/install).

3. **Run the App**: Open a terminal in the project directory and run the app using the following command:

   ```bash
   flutter run
   ```

4. **Explore the App**: Once the app is running, open it on your device or simulator. You should see the Welcome Page with information about you. Use the "Contact" button to access the Contact Form and send messages.

## Project Structure

The project structure follows the standard Flutter directory structure, with additional folders for BLoC components:

- **lib**: Contains the Dart code for the app.
  - **bloc**: Contains the BLoC (Business Logic Component) classes.
  - **models**: Contains data models used by the app.
  - **screens**: Contains the app's main screens, including the Welcome Page and Contact Form.
  - **widgets**: Contains custom widgets used throughout the app.

