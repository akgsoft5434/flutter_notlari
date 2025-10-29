# 📱 Flutter `ListView` Kullanımı

Flutter'da `ListView`, **kaydırılabilir bir liste** oluşturmak için kullanılır.  
Özellikle çok sayıda öğeyi (örneğin mesaj listesi, ürün listesi, ayarlar menüsü vb.) göstermek için en yaygın kullanılan widget'lardan biridir.

---

## 🧱 1. `ListView` Nedir?

`ListView`, dikey veya yatay olarak kaydırılabilen bir **widget listesidir**.

Basitçe söylemek gerekirse:  
Birden fazla öğeyi ekranda alt alta göstermek istiyorsan `Column` yerine `ListView` kullanırsın, çünkü `ListView` kaydırılabilir.

---

## ⚙️ 2. Temel Kullanım

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
        appBar: AppBar(title: const Text("ListView Basit Kullanım")),
        body: ListView(
          children: const [
            ListTile(title: Text("🍎 Elma")),
            ListTile(title: Text("🍌 Muz")),
            ListTile(title: Text("🍒 Kiraz")),
            ListTile(title: Text("🍉 Karpuz")),
          ],
        ),
      ),
    );
  }
}
```
<img src="../assets/Screenshot_20251029_041334.png" width="250"> 

### 🟢 Açıklama:

ListView widget'ı children parametresiyle bir widget listesi alır.

Liste kaydırılabilir (scrollable) olur.

## 🔁 3. ListView.builder ile Dinamik Liste

Eğer listenin eleman sayısı fazla veya veri bir diziden geliyorsa, ListView.builder kullanmak çok daha verimlidir.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> meyveler = ["Elma", "Muz", "Karpuz", "Kiraz", "Çilek", "Kavun"];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("ListView.builder Kullanımı")),
        body: ListView.builder(
          itemCount: meyveler.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.local_florist),
              title: Text(meyveler[index]),
              subtitle: Text("Sıra: $index"),
            );
          },
        ),
      ),
    );
  }
}
```

### 🟢 Avantajı:
Sadece ekranda görünen elemanlar oluşturulur.
Böylece performans artar, özellikle uzun listelerde çok önemlidir.

## 🎯 4. ListView.separated ile Aralara Ayırıcı (Divider) Ekleme

Liste elemanlarının arasına kolayca çizgi, boşluk veya özel widget eklemek için kullanılır.

```dart
ListView.separated(
  itemCount: 5,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text("Öğe $index"),
      leading: const Icon(Icons.star),
    );
  },
  separatorBuilder: (context, index) {
    return const Divider(
      color: Colors.grey,
      thickness: 1,
    );
  },
)
```

📘 Kullanım Amacı:
Liste öğeleri arasında çizgi veya boşluk eklemek.

## 🧭 5. Yatay (Horizontal) Liste

Yatay kaydırma yapmak için scrollDirection parametresi kullanılır.
```dart
ListView(
  scrollDirection: Axis.horizontal,
  children: [
    Container(width: 120, color: Colors.red),
    Container(width: 120, color: Colors.green),
    Container(width: 120, color: Colors.blue),
    Container(width: 120, color: Colors.orange),
  ],
)
```
📘 Not:
Yatay liste genelde ürün kaydırma, kategori gösterimi gibi alanlarda kullanılır.

## 🧩 6. ListView İçinde Farklı Widget’lar

ListView sadece Text veya ListTile değil, her türlü widget’ı içerebilir.
```dart
ListView(
  padding: const EdgeInsets.all(8),
  children: [
    const Text("Başlık", style: TextStyle(fontSize: 24)),
    Image.network("https://picsum.photos/200/300"),
    const SizedBox(height: 10),
    ElevatedButton(
      onPressed: () {},
      child: const Text("Tıkla"),
    ),
  ],
)
```
## 🧮 7. ListView + Card Kullanımı

Card widget’ı ile daha güzel görünümler elde edebilirsin.
```dart
ListView.builder(
  itemCount: 5,
  itemBuilder: (context, index) {
    return Card(
      color: Colors.blue[50],
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text("Kullanıcı $index"),
        subtitle: const Text("Detay bilgisi"),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  },
)
```
## 🧱 8. ListView İçinde Scroll Sorunu (Nested List)

Bir ListView başka bir ListView içinde kullanılacaksa şu özellik zorunludur:
```dart
ListView(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  children: [
    // Alt listeler buraya
  ],
)
```


🧠 Açıklama:

shrinkWrap: true → Liste, içeriği kadar yer kaplar.

NeverScrollableScrollPhysics() → Kaydırma devre dışı olur (üstteki liste kaydırmayı kontrol eder).

## 🧩 9. Ekstra: ListView.custom

Kendi özel yapılandırmanı tanımlamak istersen ListView.custom kullanabilirsin.
Ancak çoğu durumda builder veya separated yeterlidir.


📘 Özet

| Kullanım             | Açıklama                               |
| -------------------- | -------------------------------------- |
| `ListView`           | Basit liste, tüm elemanlar oluşturulur |
| `ListView.builder`   | Dinamik ve performanslı liste          |
| `ListView.separated` | Araya ayırıcı (Divider) ekler          |
| `ListView.custom`    | Özel yapılar için                      |
| `scrollDirection`    | Dikey/Yatay liste ayarı                |


















