# 📜 Flutter CustomScrollView

## 🚀 Giriş

`CustomScrollView`, Flutter'da kaydırılabilir (scrollable) alanlar oluşturmak için kullanılan güçlü bir widget’tır.

Normal `ListView` veya `SingleChildScrollView` yerine, daha esnek ve karmaşık kaydırma yapıları oluşturmak istediğinde tercih edilir.

Bu widget, `Sliver` denilen özel bileşenlerle çalışır.

`Sliver`, "scrollable area" içinde özel davranışlara sahip bölümler oluşturmanı sağlar (örneğin: dinamik AppBar, liste, grid vb.).

## 🧩 CustomScrollView Yapısı

`CustomScrollView`, şu şekilde tanımlanır:
```dart
CustomScrollView(
  slivers: <Widget>[
    // Sliver bileşenleri buraya gelir
  ],
)
```

Yani children: yerine slivers: kullanılır.

slivers içine sadece Sliver widget’ları eklenebilir.



## 🏗️ Sık Kullanılan Sliver Widget’ları

### 1. SliverAppBar

Kaydırma ile birlikte gizlenebilen veya genişleyebilen AppBar oluşturur.

```dart
SliverAppBar(
  pinned: true,
  expandedHeight: 200.0,
  flexibleSpace: FlexibleSpaceBar(
    title: Text('SliverAppBar Örneği'),
    background: Image.network(
      'https://picsum.photos/800/400',
      fit: BoxFit.cover,
    ),
  ),
),
```

🧠 Açıklama:

`pinned: true` → AppBar kaydırıldığında üstte sabit kalır.

`expandedHeight` → Yüksekliği belirler.

`FlexibleSpaceBar` → Arka plan görseli veya animasyonlu başlık ekler.

### 2. SliverList

Liste oluşturmak için kullanılır (ListView’a benzer ama daha esnektir).

```dart

SliverList(
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return ListTile(
        title: Text('Öğe #$index'),
      );
    },
    childCount: 20,
  ),
),
```

🧠 Açıklama:

`delegate` parametresiyle, elemanları dinamik olarak oluşturabilirsin.

`SliverChildBuilderDelegate`, performans açısından ListView.builder gibidir.

### 3. SliverGrid

Grid (ızgara) görünümü sağlar.
```csharp
SliverGrid(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: 1.0,
  ),
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return Container(
        color: Colors.teal[100 * ((index % 8) + 1)],
        child: Center(child: Text('Grid $index')),
      );
    },
    childCount: 8,
  ),
),
```

🧠 Açıklama:

`gridDelegate` ile grid yapısını belirler.

`crossAxisCount: 2` → 2 sütun oluşturur.

`mainAxisSpacing` ve `crossAxisSpacing` → boşlukları ayarlar.


### 4. SliverToBoxAdapter

Sliver olmayan bir widget’ı (örneğin Container, Text, Image vb.) CustomScrollView içine eklemek için kullanılır.
```dart
SliverToBoxAdapter(
  child: Container(
    padding: EdgeInsets.all(20),
    color: Colors.amber,
    child: Center(
      child: Text('Sliver olmayan widget buraya!'),
    ),
  ),
),
```


💡 Tam Uygulama Örneği


```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomScrollViewExample(),
    );
  }
}

class CustomScrollViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // Üstte esnek AppBar
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('CustomScrollView Demo'),
              background: Image.network(
                'https://picsum.photos/800/400',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Statik bir widget ekleme
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.blueAccent,
              child: Text(
                'Bu kısım sabit bir Container.',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),

          // Liste görünümü
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Liste Elemanı #$index'),
                );
              },
              childCount: 10,
            ),
          ),

          // Grid görünümü
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.teal[100 * ((index % 8) + 1)],
                  child: Center(child: Text('Grid $index')),
                );
              },
              childCount: 9,
            ),
          ),
        ],
      ),
    );
  }
}
```

## ⚙️ Avantajları

✅ Performanslıdır — ListView’dan daha optimize davranır.
✅ Farklı kaydırma türlerini tek yapıda birleştirebilirsin.
✅ Özelleştirilebilir ve animasyonlu AppBar’lar oluşturabilirsin.
✅ Statik ve dinamik içerikleri tek bir scroll alanında gösterebilirsin.

⚠️ Dikkat Edilmesi Gerekenler

CustomScrollView içine Sliver olmayan widget doğrudan eklenemez.
→ Bunun için SliverToBoxAdapter kullan.

SingleChildScrollView ve ListView gibi widget’lar iç içe kullanılmamalı.
→ Kaydırma çakışmaları olabilir.

### 🔄 Alternatifler
Alternatif	Açıklama
ListView.builder()	Sadece liste yapısı gerekiyorsa daha basit bir çözüm.
SingleChildScrollView	Az sayıda, sabit widget içeren basit kaydırma alanları için.
NestedScrollView	AppBar ile iç içe scroll yapılacak karmaşık durumlarda (TabBar gibi).


### 🎯 Özet

CustomScrollView, Flutter’da karmaşık ve performanslı kaydırma deneyimleri oluşturmak için temel araçtır.

Birden fazla Sliver birleşimiyle hem liste, hem grid, hem de özel görünümler bir arada sunulabilir.
