# Dart GetX Custom Module Generator

Test pada

- flutter stable 3.24.3
- dart 3.5.3
- get: ^4.6.6

Template proyek Flutter menggunakan GetX untuk manajemen state, routing, dan dependency injection. Proyek ini mencakup generator modul kustom untuk dengan cepat membuat komponen umum.

## Fitur

- Clean Architecture structure
- GetX state management
- Multi-language support (ID & EN)
- Network connectivity handling
- Theme management
- API service integration with Dio
- Custom module generator

## Penggunaan

Git Clone terlebih dahulu

```
git clone https://github.com/cahyo40/flutter-getx-generator.git
```

Remove .git folder

```
rm -rf .git*
```

Flutter Clean dan Pub Get

```
flutter clean
```

```
flutter pub get
```

Mengubah nama package

```
dart run change_app_package_name:main com.mdcnugroho.test
```

Mengubah nama aplikasi

```
dart run rename_app:main all="My App Name"
```

## Penggunaan Generator

The `generate.dart` script provides a command-line tool to quickly scaffold common components in your GetX project. Here are the available commands:

### Perintah yang bisa digunakan

Membuat page baru

```
dart generate.dart page:login
```

Membuat controller

```
dart generate.dart controller:network
```

Membuat provider

```
dart generate.dart provider:testing
```

Membuat Widget

```
dart generate.dart widget:loading
```

Membuat screen pada page

```
dart generate.dart screen on home:form
```
