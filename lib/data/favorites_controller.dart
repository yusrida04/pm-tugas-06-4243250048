import 'package:flutter/foundation.dart';

class FavoritesController {
  FavoritesController._();

  static final ValueNotifier<Set<String>> favoriteIds =
      ValueNotifier<Set<String>>({});

  static void toggle(String id) {
    final updated = Set<String>.from(favoriteIds.value);

    if (updated.contains(id)) {
      updated.remove(id);
    } else {
      updated.add(id);
    }

    favoriteIds.value = updated;
  }
}