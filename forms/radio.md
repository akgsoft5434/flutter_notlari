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

enum PaymentMethod { krediKarti, nakit, havale }

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod? _seciliYontem = PaymentMethod.krediKarti;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ödeme Yöntemi Seç")),
      body: Column(
        children: [
          RadioListTile<PaymentMethod>(
            title: const Text('Kredi Kartı'),
            value: PaymentMethod.krediKarti,
            groupValue: _seciliYontem,
            onChanged: (value) {
              setState(() {
                _seciliYontem = value;
              });
            },
          ),
          RadioListTile<PaymentMethod>(
            title: const Text('Nakit'),
            value: PaymentMethod.nakit,
            groupValue: _seciliYontem,
            onChanged: (value) {
              setState(() {
                _seciliYontem = value;
              });
            },
          ),
          RadioListTile<PaymentMethod>(
            title: const Text('Havale / EFT'),
            value: PaymentMethod.havale,
            groupValue: _seciliYontem,
            onChanged: (value) {
              setState(() {
                _seciliYontem = value;
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            "Seçili yöntem: ${_seciliYontem.toString().split('.').last}",
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
```
