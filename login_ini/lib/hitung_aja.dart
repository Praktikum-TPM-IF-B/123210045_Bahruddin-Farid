import 'package:flutter/material.dart';

class HitungPage extends StatefulWidget {
  @override
  _HitungPageState createState() => _HitungPageState();
}

class _HitungPageState extends State<HitungPage> {
  int angka1 = 0;
  int angka2 = 0;
  int hasil = 0;

  bool isGenap(int angka) {
    return angka % 2 == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Hitung'),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hasil: $hasil',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  hasil = angka1 + angka2;
                });
              },
              child: Text('Penjumlahan'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  hasil = angka1 - angka2;
                });
              },
              child: Text('Pengurangan'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        angka1 = int.tryParse(value) ?? 0;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Angka Pertama',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        angka2 = int.tryParse(value) ?? 0;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Angka Kedua',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Cek Angka Pertama'),
                          content: Text(isGenap(angka1)
                              ? 'Angka pertama adalah genap'
                              : 'Angka pertama adalah ganjil'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Cek Angka Pertama'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Cek Angka Kedua'),
                          content: Text(isGenap(angka2)
                              ? 'Angka kedua adalah genap'
                              : 'Angka kedua adalah ganjil'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Cek Angka Kedua'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
