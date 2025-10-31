# 📜 Flutter SingleChildScrollView

SingleChildScrollView, Flutter’da tek bir çocuğu (child) kaydırılabilir hâle getiren basit ama sık kullanılan bir widget’tır. Küçük ve sabit sayıda bileşenlerin dikey veya yatay olarak kaydırılmasını sağlamaya uygundur.

## 🚀 Giriş — Ne işe yarar?

SingleChildScrollView, içindeki tek bir widget’ın (çoğunlukla Column veya Row) ebeveyn alanından büyük olması durumunda kaydırma (scroll) yapılabilmesini sağlar. Örneğin bir form, uzun içerikli bir sayfa ya da yatay kayan küçük resim listeleri için kullanılır.

```dart
SingleChildScrollView(
  child: Column(
    children: [
      // uzun liste değil, sabit sayıda widget
    ],
  ),
)
```
## 🧩 Temel Özellikler / Parametreler

`child`— Zorunlu: içeriği barındıran tek widget.

`scrollDirection` — `Axis.vertical` veya `Axis.horizontal`. Varsayılan vertical.

`padding` — İçeriğe padding eklemek için (genelde EdgeInsets).

`reverse `— true ise kaydırma tersine döner.

`controller `— ScrollController koyarak kaydırmayı izleyebilir veya programatik kaydırma yapabilirsin.

`physics` — Kaydırma davranışını kontrol eder (örn. BouncingScrollPhysics, ClampingScrollPhysics, AlwaysScrollableScrollPhysics).

`keyboardDismissBehavior` — Klavye nasıl kapanır (onDrag veya manual).

`clipBehavior` — Taşan içeriğin nasıl kırpılacağı.


##  ✅ Ne zaman kullanmalı?

İçerik tek bir sütun/tek bir satır ise ve öğe sayısı çok büyük değilse (ör. makul uzunlukta formlar, tanıtım sayfaları).

İçerik dinamik ama toplam öğe sayısı küçük/orta ise.

Basit yatay kaydırma yapmak istiyorsan (Row içine `SingleChildScrollView(scrollDirection: Axis.horizontal`)).

##  ❌ Ne zaman kullanmamalı?

Büyük/kayıtça uzun çok sayıda öğe varsa (ör. 1000 öğelik liste). Bu durumda `ListView.builder` veya `SliverList` kullan — 

bunlar tembel yükleme (lazy loading) yapar ve belleği korur.

Tekil widget child yerine birden fazla bağımsız kaydırılabilir alan gerekiyorsa (Nested scroll senaryolarında dikkat gerek).

## 🧠 Yaygın Hatalar ve Dikkat Edilmesi Gerekenler

### 1) Column içinde Expanded / Flexible kullanımı

SingleChildScrollView içine koyduğun Column sınırsız (unbounded) yükseklik alır. Expanded veya Flexible kullanırsan hata alırsın (RenderFlex children have non-zero flex but incoming height constraints are unbounded).

Çözüm yolları:

Expanded yerine sabit yükseklik (SizedBox) kullan.

ConstrainedBox veya IntrinsicHeight ile sarmalayarak sınırlamak (performans etkileyebilir).

Örnek (hatalı):
```dart
SingleChildScrollView(
  child: Column(
    children: [
      Expanded(child: ...), // HATA
    ],
  ),
)
```

Doğru kullanım örneği (form için):

```dart

SingleChildScrollView(
  padding: EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text('Başlık'),
      SizedBox(height: 16),
      TextField(),
      SizedBox(height: 16),
      ElevatedButton(onPressed: (){}, child: Text('Gönder')),
    ],
  ),
)
```


## ⚖️ Performans Notları

SingleChildScrollView tüm child ağacını tek seferde render eder. Çok büyük içeriklerde bellek ve performans sorunlarına yol açabilir.

Uzun listeler için ListView.builder, ListView.separated ya da SliverList tercih et.

IntrinsicHeight ve IntrinsicWidth gibi widget’lar performansı düşürebilir; sadece gerektiğinde kullan.

### 🔁 Alternatifler ve Ne Zaman Hangisini Seçmeli?

|                                 Senaryo | Önerilen Widget                                                             |
| --------------------------------------: | --------------------------------------------------------------------------- |
|         Uzun, dinamik ve çok sayıda öğe | `ListView.builder` veya `SliverList`                                        |
|      Tek bir sütun, form, az sayıda öğe | `SingleChildScrollView` + `Column`                                          |
|                Yatay küçük öğe kaydırma | `SingleChildScrollView(scrollDirection: Axis.horizontal)`                   |
| AppBar + kaydırılabilir içerik + TabBar | `NestedScrollView` veya `CustomScrollView` + Slivers                        |
|              Yenileme (pull-to-refresh) | `RefreshIndicator` + `SingleChildScrollView(AlwaysScrollableScrollPhysics)` |

