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

| Özellik          | Açıklama                                            | Örnek                                        |
| ---------------- | --------------------------------------------------- | -------------------------------------------- |
| `leading`        | Sol kısma ikon veya görsel ekler                    | `leading: Icon(Icons.person)`                |
| `title`          | Ana başlık metni                                    | `title: Text('Flutter')`                     |
| `subtitle`       | Alt başlık metni                                    | `subtitle: Text('Mobil Geliştirme')`         |
| `trailing`       | Sağ kısma ikon, switch, buton gibi bir widget ekler | `trailing: Icon(Icons.more_vert)`            |
| `isThreeLine`    | Kartın üç satır olması gerektiğini belirtir         | `isThreeLine: true`                          |
| `dense`          | Daha sıkı bir görünüm sağlar                        | `dense: true`                                |
| `contentPadding` | İç boşlukları ayarlar                               | `contentPadding: EdgeInsets.all(8)`          |
| `onTap`          | Satıra tıklanınca çalışacak olay                    | `onTap: () { print('Tıklandı'); }`           |
| `onLongPress`    | Uzun basılınca çalışacak olay                       | `onLongPress: () { print('Uzun basıldı'); }` |


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

🧠 Burada Ne Oldu?

CircleAvatar ile profil resmi eklendi.

trailing kısmına IconButton eklenerek mesaj gönderme butonu oluşturuldu.

onTap ile satır tıklanınca tepki veriyor.



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

🧾 Açıklama:

ListView ile birden fazla ListTile art arda sıralandı.

Divider() satır aralarına ince çizgi eklemek için kullanıldı.


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
🎓 Burada Ne Öğrendik?

ListView.builder ile dinamik olarak veriden ListTile üretildi.

Bu yöntem, özellikle veritabanından gelen veya API’den çekilen listeler için idealdir.

## ✨ Özel Tasarımlı ListTile
``` dart
Card(
  margin: const EdgeInsets.all(10),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  elevation: 5,
  child: ListTile(
    leading: const Icon(Icons.book, color: Colors.deepPurple),
    title: const Text(
      'Flutter Rehberi',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    ),
    subtitle: const Text('Mobil uygulama geliştirmeye giriş'),
    trailing: const Icon(Icons.star, color: Colors.amber),
    tileColor: Colors.deepPurple[50],
    onTap: () => debugPrint('Kitap seçildi'),
  ),
)
```
🧱 Ekstra Özellikler:

| Özellik             | Açıklama                                  |
| ------------------- | ----------------------------------------- |
| `tileColor`         | Arka plan rengini ayarlar                 |
| `selected`          | Satırın seçili olup olmadığını belirtir   |
| `selectedColor`     | Seçili durumdaki yazı rengini belirler    |
| `selectedTileColor` | Seçili satırın arka plan rengini belirler |


🧩 Seçilebilir ListTile (örnek)

bool secili = false;

ListTile(
  title: const Text('Flutter Dersi'),
  trailing: Icon(
    secili ? Icons.check_box : Icons.check_box_outline_blank,
    color: Colors.blue,
  ),
  onTap: () {
    secili = !secili;
    debugPrint('Durum: $secili');
  },
)


Bu yapı genellikle ayarlar menüsü, yapılacaklar listesi gibi durumlarda kullanılır.

💬 İpucu

ListTile basit liste görünümü için idealdir, ancak çok karmaşık yapılarda Row, Column veya özel widget kombinasyonları daha uygun olabilir.

Görsel olarak Card ile birlikte kullanımı, profesyonel bir görünüm sağlar.

ListTile ayrıca Radio, Checkbox, Switch gibi bileşenlerle de rahatlıkla entegre edilebilir.

## 🧾 Özet

| Konu                      | Açıklama                                                 |
| ------------------------- | -------------------------------------------------------- |
| **Amacı**                 | Liste biçiminde satır yapısı oluşturmak                  |
| **Yaygın Kullanım Alanı** | Profil listesi, ayarlar menüsü, kişi listesi             |
| **Önemli Özellikler**     | `leading`, `title`, `subtitle`, `trailing`               |
| **Tıklanabilirlik**       | `onTap` ve `onLongPress`                                 |
| **Ekstra**                | `isThreeLine`, `dense`, `tileColor`, `selectedTileColor` |



## 🚀 Sonuç

ListTile, Flutter’da en çok kullanılan yapı taşlarından biridir.
Basit ama güçlü bir yapıya sahip olduğu için menü listeleri, kişi bilgileri, ayar sayfaları gibi birçok senaryoda tercih edilir.

Birçok widget ile uyumlu çalışarak uygulamanı hem kullanışlı hem de estetik hale getirir.
