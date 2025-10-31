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
