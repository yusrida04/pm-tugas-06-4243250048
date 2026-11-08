import 'package:flutter/material.dart';

class Destination {
  final String id;
  final String name;
  final String region;
  final String category;
  final String description;
  final String ticketPrice;
  final String imageUrl;
  final IconData icon;
  final Color color;

  const Destination({
    required this.id,
    required this.name,
    required this.region,
    required this.category,
    required this.description,
    required this.ticketPrice,
    required this.imageUrl,
    required this.icon,
    required this.color,
  });
}