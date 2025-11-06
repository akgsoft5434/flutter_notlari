# RadioListTile Widget

`RadioListTile`, Flutter’da hem bir radio button (tekli seçim butonu) hem de yanında metin, ikon veya açıklama gösterebilen bir liste elemanı (list tile) bileşenidir.

Yani hem görsel olarak düzenli, hem de kullanıcı dostu bir yapı sağlar.

Radio widget’ının geliştirilmiş halidir diyebiliriz.

## 🧱 Yapısı

```dart
RadioListTile<T>(
  value: T,                     // Bu tile’ın değeri
  groupValue: T?,               // Grubun seçili değeri
  onChanged: ValueChanged<T?>?, // Seçim değiştiğinde ne olacak
  title: Widget?,               // Başlık (zorunlu değil)
  subtitle: Widget?,            // Alt başlık (opsiyonel)
  secondary: Widget?,           // Sağ tarafa ikon, resim ekleyebilirsin
  activeColor: Color?,          // Seçili olduğunda rengi
  selected: bool = false,       // Seçili olup olmadığını belirtir
  controlAffinity: ListTileControlAffinity?, // Radio butonunun konumu
)
```


## 📘 Temel Kullanım Örneği

Aşağıdaki örnekte bir “ödeme yöntemi” seçimi yapılmıştır 👇

```dart

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PaymentScreen()));
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedMethod = "💳 Kredi Kartı"; // Başlangıçta seçili değer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("💰 Ödeme Yöntemi Seç")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            RadioListTile<String>(
              value: "💳 Kredi Kartı",
              groupValue: _selectedMethod,
              activeColor: Colors.blueAccent,
              title: const Text("💳 Kredi Kartı"),
              subtitle: const Text("Banka veya kredi kartı ile ödeme yap"),
              secondary: const Icon(Icons.credit_card),
              onChanged: (value) {
                setState(() {
                  _selectedMethod = value;
                });
              },
            ),
            RadioListTile<String>(
              value: "💵 Nakit",
              groupValue: _selectedMethod,
              activeColor: Colors.green,
              title: const Text("💵 Nakit"),
              subtitle: const Text("Teslimatta elden ödeme"),
              secondary: const Icon(Icons.money),
              onChanged: (value) {
                setState(() {
                  _selectedMethod = value;
                });
              },
            ),
            RadioListTile<String>(
              value: "🏦 Havale / EFT",
              groupValue: _selectedMethod,
              activeColor: Colors.orange,
              title: const Text("🏦 Havale / EFT"),
              subtitle: const Text("Banka transferi ile ödeme yap"),
              secondary: const Icon(Icons.account_balance),
              onChanged: (value) {
                setState(() {
                  _selectedMethod = value;
                });
              },
            ),
            const SizedBox(height: 30),
            Text(
              "Seçilen yöntem: $_selectedMethod",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}


```

<img src="../assets/ezgif-8faabb9edcd700.gif" width="300">


🧩 Nasıl Çalışır?

`value:` Her bir RadioListTile’ın kendine özgü değeridir.

`groupValue:` Tüm RadioListTile’ların ortak paylaştığı değişken.

👉 Hangi value değeri bu değişkene eşitse, o seçili olur.

`onChanged:` Kullanıcı yeni bir seçim yaptığında çalışır.
