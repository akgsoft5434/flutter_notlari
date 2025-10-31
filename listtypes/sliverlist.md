# 📜 Flutter SliverList — Detaylı Anlatım ve Örnekler
## 🚀 Giriş

`SliverList`, Flutter’da kaydırılabilir bir liste oluşturmak için kullanılan özel bir Sliver bileşenidir.

`CustomScrollView` içinde kullanılır ve performans açısından ListView.builder()’a benzer şekilde çalışır.

`SliverList`, liste elemanlarını tembel yükleme (lazy loading) yöntemiyle oluşturur.

Yani sadece ekranda görünen widget’lar render edilir.

## 🧩 Kullanım Yapısı

`liverList`, her zaman bir delegate parametresi alır.

Bu delegate, listedeki her öğenin nasıl oluşturulacağını tanımlar.

Temel yapı:
```dart
SliverList(
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return Widget(); // her öğenin görünümü
    },
    childCount: 20, // toplam öğe sayısı
  ),
)
```

⚙️ Parametreler

| Parametre                    | Açıklama                                                          |
| ---------------------------- | ----------------------------------------------------------------- |
| `delegate`                   | Liste öğelerini oluşturma mantığını belirler. (Zorunlu)           |
| `SliverChildBuilderDelegate` | Lazy yükleme (performanslı) liste oluşturur.                      |
| `SliverChildListDelegate`    | Tüm öğeleri önceden belleğe yükler (küçük listelerde kullanılır). |
| `addAutomaticKeepAlives`     | `true` olursa `KeepAlive` davranışı etkin olur.                   |
| `addRepaintBoundaries`       | Performans için repaint sınırları oluşturur (varsayılan `true`).  |
| `addSemanticIndexes`         | Erişilebilirlik (a11y) için indeks ekler.                         |


## 🧠 SliverChildBuilderDelegate ile Dinamik Liste

`ListView.builder()`’a en çok benzeyen kullanım şeklidir.
```dart
SliverList(
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return Container(
        height: 80,
        color: index.isEven ? Colors.teal[100] : Colors.amber[100],
        alignment: Alignment.center,
        child: Text(
          'Öğe #$index',
          style: TextStyle(fontSize: 20),
        ),
      );
    },
    childCount: 30, // toplam 30 öğe
  ),
),

```

## 🧱 SliverChildListDelegate ile Statik Liste

Tüm öğeler önceden oluşturulmuşsa, bu yöntem kullanılabilir.
(Büyük listelerde performansı düşürür ama küçük statik listelerde idealdir.)
```dart
SliverList(
  delegate: SliverChildListDelegate([
    ListTile(title: Text('Birinci Öğə')),
    ListTile(title: Text('İkinci Öğə')),
    ListTile(title: Text('Üçüncü Öğə')),
  ]),
),

```

### 🧩 CustomScrollView ile Tam Kullanım Örneği

Aşağıdaki örnekte SliverAppBar, SliverToBoxAdapter ve SliverList birlikte kullanılarak tam bir sayfa yapısı oluşturulmuştur.

```dart
import 'package:flutter/material.dart';

void main() => runApp(SliverListExampleApp());

class SliverListExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SliverListExample(),
    );
  }
}

class SliverListExample extends StatelessWidget {
  final List<String> items = List.generate(50, (index) => "Öğe #$index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // Üstte esnek AppBar
          SliverAppBar(
            pinned: true,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverList Örneği'),
              background: Image.network(
                'https://picsum.photos/800/400?random=1',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Üst kısımda sabit bir kutu
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.blueGrey[50],
              child: Text(
                'Aşağıda 50 elemanlık bir liste var 👇',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          // Asıl liste
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(items[index]),
                    subtitle: Text('Açıklama ${index + 1}'),
                    trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
                  ),
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
```


### ⚙️ Performans İpuçları

✅ SliverChildBuilderDelegate kullan (lazy loading sayesinde performanslıdır).

✅ addRepaintBoundaries parametresini true bırak — her öğe bağımsız boyanır.

✅ Uzun listelerde childCount belirtmeyi unutma (aksi halde sonsuz kaydırma hatası olabilir).

✅ Görsel olarak çok karmaşık öğeleri ayrı widget sınıfı yaparak yönetmek daha temizdir.

