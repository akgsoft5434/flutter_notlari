# 🎚️ Slider Widget

`Slider`, Flutter’da tek bir eksen üzerinde (genellikle yatay) kaydırılabilir bir kontrol elemanıdır.

Kullanıcı, parmağını veya fareyi kullanarak bir “thumb” (kaydırma topu) sürükleyerek bir değeri seçer.

## 🧩 Temel Kullanım

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
      home: SliderExample(),
    );
  }
}

class SliderExample extends StatefulWidget {
  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Slider Örneği")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Seçilen Değer: ${_currentValue.toStringAsFixed(1)}",
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              value: _currentValue,
              min: 0,
              max: 100,
              divisions: 10, // 10 adımlı bölme (isteğe bağlı)
              label: _currentValue.round().toString(), // üstte gösterilen etiket
              activeColor: Colors.blue, // dolu kısım rengi
              inactiveColor: Colors.grey, // boş kısım rengi
              onChanged: (double value) {
                setState(() {
                  _currentValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
```


### ⚙️ Önemli Parametreler

| Parametre       | Açıklama                                                           |
| --------------- | ------------------------------------------------------------------ |
| `value`         | Slider’ın o anki değeri                                            |
| `min`           | Minimum değer                                                      |
| `max`           | Maksimum değer                                                     |
| `divisions`     | Slider’ı bölmelere ayırır (örneğin 10 = her biri 10’luk aralıklar) |
| `label`         | Değerin üstünde çıkan küçük bilgi etiketi                          |
| `activeColor`   | Seçilen (dolu) kısmın rengi                                        |
| `inactiveColor` | Boş kısmın rengi                                                   |
| `onChanged`     | Kullanıcı değeri değiştirdiğinde çalışır                           |
| `onChangeStart` | Kullanıcı sürüklemeye başladığında çalışır                         |
| `onChangeEnd`   | Kullanıcı sürüklemeyi bitirdiğinde çalışır                         |



