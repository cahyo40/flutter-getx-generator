// generator.dart
// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps
// Author: Muchammad Dwi Cahyo Nugroho

import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('''
Usage: dart generator.dart <type>:<name> [on <module>:<screen>]
       dart generator.dart init

Examples:
  dart namefile.dart init           // Initialize GetX project structure
  dart namefile.dart page:login     // Generates complete login page
  dart namefile.dart controller:network // Generates only network controller
  dart namefile.dart provider:testing   // Generates only testing provider
  dart namefile.dart widget:loading     // Generates only loading widget
  dart namefile.dart screen on login:form  // Generates form screen in login module
  dart namefile.dart screen on home:form  // Generates form screen in home module
''');
    exit(1);
  }

  final command = args[0];

  // Add init command handling
  if (command == 'init') {
    initializeGetXProject();
    return;
  }

  // Handle screen generation with module context
  if (args.length > 2 && args[1].toLowerCase() == 'on') {
    final type = args[0];
    final moduleName = args[2];

    if (type == 'screen') {
      if (!moduleName.contains(':')) {
        print('❌ Invalid module format. Use module:screen format');
        exit(1);
      }
      final moduleContext = moduleName.split(':');
      final actualModuleName = moduleContext[0];
      final screenName = moduleContext[1];
      generateScreenInModule(actualModuleName, screenName);
      return;
    }
  }
  if (!command.contains(':')) {
    print('❌ Invalid command format. Use type:name format');
    exit(1);
  }

  final parts = command.split(':');
  final type = parts[0].toLowerCase();
  final name = parts[1];

  // Handle screen generation with module context
  if (args.length > 2 && args[1] == 'on') {
    final moduleContext = args[2].split(':');
    if (moduleContext.length != 2) {
      print('❌ Invalid module context format. Use module:screen format');
      exit(1);
    }
    final moduleName = moduleContext[0];
    final screenName = moduleContext[1];

    if (type == 'screen') {
      generateScreenInModule(moduleName, screenName);
      return;
    }
  }

  // Handle individual component generation
  switch (type) {
    case 'page':
      generateModule(name, null); // Generate complete page with formatted name
      break;
    case 'controller':
      generateSingleController(name);
      break;
    case 'provider':
      generateSingleProvider(name);
      break;
    case 'widget':
      generateSingleView(name);
      break;
    default:
      print('❌ Unknown type: $type');
      exit(1);
  }
}

// Add new methods for individual generation
void generateSingleController(String name) {
  const basePath = 'lib/controllers';
  createDirectory(basePath);

  final parts = name.split('.');
  final className = parts.map((part) => capitalize(part)).join();
  final fileName = name.replaceAll('.', '_').toLowerCase();
  final filePath = '$basePath/${fileName}_controller.dart';

  // Check if controller already exists
  if (File(filePath).existsSync()) {
    print('⚠️ Controller already exists: $filePath');
    return;
  }

  final content = '''
// Author: Muchammad Dwi Cahyo Nugroho
import 'package:get/get.dart';

class ${className}Controller extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
''';

  writeFile(filePath, content);
  print('\n✨ Controller generated successfully!');
}

void generateSingleProvider(String name) {
  const basePath = 'lib/providers';
  createDirectory(basePath);

  final parts = name.split('.');
  final className = parts.map((part) => capitalize(part)).join();
  final fileName = name.replaceAll('.', '_').toLowerCase();
  final filePath = '$basePath/${fileName}_provider.dart';

  // Check if provider already exists
  if (File(filePath).existsSync()) {
    print('⚠️ Provider already exists: $filePath');
    return;
  }

  final content = '''
// Author: Muchammad Dwi Cahyo Nugroho
//import 'package:dio/dio.dart';

class ${className}Provider {
  //final Dio _dio = Dio();

  ${className}Provider();
}''';

  writeFile(filePath, content);
  print('\n✨ Provider generated successfully!');
}

void generateSingleView(String name) {
  const basePath = 'lib/widgets/';
  createDirectory(basePath);

  final fileName = name.replaceAll('.', '_').toLowerCase();
  final filePath = '$basePath/${fileName}_widget.dart';

  // Check if widget already exists
  if (File(filePath).existsSync()) {
    print('⚠️ Widget already exists: $filePath');
    return;
  }

  generateWidget(basePath, name);
  print('\n✨ Widget generated successfully!');
}

void generateScreenInModule(String moduleName, String screenName) {
  final basePath = 'lib/pages/$moduleName';
  generateScreen(basePath, moduleName, screenName);
  print('\n✨ Screen generated successfully in $moduleName module!');
}

void generateModule(String moduleName, String? screenName) {
  final className =
      moduleName.split('.').map((part) => capitalize(part)).join();
  final basePath = 'lib/pages/$moduleName';

  // Check if module directory already exists
  if (Directory(basePath).existsSync()) {
    print('⚠️ Module $moduleName already exists at: $basePath');
    return;
  }

  createDirectory(basePath);

  // Create subdirectories
  createDirectory('$basePath/view');
  createDirectory('$basePath/controller');
  createDirectory('$basePath/binding');
  createDirectory('$basePath/provider');
  createDirectory('$basePath/routes');
  if (screenName != null) {
    createDirectory('$basePath/view/screen');
  }

  final fileBaseName = moduleName.replaceAll('.', '_');

  generateView('$basePath/view', fileBaseName, className);
  generateController('$basePath/controller', fileBaseName, className);
  generateBinding('$basePath/binding', fileBaseName, className);
  generateProvider('$basePath/provider', fileBaseName, className);
  generateRoutes('$basePath/routes', fileBaseName, className, screenName);
  updatePageNames(fileBaseName);
  updateRouteApp(moduleName, fileBaseName, screenName);

  if (screenName != null) {
    generateScreen(basePath, fileBaseName, screenName);
  }

  printSuccess(moduleName, screenName);
}

void createDirectory(String path) {
  final directory = Directory(path);
  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }
}

void generateView(String basePath, String moduleName, String className) {
  final content = '''
// Author: Muchammad Dwi Cahyo Nugroho
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/${moduleName}_controller.dart';

class ${className}View extends GetView<${className}Controller> {
  const ${className}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('${className}'),
      ),
      body: const Center(
        child: Text('${className} View'),
      ),
    );
  }
}
''';

  writeFile('$basePath/${moduleName}_view.dart', content);
}

void generateWidget(String basePath, String moduleName) {
  // Format the widget name to handle dots
  final formattedName = formatWidgetName(moduleName);

  final content = '''
// Author: Muchammad Dwi Cahyo Nugroho
import 'package:flutter/material.dart';

class ${formattedName}Widget extends StatelessWidget {
  const ${formattedName}Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('$formattedName Widget'),
    );
  }
}
''';

  // Use lowercase with underscores for file name
  final fileName = moduleName.replaceAll('.', '_').toLowerCase();
  writeFile('$basePath/${fileName}_widget.dart', content);
}

void generateController(String basePath, String moduleName, String className) {
  final content = '''
// Author: Muchammad Dwi Cahyo Nugroho
import 'package:get/get.dart';

class ${className}Controller extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
''';

  writeFile('$basePath/${moduleName}_controller.dart', content);
}

void generateBinding(String basePath, String moduleName, String className) {
  final content = '''
// Author: Muchammad Dwi Cahyo Nugroho
import 'package:get/get.dart';
import '../controller/${moduleName}_controller.dart';

class ${className}Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${className}Controller>(
      () => ${className}Controller(),
    );
  }
}
''';

  writeFile('$basePath/${moduleName}_binding.dart', content);
}

void generateProvider(String basePath, String moduleName, String className) {
  final content = '''
// Author: Muchammad Dwi Cahyo Nugroho
//import 'package:dio/dio.dart';

class ${className}Provider {
  //final Dio _dio = Dio();

  ${className}Provider();
}''';

  writeFile('$basePath/${moduleName}_provider.dart', content);
}

void generateScreen(String basePath, String moduleName, String screenName) {
  final screenParts = screenName.split('.');
  final className = screenParts.map((part) => capitalize(part)).join();
  final fileName = screenName.replaceAll('.', '_').toLowerCase();
  final filePath = '$basePath/view/screen/${fileName}_screen.dart';

  // Check if screen already exists
  if (File(filePath).existsSync()) {
    print('⚠️ Screen already exists: $filePath');
    return;
  }

  final content = '''
// Author: Muchammad Dwi Cahyo Nugroho
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/${moduleName}_controller.dart';

class ${className}Screen extends GetView<${capitalize(moduleName)}Controller> {
  const ${className}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('${className}'),
      ),
      body: const Center(
        child: Text('${className} Screen'),
      ),
    );
  }
}
''';

  writeFile(filePath, content);
}

void generateRoutes(String basePath, String moduleFileName, String className,
    String? screenName) {
  // Convert module file name to camelCase for route variable name
  final routeVariableName = toCamelCase(moduleFileName);

  final content = '''
// Author: Muchammad Dwi Cahyo Nugroho
import 'package:get/get.dart';
import '../../../routes/route_name.dart';
import '../binding/${moduleFileName}_binding.dart';
import '../view/${moduleFileName}_view.dart';
${screenName != null ? "import '../view/screen/${screenName.toLowerCase()}_screen.dart';" : ''}

final ${routeVariableName}Route = GetPage(
  name: PageName.${routeVariableName},
  page: () => const ${className}View(),
  binding: ${className}Binding(),
);
''';

  writeFile('$basePath/${moduleFileName}_routes.dart', content);
}

void updatePageNames(String moduleName) {
  const path = 'lib/routes/route_name.dart';
  createDirectory('lib/routes');
  String moduleNames = toCamelCase(moduleName);

  // Inisialisasi konten default jika file tidak ada
  var content = '''
// Author: Muchammad Dwi Cahyo Nugroho
abstract class PageName {
  
}
''';

  // Baca konten yang ada jika file sudah ada
  if (File(path).existsSync()) {
    content = File(path).readAsStringSync();
  }

  final routeName = '''
  static const ${moduleNames} = '/${moduleName}';''';

  // Cek apakah route sudah ada
  if (!content.contains(routeName)) {
    final insertIndex = content.lastIndexOf('}');
    content = content.replaceRange(insertIndex, insertIndex, '$routeName\n');

    // Tulis kembali file
    File(path).writeAsStringSync(content);
    print('✨ Updated route name in $path');
  }
}

void updateRouteApp(
    String moduleName, String moduleFileName, String? screenName) {
  const routeAppPath = 'lib/routes/route_app.dart';
  createDirectory('lib/routes');

  final routeVariableName = toCamelCase(moduleFileName);

  // Template konten default
  final defaultContent = '''
// Author: Muchammad Dwi Cahyo Nugroho
import 'package:get/get.dart';
import '../pages/$moduleName/routes/${moduleFileName}_routes.dart';

abstract class AppRoutes {
  static final routes = <GetPage>[
    ${routeVariableName}Route,
  ];
}
''';

  if (File(routeAppPath).existsSync()) {
    var existingContent = File(routeAppPath).readAsStringSync();
    bool contentUpdated = false;

    // Tambahkan import jika belum ada
    final importStatement =
        "import '../pages/$moduleName/routes/${moduleFileName}_routes.dart';";
    if (!existingContent.contains(importStatement)) {
      final lastImportIndex = existingContent.lastIndexOf('import');
      final endOfImportIndex =
          existingContent.indexOf(';', lastImportIndex) + 1;
      existingContent = existingContent.replaceRange(
          endOfImportIndex, endOfImportIndex, '\n$importStatement');
      contentUpdated = true;
    }

    // Tambahkan route jika belum ada
    final routeRegistration = "${routeVariableName}Route,";
    if (!existingContent.contains(routeRegistration)) {
      final routesArrayStart = existingContent.indexOf('[') + 1;
      existingContent = existingContent.replaceRange(
          routesArrayStart, routesArrayStart, '\n    $routeRegistration');
      contentUpdated = true;
    }

    if (contentUpdated) {
      File(routeAppPath).writeAsStringSync(existingContent);
      print('✨ Updated routes in $routeAppPath');
    }
  } else {
    File(routeAppPath).writeAsStringSync(defaultContent);
    print('✨ Created new routes file at $routeAppPath');
  }
}

// ... existing code ...

void writeFile(String path, String content) {
  final file = File(path);

  // Check if file already exists
  if (file.existsSync()) {
    print('⚠️ File already exists: $path');
    return;
  }

  // Create parent directories if they don't exist
  file.parent.createSync(recursive: true);

  // Write the file
  file.writeAsStringSync(content);
  print('📝 Generated: $path');
}

// ... existing code ...

String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

void printSuccess(String modulePath, String? screenName) {
  print('''
\n✨ Module generated successfully!

📁 Generated files:
  └─ pages/$modulePath/
     ├─ view/
     │  └─ ${modulePath.replaceAll('/', '_')}_view.dart
     ├ controller/
     │  └─ ${modulePath.replaceAll('/', '_')}_controller.dart
     ├─ binding/
     │  └─ ${modulePath.replaceAll('/', '_')}_binding.dart
     ├─ provider/
     │  └─ ${modulePath.replaceAll('/', '_')}_provider.dart
     └─ routes/
        └─ ${modulePath.replaceAll('/', '_')}_routes.dart''');

  if (screenName != null) {
    print('''     └─ view/screen/
        └─ ${screenName}_screen.dart''');
  }

  print('''
💡 Next steps:
  1. Add routes to your GetMaterialApp
  2. Import the generated module in your app
  3. Start coding! 🎉
''');
}

// Add helper function to convert snake_case to camelCase
String toCamelCase(String text) {
  final parts = text.split('_');
  return parts[0] + parts.skip(1).map((part) => capitalize(part)).join();
}

String formatWidgetName(String name) {
  // Split by dot and capitalize each part
  final parts = name.split('.');
  return parts.map((part) => capitalize(part)).join();
}

void initializeGetXProject() {
  // Generate home page first
  generateModule('home', null);

  // Generate new main.dart content
  const mainContent = '''
// Author: Muchammad Dwi Cahyo Nugroho
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/route_app.dart';
import 'routes/route_name.dart';
import 'pages/home/binding/home_binding.dart';

// Dart Getx Custom Module Generator
// Author: Muchammad Dwi Cahyo Nugroho
// Version: 1.0.0
// dibuat: 14 Desember 2024

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dart Getx Custom Module Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: HomeBinding(),
      initialRoute: PageName.home,
      getPages: AppRoutes.routes,
    );
  }
}
''';

  // Check if main.dart exists and warn before overwriting
  if (File('lib/main.dart').existsSync()) {
    print(
        '⚠️ Existing main.dart will be overwritten. Backing up as main.dart.bak');
    File('lib/main.dart').copySync('lib/main.dart.copy');
  }

  // Write the new main.dart
  File('lib/main.dart').writeAsStringSync(mainContent);

  print('''
✨ GetX initialization completed successfully!

📝 Updates made:
  1. Generated home page module
  2. Created new main.dart with GetMaterialApp
  3. Added HomeBinding as initialBinding
  4. Configured routing system

💡 Next steps:
  1. Run 'flutter pub add get' to add GetX dependency
  2. Review the generated home page in lib/pages/home/
  3. Start adding more pages using the generator
  4. Start coding! 🎉
''');
}
