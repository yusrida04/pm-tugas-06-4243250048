import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pm_pertemuan_06/main.dart';

void main() {
  testWidgets('Aplikasi menampilkan daftar destinasi wisata', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(const WisataSumutApp());
    await tester.pumpAndSettle();

    expect(find.text('Jelajah Sumatera Utara'), findsOneWidget);
    expect(find.text('Danau Toba'), findsOneWidget);
    expect(find.text('Bukit Lawang'), findsOneWidget);

    await tester.binding.setSurfaceSize(null);
  });
}
