import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// Ketentuan 2 & 3: Model data dengan 3 field dan 3 tipe data berbeda (String, int, bool)
class CameraGear {
  final String brandAndModel;
  final int shutterCount; // Jumlah jepretan kamera (int)
  final bool isUnderWarranty; // Status garansi (bool)

  const CameraGear({
    required this.brandAndModel,
    required this.shutterCount,
    required this.isUnderWarranty,
  });
}

// Ketentuan 1 & 5: Hanya satu MaterialApp dan tema warna diubah (BlueGrey)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const LayarUtama(),
    );
  }
}

// Ketentuan 1: Layar utama memakai Scaffold tanpa MaterialApp kedua
class LayarUtama extends StatelessWidget {
  const LayarUtama({super.key});

  @override
  Widget build(BuildContext context) {
    // Ketentuan 2: Objek data berisi datamu sendiri
    const myCamera = CameraGear(
      brandAndModel: 'Sony Alpha A7 III',
      shutterCount: 15400,
      isUnderWarranty: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Alat Fotografi'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      // Ketentuan 7: Mencegah overflow pada layar sempit dengan SingleChildScrollView
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Daftar Kamera Utama",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 20),
              // Ketentuan 6: Memanggil custom widget yang dipisah
              CameraInfoCard(camera: myCamera), 
            ],
          ),
        ),
      ),
    );
  }
}

// Ketentuan 6: Memecah tampilan menjadi custom widget terpisah
class CameraInfoCard extends StatelessWidget {
  final CameraGear camera;

  const CameraInfoCard({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    // Ketentuan 4: Memakai Card, Container dengan BoxDecoration, Column, Row, Padding, SizedBox, Text, Icon, ElevatedButton
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blueGrey.shade200, width: 1.5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.camera_alt, size: 36, color: Colors.blueGrey),
                const SizedBox(width: 10),
                Text(
                  camera.brandAndModel,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Shutter Count:',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                Text(
                  '${camera.shutterCount} Jepretan',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Status Garansi:',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                Row(
                  children: [
                    Icon(
                      camera.isUnderWarranty ? Icons.verified : Icons.gpp_bad,
                      color: camera.isUnderWarranty ? Colors.green : Colors.red,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      camera.isUnderWarranty ? 'Masih Aktif' : 'Telah Habis',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: camera.isUnderWarranty ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // Callback dieksekusi saat tombol ditekan
                debugPrint("TOMBOL PEMAKAIAN DIKLIK - MHS: 202432071");
              },
              icon: const Icon(Icons.add_a_photo),
              label: const Text("Catat Pemakaian"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}