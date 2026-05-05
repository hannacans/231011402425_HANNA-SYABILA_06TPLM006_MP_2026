import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WorkshopPage(),
    );
  }
}

class WorkshopPage extends StatelessWidget {
  final List<Map<String, String>> workshopList = [
    {
      "judul": "Flutter Basic",
      "tanggal": "10 Juni 2026",
      "lokasi": "Lab Komputer",
      "kuota": "30 Peserta"
    },
    {
      "judul": "UI/UX Design",
      "tanggal": "12 Juni 2026",
      "lokasi": "Ruang A1",
      "kuota": "25 Peserta"
    },
    {
      "judul": "Mobile Programming",
      "tanggal": "15 Juni 2026",
      "lokasi": "Aula Kampus",
      "kuota": "40 Peserta"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workshop Kampus"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: workshopList.length,
        itemBuilder: (context, index) {
          final data = workshopList[index];

          return Card(
            margin: EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["judul"]!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("Tanggal: ${data["tanggal"]}"),
                  Text("Lokasi: ${data["lokasi"]}"),
                  Text("Kuota: ${data["kuota"]}"),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Daftar"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
