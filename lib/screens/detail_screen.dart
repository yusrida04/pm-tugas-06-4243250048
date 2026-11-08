import 'package:flutter/material.dart';
import '../models/destination.dart';

class DetailScreen extends StatelessWidget {
  final Destination destination;
  const DetailScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Destinasi')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 700;
          final image = _DestinationHero(destination: destination);
          final information = _DestinationInformation(destination: destination);

          if (wide) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: SizedBox(height: 420, child: image),
                      ),
                      const SizedBox(width: 24),
                      Expanded(flex: 6, child: information),
                    ],
                  ),
                ),
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SizedBox(height: 230, child: image),
              const SizedBox(height: 20),
              information,
            ],
          );
        },
      ),
    );
  }
}

class _DestinationHero extends StatelessWidget {
  final Destination destination;
  const _DestinationHero({required this.destination});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(
            color: destination.color,
            child: Icon(destination.icon, size: 110, color: Colors.white),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                child: Text(
                  destination.category,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DestinationInformation extends StatelessWidget {
  final Destination destination;
  const _DestinationInformation({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          destination.name,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on_outlined, size: 19),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                destination.region,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Tentang destinasi',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          destination.description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Card(
          child: ListTile(
            leading: const Icon(Icons.confirmation_number_outlined),
            title: const Text('Informasi tiket'),
            subtitle: Text(destination.ticketPrice),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Catatan: harga tiket merupakan informasi contoh dan dapat berubah. '
          'Periksa informasi resmi sebelum berkunjung.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
