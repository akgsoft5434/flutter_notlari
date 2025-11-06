# 🟩 `CheckboxListTile` Widget

## 📘 Tanım

`CheckboxListTile`, Flutter'da bir onay kutusu (Checkbox) ile birlikte başlık, alt başlık ve isteğe bağlı bir simge gösterebilen bir widget’tır.

Kısacası, bir satır içinde checkbox + metin + ikon yerleştirmek için kullanılır.

## 🧩 Örnek

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form Elemanları"),
          backgroundColor: Colors.orange.shade200,
        ),
        body: Column(
          children: [
            CheckboxListTile(
              title: Text("Başlık"),
              value: _isChecked,
              subtitle: Text("Alt Başlık"),
              checkColor: Colors.red,
              activeColor: Colors.orange,
              secondary: Icon(Icons.add_alarm),
              onChanged: (_secilendeger) {
                setState(() {
                  _isChecked = _secilendeger!;
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

<img src="../assets/ezgif-87852872f70f24.gif" width="300">

## ⚙️ Parametreler (Önemli Özellikler)

| Parametre           | Tip                       | Açıklama                                                      |
| ------------------- | ------------------------- | ------------------------------------------------------------- |
| **value**           | `bool`                    | Checkbox’ın seçili olup olmadığını belirtir.                  |
| **onChanged**       | `Function(bool?)?`        | Kullanıcı tıkladığında çağrılan fonksiyon. Değeri değiştirir. |
| **title**           | `Widget?`                 | Checkbox’ın yanında gösterilen ana metin.                     |
| **subtitle**        | `Widget?`                 | Alt başlık (isteğe bağlı).                                    |
| **secondary**       | `Widget?`                 | Satırın başına veya sonuna simge ekler.                       |
| **isThreeLine**     | `bool`                    | `true` olursa, alt başlık üçüncü satırda gösterilir.          |
| **controlAffinity** | `ListTileControlAffinity` | Checkbox’ın başta mı sonda mı görüneceğini belirler.          |
| **activeColor**     | `Color?`                  | Checkbox işaretliyken rengi.                                  |
| **checkColor**      | `Color?`                  | Tik (✓) işaretinin rengi.                                     |
| **tileColor**       | `Color?`                  | Tüm satırın arka plan rengi.                                  |
| **selected**        | `bool`                    | `true` olursa yazı stili vurgulanır (örneğin, kalın yazı).    |
| **dense**           | `bool`                    | Daha dar bir görünüm sağlar.                                  |


## 🧠 Kullanım Mantığı

`CheckboxListTile` genellikle bir durum değişkeni (state) ile birlikte kullanılır.

Örneğin bir bool değişken, seçili olup olmadığını takip eder:

`bool _isChecked = false;`


Daha sonra `setState()` içinde değeri güncelleriz.Bu, Flutter’a arayüzü yeniden çizmesi gerektiğini söyler.

## 🧠 Checkbox’ın Konumunu Değiştirme

```dart
CheckboxListTile(
  title: Text("Koyu Tema"),
  value: _darkMode,
  controlAffinity: ListTileControlAffinity.leading, // Checkbox başa alındı
  onChanged: (bool? newValue) {
    setState(() {
      _darkMode = newValue!;
    });
  },
);
```

📋 Açıklama:

`controlAffinity: ListTileControlAffinity.leading` → Checkbox başta görünür.

trailing efekti yerine geçer.

## 💡 Birden Fazla Checkbox Kullanımı
```dart
bool _music = false;
bool _sports = false;
bool _movies = false;
```


```dart
Column(
  children: [
    CheckboxListTile(
      title: Text("Müzik"),
      value: _music,
      onChanged: (value) {
        setState(() => _music = value!);
      },
    ),
    CheckboxListTile(
      title: Text("Spor"),
      value: _sports,
      onChanged: (value) {
        setState(() => _sports = value!);
      },
    ),
    CheckboxListTile(
      title: Text("Filmler"),
      value: _movies,
      onChanged: (value) {
        setState(() => _movies = value!);
      },
    ),
  ],
);
```

📋 Açıklama:

Kullanıcı birden fazla seçeneği aynı anda işaretleyebilir.

Her biri farklı bir bool değişkenle yönetilir.

## ⚠️ Dikkat Edilmesi Gerekenler

`onChanged` null ise Checkbox pasif (devre dışı) görünür.

value değişkeni null olamaz — başlangıçta false vermek gerekir.

State yönetimi unutulmamalıdır (örn: setState, Provider, Bloc vb.).
