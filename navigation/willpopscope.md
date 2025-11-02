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

✅ Sonuç:
Geri tuşuna basıldığında sayfa kapanmaz, sadece mesaj görünür.

### 📄 Örnek 2: Çıkmadan Önce Onay İsteme (AlertDialog)

```dart

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: OnaySayfa()));

class OnaySayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool cikilsinMi = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Çıkmak istiyor musun?"),
            content: Text("Kaydedilmemiş değişiklikler kaybolacak."),
            actions: [
              TextButton(
                child: Text("Hayır"),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: Text("Evet"),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        );
        return cikilsinMi; // true => çık, false => kal
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Onaylı Çıkış")),
        body: Center(child: Text("Geri tuşuna bas ve uyarıyı gör.")),
      ),
    );
  }
}
```

✅ Sonuç:
Geri tuşuna basıldığında kullanıcıdan onay ister.
"Evet" → sayfa kapanır,
"Hayır" → sayfa kalır.

## 🧩 Parametreler

| Parametre   | Tür            | Açıklama                                                                          |
| ----------- | -------------- | --------------------------------------------------------------------------------- |
| `onWillPop` | `Future<bool>` | Geri tuşuna basıldığında çağrılır. `true` dönerse çıkılır, `false` dönerse kalır. |
| `child`     | `Widget`       | Sayfanın içeriği (örneğin Scaffold).                                              |


## ⚙️ Teknik Detay

`WillPopScope`, `Navigator`’ın pop işlemini yakalar.

Eğer `onWillPop`’dan false dönerse, `Navigator.pop` iptal edilir.

Sadece en üstteki route için geçerlidir.


🧾 Özet

| Kullanım Amacı                | Kod / Açıklama                   |
| ----------------------------- | -------------------------------- |
| Geri tuşunu engellemek        | `return false;`                  |
| Onay penceresi göstermek      | `showDialog` ile kullanıcıya sor |
| Sayfayı kapatmaya izin vermek | `return true;`                   |



# 🧭 Flutter Navigator.maybePop() Nedir?

## 🧩 Tanım

`Navigator.maybePop()` metodu, geri gitmeyi (pop) deneyen, ama önce kontrol eden bir fonksiyondur.

Yani:

“Eğer geri gidilebilecek bir sayfa varsa git, yoksa hiçbir şey yapma (hata verme).”

## ⚙️ Temel Kullanım
```dart
Navigator.maybePop(context);
```


🔍 Farkı Nedir?

| Metot                         | Ne yapar?                                                                        |
| ----------------------------- | -------------------------------------------------------------------------------- |
| `Navigator.pop(context)`      | Her zaman geri gitmeye çalışır. Eğer `pop` yapılacak sayfa yoksa **hata verir.** |
| `Navigator.maybePop(context)` | Eğer geri gidilebilecek sayfa varsa **geri gider**, yoksa **hiçbir şey yapmaz.** |


📄 Örnek 1: Güvenli Geri Dönüş


```dart
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: AnaSayfa()));

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ana Sayfa")),
      body: Center(
        child: ElevatedButton(
          child: Text("Detay Sayfasına Git"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetaySayfa()),
            );
          },
        ),
      ),
    );
  }
}

class DetaySayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay Sayfası"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.maybePop(context); // güvenli pop
          },
        ),
      ),
      body: Center(child: Text("Geri tuşu güvenli çalışır.")),
    );
  }
}
```


🧠 Açıklama:

Eğer bu sayfa push ile açılmışsa, maybePop() geri döner.

Eğer doğrudan home: olarak açılmışsa, geri gidilecek sayfa yoksa hiçbir şey yapmaz — hata da verme


📄 Örnek 2: Geri Dönme Yerine Bir İşlem Yapma

Bazen ana sayfada geri tuşu yerine uyarı göstermek istersin.

```dart
onPressed: () async {
  bool popped = await Navigator.maybePop(context);

  if (!popped) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Zaten ana sayfadasın!")),
    );
  }
}

```
🧠 Açıklama:

maybePop bir Future<bool> döner.

true → geri gidildi

false → geri gidilemedi (örneğin zaten ana sayfadasın)

🧩 Özet

| Özellik       | Açıklama                                        |
| ------------- | ----------------------------------------------- |
| Metot         | `Navigator.maybePop(context)`                   |
| Dönüş tipi    | `Future<bool>`                                  |
| `true` döner  | Eğer geri gidildiyse                            |
| `false` döner | Geri gidilecek sayfa yoksa                      |
| Avantajı      | Hata vermeden güvenli şekilde geri gitme sağlar |


