import 'package:flutter/material.dart';
import 'package:formulario_reservas/theme.dart';
import 'pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentPage = 1;
  final PageController _controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myLightTheme,
      themeMode: ThemeMode.light,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentPage,
          onDestinationSelected: (int index) {
            setState(() => _currentPage = index);
            _controller.jumpToPage(index);
          },
          destinations: [
            NavigationDestination(
              selectedIcon:
                  Icon(Icons.person, color: myLightTheme.primaryColor),
              icon: const Icon(Icons.person_outline),
              label: 'Meu Perfil',
            ),
            NavigationDestination(
              selectedIcon:
                  Icon(Icons.add_circle, color: myLightTheme.primaryColor),
              icon: const Icon(Icons.add_circle_outline),
              label: 'Nova Reserva',
            ),
            NavigationDestination(
              selectedIcon:
                  Icon(Icons.calendar_month, color: myLightTheme.primaryColor),
              icon: const Icon(Icons.calendar_month_outlined),
              label: 'Minhas Reservas',
            ),
          ],
        ),
        body: PageView(
          controller: _controller,
          onPageChanged: (index) => setState(() => _currentPage = index),
          children: pages,
        ),
      ),
    );
  }
}
