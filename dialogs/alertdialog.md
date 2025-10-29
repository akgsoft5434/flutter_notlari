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



