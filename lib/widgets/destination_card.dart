
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/favorites_controller.dart';
import '../models/destination.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;

  const DestinationCard({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(6),
      child: InkWell(
        onTap: () {
          context.push('/destinasi/${destination.id}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BAGIAN GAMBAR
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    destination.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;

                      return ColoredBox(
                        color: destination.color.withOpacity(0.15),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return ColoredBox(
                        color: destination.color,
                        child: Icon(
                          destination.icon,
                          color: Colors.white,
                          size: 55,
                        ),
                      );
                    },
                  ),

                  // LABEL KATEGORI
                  Positioned(
                    top: 6,
                    left: 6,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 115),
                      child: Chip(
                        label: Text(
                          destination.category,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 10),
                        ),
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ),

                  // TOMBOL FAVORIT
                  Positioned(
                    top: 4,
                    right: 4,
                    child: ValueListenableBuilder<Set<String>>(
                      valueListenable: FavoritesController.favoriteIds,
                      builder: (context, favorites, child) {
                        final isFavorite =
                            favorites.contains(destination.id);

                        return Material(
                          color: Colors.white,
                          shape: const CircleBorder(),
                          child: IconButton(
                            tooltip: isFavorite
                                ? 'Hapus dari favorit'
                                : 'Tambahkan ke favorit',
                            visualDensity: VisualDensity.compact,
                            constraints: const BoxConstraints(
                              minWidth: 36,
                              minHeight: 36,
                            ),
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              FavoritesController.toggle(destination.id);

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      isFavorite
                                          ? 'Dihapus dari favorit'
                                          : 'Ditambahkan ke favorit',
                                    ),
                                    duration:
                                        const Duration(seconds: 1),
                                  ),
                                );
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite
                                  ? Colors.red
                                  : Colors.black,
                              size: 20,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // BAGIAN INFORMASI
            Padding(
              padding: const EdgeInsets.fromLTRB(9, 6, 9, 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NAMA DESTINASI
                  Text(
                    destination.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  const SizedBox(height: 2),

                  // LOKASI
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 13,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          destination.region,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 2),

                  // HARGA TIKET
                  Text(
                    destination.ticketPrice,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
