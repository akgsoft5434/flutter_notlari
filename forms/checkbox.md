# 🟩 `CheckboxListTile` Widget

## 📘 Tanım

`CheckboxListTile`, Flutter'da bir onay kutusu (Checkbox) ile birlikte başlık, alt başlık ve isteğe bağlı bir simge gösterebilen bir widget’tır.

Kısacası, bir satır içinde checkbox + metin + ikon yerleştirmek için kullanılır.

## 🧩 Yapısı

Temel kullanım şekli şöyledir:

```dart
CheckboxListTile(
  title: Text('Bildirimleri aç'),
  value: _isChecked,
  onChanged: (bool? newValue) {
    setState(() {
      _isChecked = newValue!;
    });
  },
);
```

## ⚙️ Parametreler (Önemli Özellikler)
