# 🃏 Flutter `Card` Widget — Detaylı Anlatım

## 🎯 Amaç
`Card` widget'ı, Flutter'da görsel olarak hoş ve düzenli bilgi kutuları oluşturmak için kullanılır.  
Genellikle kart yapısında gösterilen bilgi, resim, buton veya metin içeriklerini göstermek için tercih edilir.

---

## 🧱 Temel Kullanım

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Card Widget Örneği')),
        body: const Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Merhaba Flutter!'),
            ),
          ),
        ),
      ),
    );
  }
}
```

🧩 Açıklama:

Card: Temel widget’tır. İçine genellikle Column, Row, ListTile gibi widget’lar yerleştirilir.

Padding: Kartın içeriğini kenarlardan boşluklu hale getirir.

Text: Kartın içeriğidir.

🎨 Özellikleri (Properties)


| Özellik        | Açıklama                                                      | Örnek                                                                    |
| -------------- | ------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `color`        | Kartın arka plan rengini belirler                             | `color: Colors.blue[50],`                                                |
| `shadowColor`  | Kartın gölgesinin rengini belirler                            | `shadowColor: Colors.grey,`                                              |
| `elevation`    | Kartın gölge derinliğini (yüksekliğini) belirler              | `elevation: 8,`                                                          |
| `shape`        | Kartın kenar şeklini belirler (`RoundedRectangleBorder` gibi) | `shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))` |
| `margin`       | Kartın dış boşluklarını ayarlar                               | `margin: EdgeInsets.all(12),`                                            |
| `clipBehavior` | Taşan içeriğin nasıl kırpılacağını belirler                   | `clipBehavior: Clip.antiAlias,`                                          |


💡 Gelişmiş Örnek: Bilgi Kartı


```dart
import 'package:flutter/material.dart';

class KullaniciKart extends StatelessWidget {
  const KullaniciKart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 6,
      shadowColor: Colors.blueGrey,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/avatar.png'),
        ),
        title: const Text(
          'Selçuk Akg',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('Yazılım Geliştirici'),
        trailing: IconButton(
          icon: const Icon(Icons.message, color: Colors.blue),
          onPressed: () {
            debugPrint('Mesaj butonuna tıklandı!');
          },
        ),
      ),
    );
  }
}
```

🧠 Ne Öğrendik?

ListTile ile kart içinde profil tipi bilgi kartları oluşturabilirsin.

leading, title, subtitle, trailing gibi alanlar kart içinde düzen sağlar.

RoundedRectangleBorder ile köşeleri yumuşatabilirsin.


🧩 Birden Fazla Kart Listeleme (ListView ile)

```dart
import 'package:flutter/material.dart';

class KartListesi extends StatelessWidget {
  const KartListesi({super.key});

  @override
  Widget build(BuildContext context) {
    final kisiler = [
      {'isim': 'Ahmet', 'meslek': 'Öğretmen'},
      {'isim': 'Mehmet', 'meslek': 'Mühendis'},
      {'isim': 'Zeynep', 'meslek': 'Doktor'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Kişi Kartları')),
      body: ListView.builder(
        itemCount: kisiler.length,
        itemBuilder: (context, index) {
          final kisi = kisiler[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: Text(kisi['isim']!),
              subtitle: Text(kisi['meslek']!),
            ),
          );
        },
      ),
    );
  }
}
```
 <img src="assets/Screenshot_20251029_035610.png" width="250"> 



🧾 Açıklama:

Bu örnek, verileri dinamik olarak listeleyen bir yapıyı gösterir.
Her kişi için ayrı bir kart oluşturulur.

✨ Ekstra: Card İçinde Görsel Kullanımı
```dart
Card(
  clipBehavior: Clip.antiAlias,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  elevation: 8,
  child: Column(
    children: [
      Image.asset('assets/kitap.jpg', fit: BoxFit.cover),
      const ListTile(
        title: Text('Kitap Adı: Flutter Rehberi'),
        subtitle: Text('Yazar: Selçuk Akg'),
      ),
    ],
  ),
)
```

🧠 Burada Ne Var?

Image.asset ile kartın üst kısmında görsel gösterildi.

Alt kısımda ListTile ile metin bilgileri gösterildi.

clipBehavior: Clip.antiAlias taşan görseli keserek düzgün bir görünüm sağlar.

💬 İpucu:

InkWell widget’ı ile Card tıklanabilir hale getirilebilir:

```dart
InkWell(
  onTap: () {
    debugPrint('Kart tıklandı!');
  },
  child: Card(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Text('Tıklanabilir Kart'),
    ),
  ),
)

```

🧩 Özet

| Konu                    | Açıklama                                               |
| ----------------------- | ------------------------------------------------------ |
| **Kullanım Amacı**      | Bilgileri düzenli ve estetik biçimde göstermek         |
| **Tıklanabilirlik**     | `InkWell` veya `GestureDetector` ile sağlanır          |
| **Yaygın İçerikler**    | `ListTile`, `Image`, `Column`, `Row`                   |
| **Tasarım Özellikleri** | `elevation`, `color`, `shape`, `margin`, `shadowColor` |


🚀 Sonuç

Card widget’ı, uygulamalarında profil kartı, ürün kutusu, bilgi kartı gibi bileşenler oluşturmak için en çok kullanılan Flutter widget’larından biridir.
Hem sade hem de şık bir görünüm sağlar.
