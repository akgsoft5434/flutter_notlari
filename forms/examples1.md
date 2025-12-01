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

## Açıklamalar

### 🔍 1. onPressed: () { ... }

Bu kısım:

Butona basıldığında ne olacağını tanımlar.

Yani buradaki süslü parantez içi butonun görevidir.

### 🔍 2. txtSayi.text

txtSayi bir TextEditingController’dır.

.text => TextField içine yazılan metni verir.
Örn: TextField’e "12" yazdıysan → txtSayi.text = "12"

### 🔍 3. int.tryParse(txtSayi.text)

Bu yöntem:

Text’i integer’a (tamsayıya) dönüştürmeye çalışır.

Eğer dönüştürebilirse → sayıyı verir.

Dönüştüremezse → null döner.

### 🔍 4. ?? 0 (Null-Coalescing Operator)

Bu operatör:

Eğer soldaki değer null ise sağdaki değeri kullanır.

Yani:

`int sayi = int.tryParse(txtSayi.text) ?? 0;`


Demek ki:

Kullanıcı geçersiz bir şey yazarsa → sayi = 0

Kullanıcı geçerli bir sayı yazarsa → sayi = o sayı


| txtSayi.text | tryParse | sayi |
| ------------ | -------- | ---- |
| "10"         | 10       | 10   |
| ""           | null     | 0    |
| "merhaba"    | null     | 0    |



### 🔍 5. setState(() => sonuc = (sayi * sayi).toString());

setState:

Flutter'a "ekrandaki bir şey değişti, ekranı güncelle" der.

`=> sonuc = (sayi * sayi).toString():`

`sayi * sayi`→ sayının karesi

`.toString()` → çıktıyı String yapar

sonuc değişkenine yazar




# ✅ 2. Checkbox – KDV hesaplama (İşaretli ise %20 ekle)

```dart

class KdvOrnek extends StatefulWidget {
  @override
  State<KdvOrnek> createState() => _KdvOrnekState();
}

class _KdvOrnekState extends State<KdvOrnek> {
  bool kdvEkle = false;
  final fiyat = TextEditingController();
  double toplam = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("KDV Hesabı")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: fiyat,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Fiyat"),
            ),
            Row(
              children: [
                Checkbox(
                  value: kdvEkle,
                  onChanged: (v) {
                    setState(() => kdvEkle = v!);
                  },
                ),
                Text("KDV (%20) Ekle"),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                double f = double.tryParse(fiyat.text) ?? 0;

                toplam = kdvEkle ? f * 1.20 : f;

                setState(() {});
              },
              child: Text("Hesapla"),
            ),
            Text("Toplam: $toplam TL", style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}


```
