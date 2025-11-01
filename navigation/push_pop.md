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

