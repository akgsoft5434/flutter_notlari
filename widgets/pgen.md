
# 🌈 PaletteGenerator

`PaletteGenerator`, Flutter’da bir görselin (resmin) içindeki baskın renkleri (dominant colors) otomatik olarak çıkarmaya yarayan çok kullanışlı bir sınıftır.

Bu sınıf `package:palette_generator/palette_generator.dart` kütüphanesinden gelir.

## 🎯 Ne işe yarar?

Bir görseldeki renkleri analiz eder ve şu renkleri döndürebilir:

🎨 dominantColor → En baskın renk

🌅 vibrantColor → Canlı renk

🌆 mutedColor → Soluk renk

🌈 lightVibrantColor → Açık tonda canlı renk

🌌 darkMutedColor → Koyu tonda soluk renk vb.


Bu sayede örneğin:

Görselin arka plan rengini resme uygun seçebilirsin,

Yazı rengini kontrasta göre ayarlayabilirsin,

Dinamik temalar oluşturabilirsin.

## 📦 Kurulum

`pubspec.yaml` dosyana şunu ekle:
```dart
dependencies:
  palette_generator: ^0.3.3
```

Ardından terminalde:

```dart
flutter pub get
```

## 🧠 Kullanımı (Temel Örnek)

```dart
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteExample extends StatefulWidget {
  @override
  _PaletteExampleState createState() => _PaletteExampleState();
}

class _PaletteExampleState extends State<PaletteExample> {
  PaletteGenerator? _paletteGenerator;
  Color _dominantColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    // Görseli analiz ediyor
    final PaletteGenerator generator =
        await PaletteGenerator.fromImageProvider(
      AssetImage('assets/images/nature.jpg'),
      size: const Size(200, 100), // İsteğe bağlı (analiz boyutu)
    );

    setState(() {
      _paletteGenerator = generator;
      _dominantColor = generator.dominantColor?.color ?? Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _dominantColor, // Arka plan resmin baskın rengi
      appBar: AppBar(
        title: Text('Palette Generator Örneği'),
        backgroundColor: _dominantColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/nature.jpg'),
            const SizedBox(height: 20),
            Text(
              'Baskın Renk: $_dominantColor',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```


## 🪄 Farklı Renk Türlerini Kullanma

```dart
_paletteGenerator?.vibrantColor?.color
_paletteGenerator?.mutedColor?.color
_paletteGenerator?.darkVibrantColor?.color
_paletteGenerator?.lightMutedColor?.color

```
Bu renkleri kullanarak örneğin:


```dart
Container(
  color: _paletteGenerator?.vibrantColor?.color ?? Colors.blue,
  child: Text("Canlı renkli kutu"),
)

```


## ⚡ İpucu

Büyük resimlerde analiz yavaş olabilir. size parametresiyle hızlandırabilirsin:
```dart
size: Size(200, 100)
```


Network’ten gelen bir görseli de analiz edebilirsin:
```dart
await PaletteGenerator.fromImageProvider(
  NetworkImage('https://example.com/image.jpg'),
);
```
