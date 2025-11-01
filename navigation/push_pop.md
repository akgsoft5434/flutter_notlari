# 🧭 Flutter Navigation (Sayfalar Arası Geçiş) Rehberi

Flutter uygulamalarında sayfalar (screens) arasında geçiş yapmak için Navigator sınıfı kullanılır.

Bu yapı, sayfaları bir yığın (stack) mantığıyla yönetir:

Yeni sayfa açmak = `push` (yığına ekleme)

Geri dönmek = `pop` (yığından çıkarma)

## 🧩 1. Basit Navigation Mantığı

Flutter’da sayfa geçişi `Navigator.push()` ve `Navigator.pop()` ile yapılır.

### 📄 Örnek 1: Temel İki Sayfa Geçişi

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AnaSayfa(),
  ));
}

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ana Sayfa")),
      body: Center(
        child: ElevatedButton(
          child: Text("Detay Sayfasına Git"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetaySayfa()),
            );
          },
        ),
      ),
    );
  }
}

class DetaySayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detay Sayfası")),
      body: Center(
        child: ElevatedButton(
          child: Text("Geri Dön"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
```

🧠 Açıklama:

`Navigator.push()` → Yeni sayfa açar.

`Navigator.pop()` → Önceki sayfaya döner.

`MaterialPageRoute()` → Sayfalar arası geçiş animasyonunu yönetir.


## 📦 2. Sayfalar Arası Veri Aktarma

Bir sayfadan diğerine parametre gönderebilirsin.

### 📄 Örnek 2: Veri Gönderme ve Alma

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: AnaSayfa()));
}

class AnaSayfa extends StatelessWidget {
  final String mesaj = "Selam, Flutter!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ana Sayfa")),
      body: Center(
        child: ElevatedButton(
          child: Text("Mesajı Gönder"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetaySayfa(veri: mesaj),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetaySayfa extends StatelessWidget {
  final String veri;

  DetaySayfa({required this.veri});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detay Sayfası")),
      body: Center(
        child: Text(
          "Gelen veri: $veri",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
```
🧠 Açıklama:

DetaySayfa(veri: mesaj) ile veri gönderildi.

final String veri; parametresiyle veri alındı.


## 🔙 3. Geri Dönerken Veri Gönderme

Bir sayfadan geri dönerken veri göndermek de mümkündür.

### 📄 Örnek 3: Navigator.pop ile Veri Döndürme
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: AnaSayfa()));
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  String sonuc = "Henüz veri yok";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ana Sayfa")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(sonuc),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Detay Sayfasına Git"),
              onPressed: () async {
                final geriVeri = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetaySayfa()),
                );

                setState(() {
                  sonuc = geriVeri ?? "Boş veri geldi";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DetaySayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detay Sayfası")),
      body: Center(
        child: ElevatedButton(
          child: Text("Veriyle Geri Dön"),
          onPressed: () {
            Navigator.pop(context, "Bu veri DetaySayfa’dan geldi!");
          },
        ),
      ),
    );
  }
}
```
