# Dart GetX Custom Module Generator

A Flutter project template using GetX for state management, routing, and dependency injection. This project includes a custom module generator to quickly scaffold common components.

## Features

- Clean Architecture structure
- GetX state management
- Multi-language support (ID & EN)
- Network connectivity handling
- Theme management
- API service integration with Dio
- Custom module generator

## Generator Usage

The `generate.dart` script provides a command-line tool to quickly scaffold common components in your GetX project. Here are the available commands:

### Initialize Project Structure

```bash
dart namefile.dart init           // Initialize GetX project structure
dart namefile.dart page:login     // Generates complete login page
dart namefile.dart controller:network // Generates only network controller
dart namefile.dart provider:testing   // Generates only testing provider
dart namefile.dart widget:loading     // Generates only loading widget
dart namefile.dart screen on login:form  // Generates form screen in login module
dart namefile.dart screen on home:form  // Generates form screen in home module
```