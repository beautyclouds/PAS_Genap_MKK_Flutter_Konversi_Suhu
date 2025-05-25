import 'package:flutter_test/flutter_test.dart';

import 'package:suhu_converter/main.dart';

void main() {
  testWidgets('Konversi suhu muncul di layar', (WidgetTester tester) async {
    // Build aplikasi dan trigger frame.
    await tester.pumpWidget(SuhuConverterApp());

    // Verifikasi apakah teks input dan tombol muncul
    expect(find.text('Masukkan suhu dalam Celsius'), findsOneWidget);
    expect(find.text('Konversi'), findsOneWidget);
  });
}
