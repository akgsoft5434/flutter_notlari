# 📋 Flutter `ListTile` Widget --- Detaylı Anlatım

## 🎯 Amaç

`ListTile`, Flutter'da **tek bir satırda bilgi sunmak** için kullanılan,
oldukça yaygın ve pratik bir widget'tır.\
Genellikle listelerde (`ListView`) kullanılır ve satır yapısında
**başlık, alt başlık, simge veya buton** gibi bileşenler içerir.

------------------------------------------------------------------------

## 🧱 Temel Kullanım

``` dart
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
        appBar: AppBar(title: const Text('ListTile Örneği')),
        body: const ListTile(
          leading: Icon(Icons.person),
          title: Text('Selçuk Akg'),
          subtitle: Text('Yazılım Geliştirici'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
```

### 🧩 Açıklama

-   **`leading`** → Sol tarafa yerleştirilen ikon, resim veya avatar.\
-   **`title`** → Ana başlık kısmıdır.\
-   **`subtitle`** → Alt başlık veya açıklama kısmıdır.\
-   **`trailing`** → Sağ tarafa eklenen ikon, buton veya başka bir
    widget'tır.

------------------------------------------------------------------------

## 🧱 Özellikler (Properties)

  --------------------------------------------------------------------------------------------------
  Özellik                  Açıklama                   Örnek
  ------------------------ -------------------------- ----------------------------------------------
  `leading`                Sol kısma ikon veya görsel `leading: Icon(Icons.person)`
                           ekler                      

  `title`                  Ana başlık metni           `title: Text('Flutter')`

  `subtitle`               Alt başlık metni           `subtitle: Text('Mobil Geliştirme')`

  `trailing`               Sağ kısma ikon, switch,    `trailing: Icon(Icons.more_vert)`
                           buton gibi bir widget      
                           ekler                      

  `isThreeLine`            Kartın üç satır olması     `isThreeLine: true`
                           gerektiğini belirtir       

  `dense`                  Daha sıkı bir görünüm      `dense: true`
                           sağlar                     

  `contentPadding`         İç boşlukları ayarlar      `contentPadding: EdgeInsets.all(8)`

  `onTap`                  Satıra tıklanınca          `onTap: () { print('Tıklandı'); }`
                           çalışacak olay             

  `onLongPress`            Uzun basılınca çalışacak   `onLongPress: () { print('Uzun basıldı'); }`
                           olay                       
  --------------------------------------------------------------------------------------------------

------------------------------------------------------------------------

## 💡 Örnek: Temel Profil Kartı

``` dart
ListTile(
  leading: const CircleAvatar(
    backgroundImage: AssetImage('assets/avatar.png'),
  ),
  title: const Text('Ahmet Yılmaz'),
  subtitle: const Text('Grafik Tasarımcı'),
  trailing: IconButton(
    icon: const Icon(Icons.message, color: Colors.blue),
    onPressed: () {
      debugPrint('Mesaj Gönderildi');
    },
  ),
  onTap: () {
    debugPrint('Kart tıklandı');
  },
)
```

------------------------------------------------------------------------

## 🧩 Birden Fazla `ListTile` Kullanımı

``` dart
import 'package:flutter/material.dart';

class KisilerSayfasi extends StatelessWidget {
  const KisilerSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kişi Listesi')),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Mehmet'),
            subtitle: Text('Mühendis'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Zeynep'),
            subtitle: Text('Doktor'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_3),
            title: Text('Ali'),
            subtitle: Text('Öğretmen'),
            trailing: Icon(Icons.call),
          ),
        ],
      ),
    );
  }
}
```

------------------------------------------------------------------------

## 🧩 Dinamik `ListTile` Oluşturma

``` dart
final kisiler = [
  {'isim': 'Ayşe', 'meslek': 'Hemşire'},
  {'isim': 'Can', 'meslek': 'Pilot'},
  {'isim': 'Elif', 'meslek': 'Avukat'},
];

ListView.builder(
  itemCount: kisiler.length,
  itemBuilder: (context, index) {
    final kisi = kisiler[index];
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(kisi['isim']!),
      subtitle: Text(kisi['meslek']!),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        debugPrint('${kisi['isim']} seçildi');
      },
    );
  },
)
```

------------------------------------------------------------------------

## 🚀 Sonuç

`ListTile`, Flutter'da **liste biçimli satırlar** oluşturmak için
kullanılan sade ama güçlü bir widget'tır.\
**Profil listeleri, ayarlar menüleri ve kişi listeleri** gibi birçok
yerde kullanılır.\
---
