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




































