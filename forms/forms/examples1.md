# ✅ 1. TextField – Girilen sayının karesini hesapla

```dart

import 'package:flutter/material.dart';

class KareHesap extends StatefulWidget {
  @override
  State<KareHesap> createState() => _KareHesapState();
}

class _KareHesapState extends State<KareHesap> {
  final txt = TextEditingController();
  String sonuc = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kare Hesaplama")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: txt,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Sayı gir"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                int sayi = int.tryParse(txt.text) ?? 0;
                setState(() => sonuc = (sayi * sayi).toString());
              },
              child: Text("Hesapla"),
            ),
            Text("Sonuç: $sonuc", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}


```
