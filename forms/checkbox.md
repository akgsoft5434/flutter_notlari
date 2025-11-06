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
