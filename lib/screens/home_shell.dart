import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/favorites_controller.dart';
import '../data/destinations.dart';
import '../widgets/destination_card.dart';

class HomeShell extends StatelessWidget {
  final Widget child;
  const HomeShell({super.key, required this.child});

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    return location == '/favorit' ? 1 : 0;
  }

  void _goTo(BuildContext context, int index) {
    context.go(index == 0 ? '/' : '/favorit');
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _selectedIndex(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 840;
        if (wide) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) => _goTo(context, index),
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.explore_outlined),
                      selectedIcon: Icon(Icons.explore),
                      label: Text('Jelajah'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite_border),
                      selectedIcon: Icon(Icons.favorite),
                      label: Text('Favorit'),
                    ),
                  ],
                ),
                const VerticalDivider(width: 1),
                Expanded(child: child),
              ],
            ),
          );
        }
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) => _goTo(context, index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore),
                label: 'Jelajah',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: 'Favorit',
              ),
            ],
          ),
        );
      },
    );
  }
}

class DestinationListScreen extends StatelessWidget {
  const DestinationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jelajah Sumatera Utara'),
        centerTitle: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final columns = width < 600
              ? 1
              : width < 840
              ? 2
              : 3;
          final horizontalPadding = width >= 840 ? 28.0 : 16.0;
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: GridView.builder(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  12,
                  horizontalPadding,
                  24,
                ),
                itemCount: destinations.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: width < 600 ? 2.15 : 1.45,
                ),
                itemBuilder: (context, index) =>
                    DestinationCard(destination: destinations[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<String>>(
      valueListenable: FavoritesController.favoriteIds,
      builder: (context, favoriteIds, child) {
        final favorites = destinations
            .where((item) => favoriteIds.contains(item.id))
            .toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Destinasi Favorit'),
          ),
          body: favorites.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.favorite_border,
                        size: 75,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Belum ada destinasi favorit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Tekan ikon hati pada destinasi yang kamu sukai.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      FilledButton(
                        onPressed: () => context.go('/'),
                        child: const Text('Jelajahi Wisata'),
                      ),
                    ],
                  ),
                )
              : LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final columns = width < 600
                        ? 1
                        : width < 840
                            ? 2
                            : 3;

                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: favorites.length,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio:
                            width < 600 ? 1.65 : 1.05,
                      ),
                      itemBuilder: (context, index) {
                        return DestinationCard(
                          destination: favorites[index],
                        );
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
