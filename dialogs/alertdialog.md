# 📱 Flutter `showDialog` Kullanımı

## 🔍 `showDialog` Nedir?
`showDialog`, Flutter'da ekranda modal (kullanıcı etkileşimini bloke eden) bir pencere açmak için kullanılan bir fonksiyondur.  
Bu fonksiyon sayesinde **AlertDialog**, **basit Text**, veya kendi özel widget’larını gösterebilirsin.

---

## 🧩 Basit showDialog Örneği

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
      debugShowCheckedModeBanner: false,
      home: SimpleDialogExample(),
    );
  }
}

class SimpleDialogExample extends StatelessWidget {
  const SimpleDialogExample({super.key});

  // Basit bir metin dialogu gösteren fonksiyon
  void _showSimpleTextDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: Text(
            'Merhaba!',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basit showDialog Örneği'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showSimpleTextDialog(context),
          child: const Text('Dialog Göster'),
        ),
      ),
    );
  }
}

```
🧠 Açıklama:

ElevatedButton’a tıkladığında _showSimpleTextDialog fonksiyonu çalışır.

showDialog metodu ekranın üstüne yeni bir modal pencere (overlay) açar.

builder içinde sadece Text widget’ı döndürülür — bu nedenle sade bir “Merhaba!” yazısı görünür.

Arka plan varsayılan olarak yarı saydam siyah olur.

Kullanıcı dışarıya tıklayarak dialogu kapatabilir.


## 🧩 Basit AlertDialog Örneği

```dart
void _showMyDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Bilgilendirme'),
        content: const Text('Bu bir AlertDialog örneğidir.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Dialogu kapatır
            },
            child: const Text('Kapat'),
          ),
        ],
      );
    },
  );
}
```

# 📱 Flutter AlertDialog Kullanımı

## 🔍 AlertDialog Nedir?
`AlertDialog`, Flutter’da kullanıcıya bilgi vermek, onay istemek veya kısa bir işlem yaptırmak için kullanılan bir **popup (açılır pencere)** bileşenidir.  
Genellikle “Tamam / İptal” gibi düğmelerle birlikte kullanılır.

---

## 🧩 Basit Bir Örnek

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlertDialogExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AlertDialogExample extends StatelessWidget {
  void _showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Bilgilendirme'),
          content: const Text('Bu bir AlertDialog örneğidir.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Dialogu kapatır
              },
              child: const Text('Kapat'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AlertDialog Örneği')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showMyDialog(context),
          child: const Text('Alert Göster'),
        ),
      ),
    );
  }
}

```

⚙️ Parametrelerin Açıklaması

| Parametre           | Açıklama                                               |
| ------------------- | ------------------------------------------------------ |
| **title**           | Diyalog başlığını belirtir.                            |
| **content**         | Diyalog içeriğini (yazı, widget vb.) belirtir.         |
| **actions**         | Kullanıcının etkileşime girebileceği butonları içerir. |
| **shape**           | Diyalog kutusunun kenar biçimini belirler.             |
| **backgroundColor** | Diyalog arka plan rengini değiştirir.                  |
| **insetPadding**    | Ekranın kenarlarından boşluk bırakmak için kullanılır. |


💬 Onay (Evet / Hayır) Diyaloğu
```dart
void _showConfirmDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Emin misiniz?'),
        content: const Text('Bu işlemi geri alamazsınız.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              // İşlem onaylandı
              Navigator.pop(context);
            },
            child: const Text('Evet'),
          ),
        ],
      );
    },
  );
}
```
🧱 Özel Tasarımlı AlertDialog

`AlertDialog` içinde her tür widget kullanılabilir:

```dart
AlertDialog(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  title: const Text('Giriş Yap'),
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(decoration: InputDecoration(labelText: 'Kullanıcı Adı')),
      TextField(decoration: InputDecoration(labelText: 'Şifre')),
    ],
  ),
  actions: [
    TextButton(onPressed: () => Navigator.pop(context), child: const Text('İptal')),
    ElevatedButton(onPressed: () {}, child: const Text('Giriş')),
  ],
);
```

🧠 İpucu

`showDialog` asenkron çalışır. `await` ile kullanıcı cevabını bekleyebilirsin:

```dart
bool? sonuc = await showDialog<bool>(
  context: context,
  builder: (_) => AlertDialog(
    title: const Text('Onay'),
    content: const Text('Devam etmek istiyor musunuz?'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context, false),
        child: const Text('Hayır'),
      ),
      TextButton(
        onPressed: () => Navigator.pop(context, true),
        child: const Text('Evet'),
      ),
    ],
  ),
);

if (sonuc == true) {
  print('Kullanıcı onayladı.');
} else {
  print('Kullanıcı iptal etti.');
}
```

🧾 Özet

| Özellik      | Açıklama                                                     |
| ------------ | ------------------------------------------------------------ |
| Kullanımı    | `showDialog` fonksiyonu ile açılır.                          |
| Yapısı       | `AlertDialog` widget’ı ile oluşturulur.                      |
| Kapanma      | `Navigator.pop(context)` ile kapatılır.                      |
| Özelleştirme | İçerik, buton, renk, şekil gibi özellikler değiştirilebilir. |

🚀 Ekstra: Cupertino Tarzı (iOS Görünümü)
```dart
import 'package:flutter/cupertino.dart';

showCupertinoDialog(
  context: context,
  builder: (_) => CupertinoAlertDialog(
    title: const Text('Uyarı'),
    content: const Text('iOS tarzı bir diyalog örneği.'),
    actions: [
      CupertinoDialogAction(
        child: const Text('Tamam'),
        onPressed: () => Navigator.pop(context),
      ),
    ],
  ),
);
```
























