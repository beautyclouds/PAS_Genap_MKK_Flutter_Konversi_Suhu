import 'package:flutter/material.dart';

void main() {
  runApp(SuhuConverterApp());
}

class SuhuConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.deepPurple[50],
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: KonversiSuhuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class KonversiSuhuScreen extends StatefulWidget {
  @override
  _KonversiSuhuScreenState createState() => _KonversiSuhuScreenState();
}

class _KonversiSuhuScreenState extends State<KonversiSuhuScreen> {
  final TextEditingController _controller = TextEditingController();

  double _fahrenheit = 0;
  double _kelvin = 0;

  void _konversiSuhu() {
    final input = double.tryParse(_controller.text);

    if (input != null) {
      setState(() {
        _fahrenheit = (input * 9 / 5) + 32;
        _kelvin = input + 273.15;
      });
    } else {
      setState(() {
        _fahrenheit = 0;
        _kelvin = 0;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Masukkan angka yang valid!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Suhu'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(Icons.thermostat, size: 60, color: Colors.deepPurple),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan suhu dalam Celsius',
                prefixIcon: Icon(Icons.device_thermostat),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _konversiSuhu,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // warna tombol
                foregroundColor: Colors.white,      // warna teks
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Konversi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Hasil Konversi:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Fahrenheit: ${_fahrenheit.toStringAsFixed(2)} °F',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Kelvin: ${_kelvin.toStringAsFixed(2)} K',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
