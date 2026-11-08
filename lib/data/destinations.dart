
import 'package:flutter/material.dart';
import '../models/destination.dart';

const List<Destination> destinations = [
  Destination(
    id: 'danau-toba',
    name: 'Danau Toba',
    region: 'Kabupaten Toba',
    category: 'Wisata Alam',
    description:
        'Danau vulkanik yang luas dengan panorama perbukitan dan Pulau Samosir di tengahnya. Pengunjung dapat menikmati pemandangan, menjelajahi desa budaya, dan mencoba kuliner khas Batak.',
    ticketPrice: 'Mulai Rp10.000',
    imageUrl: 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1000',
    icon: Icons.water,
    color: Color(0xFF2C9DB5),
  ),
  Destination(
    id: 'bukit-lawang',
    name: 'Bukit Lawang',
    region: 'Kabupaten Langkat',
    category: 'Ekowisata',
    description:
        'Kawasan wisata alam di tepi Taman Nasional Gunung Leuser yang terkenal dengan hutan tropis, sungai jernih, dan kesempatan mengikuti trekking bersama pemandu resmi.',
    ticketPrice: 'Sesuai paket wisata',
    imageUrl: 'https://images.unsplash.com/photo-1448375240586-882707db888b?w=1000',
    icon: Icons.forest,
    color: Color(0xFF43865A),
  ),
  Destination(
    id: 'berastagi',
    name: 'Berastagi',
    region: 'Kabupaten Karo',
    category: 'Wisata Alam',
    description:
        'Kota dataran tinggi berhawa sejuk dengan pemandangan Gunung Sinabung dan Sibayak, pasar buah, kebun, serta berbagai pilihan wisata keluarga.',
    ticketPrice: 'Bervariasi',
    imageUrl: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=1000',
    icon: Icons.landscape,
    color: Color(0xFF78934A),
  ),
  Destination(
    id: 'istana-maimun',
    name: 'Istana Maimun',
    region: 'Kota Medan',
    category: 'Wisata Sejarah',
    description:
        'Bangunan bersejarah peninggalan Kesultanan Deli dengan perpaduan arsitektur Melayu, Islam, dan Eropa. Pengunjung dapat melihat interior istana dan mengenal sejarah Kesultanan Deli.',
    ticketPrice: 'Sekitar Rp10.000',
    imageUrl: 'https://images.unsplash.com/photo-1564507592333-c60657eea523?w=1000',
    icon: Icons.account_balance,
    color: Color(0xFFB88735),
  ),
  Destination(
    id: 'pantai-parbaba',
    name: 'Pantai Parbaba',
    region: 'Kabupaten Samosir',
    category: 'Wisata Pantai',
    description:
        'Pantai berpasir putih di tepi Danau Toba. Area ini cocok untuk bersantai, bermain air, dan menikmati suasana danau bersama keluarga.',
    ticketPrice: 'Sekitar Rp5.000',
    imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1000',
    icon: Icons.beach_access,
    color: Color(0xFF4B9CB8),
  ),
  Destination(
    id: 'air-terjun-sipiso-piso',
    name: 'Air Terjun Sipiso-piso',
    region: 'Kabupaten Karo',
    category: 'Wisata Alam',
    description:
        'Air terjun tinggi yang jatuh dari tebing hijau menuju kawasan Danau Toba. Tersedia titik pandang untuk menikmati panorama alam dari ketinggian.',
    ticketPrice: 'Sekitar Rp7.500',
    imageUrl: 'https://images.unsplash.com/photo-1432405972618-c60b0225b8f9?w=1000',
    icon: Icons.waterfall_chart,
    color: Color(0xFF397F91),
  ),
];

Destination? findDestination(String id) {
  for (final destination in destinations) {
    if (destination.id == id) return destination;
  }
  return null;
}
