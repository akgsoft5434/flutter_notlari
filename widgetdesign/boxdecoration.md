# 🎨 Flutter BoxDecoration — Tüm Detaylarıyla Rehber

BoxDecoration, Flutter’da Container, Box, Card gibi widget’ların arka planını (background), kenarlıklarını (border), köşe yuvarlamalarını (borderRadius), gölgelerini (boxShadow), ve hatta arka plan resimlerini (image) ayarlamak için kullanılan güçlü bir sınıftır.

---
## 🧩 Temel Kullanım

```dart
Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue, // Arka plan rengi
          ),
          child: Text(
            "Merhaba Flutter!",
            style: TextStyle(color: Colors.white),
          ),
        ),
      )
```
<img src="../assets/Screenshot_20251030_105816.png" width="250">

Açıklama:

`decoration` parametresi sadece Container içinde kullanılabilir.

`color, border, borderRadius, gradient, image, boxShadow, shape` gibi özellikleri vardır.
