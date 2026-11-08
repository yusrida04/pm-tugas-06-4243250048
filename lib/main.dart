import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'data/destinations.dart';
import 'models/destination.dart';
import 'screens/detail_screen.dart';
import 'screens/home_shell.dart';
import 'screens/not_found_screen.dart';

void main() => runApp(const WisataSumutApp());

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomeShell(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const DestinationListScreen(),
        ),
        GoRoute(
          path: '/favorit',
          builder: (context, state) => const FavoritesScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/destinasi/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final Destination? destination = findDestination(id);
        if (destination == null) return const NotFoundScreen();
        return DetailScreen(destination: destination);
      },
    ),
  ],
);

class WisataSumutApp extends StatelessWidget {
  const WisataSumutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Jelajah Sumut',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF087E75)),
        scaffoldBackgroundColor: const Color(0xFFF5F8F7),
      ),
      routerConfig: appRouter,
    );
  }
}
