import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workshop Kampus',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: WorkshopPage(),
    );
  }
}

class WorkshopPage extends StatefulWidget {
  @override
  _WorkshopPageState createState() => _WorkshopPageState();
}

class _WorkshopPageState extends State<WorkshopPage> {
  List<Map<String, String>> workshopList = [
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

  List<Map<String, String>> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = workshopList;
  }

  void searchWorkshop(String keyword) {
    setState(() {
      filteredList = workshopList
          .where((item) =>
          item["judul"]!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Workshop Kampus"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // SEARCH BAR
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: searchWorkshop,
              decoration: InputDecoration(
                hintText: "Cari workshop...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          // LIST
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final data = filteredList[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(data: data),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data["judul"]!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("📅 ${data["tanggal"]}"),
                          Text("📍 ${data["lokasi"]}"),
                          Text("👥 ${data["kuota"]}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class DetailPage extends StatelessWidget {
  final Map<String, String> data;

  DetailPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Workshop")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data["judul"]!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 20),
            Text("Tanggal: ${data["tanggal"]}"),
            Text("Lokasi: ${data["lokasi"]}"),
            Text("Kuota: ${data["kuota"]}"),

            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Berhasil 🎉"),
                      content: Text(
                          "Kamu berhasil daftar ${data["judul"]}"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                child: Text("Daftar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}