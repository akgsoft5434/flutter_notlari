# 📚 SliverGrid

Aşağıda Flutter’ın `SliverGrid` yapısını, `gridDelegate` türlerini, `delegate` kullanımını, örnekleri, performans ipuçlarını ve sık yapılan hataları detaylı şekilde anlatıyorum.

## 🚀 Özet — Ne işe yarar?

`SliverGrid`, `CustomScrollView` içinde ızgara (grid) düzeni oluşturmak için kullanılan bir Sliver bileşenidir. 

`SliverList` gibi lazy (gerektiğinde oluşturma) davranışı destekler ve gridDelegate ile ızgara düzeninin nasıl davranacağını tanımlar.

## 🧩 Temel Yapı
```dart
SliverGrid(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    childAspectRatio: 1.0,
  ),
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return Widget(); // her hücrenin görünümü
    },
    childCount: 20,
  ),
),
```

`gridDelegate:` Izgara düzenini tanımlar (sütun sayısı, boşluklar, boyut oranı...).

`delegate:` Hücreleri nasıl ve ne zaman oluşturacağını belirler (lazy/fixed).

## 🧭 gridDelegate Seçenekleri

### 1. SliverGridDelegateWithFixedCrossAxisCount

Sabit sütun sayısı kullanılır.

Parametreler:

`crossAxisCount` — (zorunlu) satır başına sütun sayısı.

`mainAxisSpacing` — dikey boşluk.

`crossAxisSpacing` — yatay boşluk.

`childAspectRatio` — genişlik / yükseklik oranı (örn. 1 → kare).

Kullanım:
```dart
SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 3,
  mainAxisSpacing: 10,
  crossAxisSpacing: 10,
  childAspectRatio: 0.75,
)
```

### 2. SliverGridDelegateWithMaxCrossAxisExtent

Her hücrenin maksimum genişliğini belirler; ekrana sığan sayıda sütun otomatik hesaplanır.

Parametreler:

`maxCrossAxisExtent` — her hücrenin maksimum genişliği (px).

`mainAxisSpacing`, `crossAxisSpacing`, `childAspectRatio`.

Kullanım:

```dart
SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 200,
  mainAxisSpacing: 8,
  crossAxisSpacing: 8,
  childAspectRatio: 1.2,
)
```

### 🔁 delegate Seçenekleri

`SliverChildBuilderDelegate`

- Lazy oluşturur. Büyük/uzun listeler için ideal.

- childCount ile toplam öğe sayısını ver.

`SliverChildListDelegate`

Tüm öğeleri önceden tutar. Küçük, sabit listeler için uygun.

Örnek:
```dart
delegate: SliverChildBuilderDelegate(
  (BuildContext context, int index) => Card(...),
  childCount: items.length,
),
```

## 🧪 Tam Çalışır Örnek (main.dart)

Aşağıdaki örnek CustomScrollView içinde SliverAppBar, SliverToBoxAdapter, iki farklı SliverGrid (FixedCrossAxisCount ve MaxCrossAxisExtent) gösterir.

```dart
import 'package:flutter/material.dart';

void main() => runApp(SliverGridDemoApp());

class SliverGridDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SliverGrid Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: SliverGridDemoPage(),
    );
  }
}

class SliverGridDemoPage extends StatelessWidget {
  final List<int> items = List<int>.generate(30, (i) => i + 1);

  Widget _buildGridItem(int index) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () => debugPrint('Tapped item $index'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(child: Text('${index + 1}')),
            SizedBox(height: 8),
            Text('Item ${index + 1}', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverGrid Detayları'),
              background: Container(color: Colors.teal[300]),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('FixedCrossAxisCount Grid (3 sütun):',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildGridItem(index),
                childCount: 9,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('MaxCrossAxisExtent Grid (max 150px):',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildGridItem(index + 9),
                childCount: 12,
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}
```

## ✨ Gelişmiş İpuçları ve Özelleştirmeler

- Farklı yüksekliğe sahip (masonry/staggered) grid istiyorsan flutter_staggered_grid_view gibi paketler kullanabilirsin. (Core Flutter sadece sabit/aspect ratio tabanlı grid sağlar.)

- SliverPadding ile grid çevresine padding uygulamak daha doğru sonuç verir (her hücreye ayrı margin vermek yerine).

- Görsel içerikli hücrelerde FadeInImage, CachedNetworkImage vb. ile önbelleğe alma kullan; ağdan yüklenen resimler performansı etkileyebilir.

- Her öğeyi ayrı küçük widget sınıfı olarak yaz; rebuild maliyetini düşürür ve kod okunurluğu artar.

- childAspectRatio ile kare, dik veya yatay hücreler kolayca ayarlanır.

⚠️ Yaygın Hatalar / Dikkat Edilecekler

- Sonsuz yükleme: childCount belirtmezsen veya yanlış hesaplarsan beklenmedik davranış olabilir.

- IntrinsicHeight/IntrinsicWidth kullanımı: hücrelerin içindeki karmaşık hesaplamalar performansı düşürebilir.

- Expanded/Flexible: Sliver içinde genelde Expanded kullanmaya çalışmak anlamsızdır; hücreler kendi boyutlarını childAspectRatio ile belirler.

- Ağ resimleri: her hücrede ağ resmi varsa, düzgün cache ve placeholder yönetimi yapılmalı.

🚦 Performans İpuçları

- Lazy loading kullan: SliverChildBuilderDelegate tercih et.

- const kullanabildiğin yerlerde kullan (statik görünümler için).

- Ağ resimlerini önbellekle (paket veya Image.network + cacheWidth/cacheHeight kullanımı).

- Çok karmaşık hücre UI’ları varsa RepaintBoundary ile sınırlandır veya ayrı widget’a taşı.

- childAspectRatio doğru ayarlanırsa layout hesaplama daha hızlıdır.

🔁 SliverGrid ve SliverList Karşılaştırması / Ne Zaman Hangisi?

- Elemanlar kutu/ızgara içinde gösterilecekse → SliverGrid.

- Her eleman tek satır şeklindeyse (ListTile gibi) → SliverList veya SliverFixedExtentList (sabit yüksekse daha hızlı).

📌 Özet — Hızlı Püf Noktaları

SliverGrid ile ekran genişliğine göre dinamik sütun/çerçeve oluşturabilirsin.

SliverGridDelegateWithFixedCrossAxisCount → sabit sütun sayısı.

SliverGridDelegateWithMaxCrossAxisExtent → maksimum hücre genişliği.

Büyük veriler için SliverChildBuilderDelegate (lazy) kullan.

Karmaşık/masonry düzen için üçüncü parti paketlere bak.
