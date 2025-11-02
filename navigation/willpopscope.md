# 🔙 Flutter WillPopScope Nedir?

## 🧩 Tanım

`WillPopScope` → bir widget’tır.

Kullanıcının:

telefonun fiziksel geri tuşuna,

veya Navigator.pop(context) gibi geri gitme işlemlerine
bastığında önce sana sormasını sağlar.

Yani, “Bu sayfadan çıkmasına izin vereyim mi?”
gibi bir kontrol mekanizması kurabilirsin.

## 🧠 Kullanım Amacı

Kullanıcı sayfadan yanlışlıkla çıkmasın diye uyarı vermek.

Form doldururken “Kaydedilmemiş değişiklikler var” demek.

Ana sayfada geri tuşuna basınca uygulamayı hemen kapatmamak.

Geri tuşunu özelleştirmek (örneğin “çıkmak için iki kez bas” gibi).

## ⚙️ Kullanımı

```dart
WillPopScope(
  onWillPop: () async {
    // geri tuşuna basıldığında çalışır
    return true; // true => çıkışa izin ver, false => engelle
  },
  child: Scaffold(
    appBar: AppBar(title: Text("WillPopScope Örneği")),
    body: Center(child: Text("Geri tuşuna basmayı dene")),
  ),
)
```

### 📄 Örnek 1: Geri Tuşunu Engelleme
```dart
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: AnaSayfa()));

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Kullanıcının geri gitmesini engelle
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Bu sayfadan geri dönemezsin!")),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Ana Sayfa")),
        body: Center(
          child: Text("Geri tuşuna bas, ama çıkamayacaksın!"),
        ),
      ),
    );
  }
}
```
