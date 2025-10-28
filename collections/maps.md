# 🗺️ Dart’ta Map

Dart’ta Map, anahtar-değer (key-value) çiftlerinden oluşan bir koleksiyondur.

Her anahtar (key) benzersiz olmalıdır.

Her anahtarın bir değeri (value) vardır.

Listeler ve Setlerden farkı, elemanlara anahtarla erişilmesidir.

## 🔹 1. Map Oluşturma
### a) Doğrudan Süslü Parantezlerle
```dart
void main() {
  Map<String, int> yaslar = {
    'Ali': 25,
    'Ayşe': 30,
    'Mehmet': 20
  };

  print(yaslar); // {Ali: 25, Ayşe: 30, Mehmet: 20}
}
```
### b) Boş Map Oluşturma
```dart
void main() {
  Map<String, String> sozluk = {};
  sozluk['Dart'] = 'Programlama Dili';
  print(sozluk); // {Dart: Programlama Dili}
}
```

### c) Dynamic Map Oluşturma
```dart
void main() {
  // dynamic tipli Map
  Map<dynamic, dynamic> karisikMap = {
    'isim': 'Ali',       // String anahtar, String değer
    1: 100,              // int anahtar, int değer
    true: 'Doğru mu?',   // bool anahtar, String değer
    3.14: [1, 2, 3],     // double anahtar, List değer
  };

  print(karisikMap); // {isim: Ali, 1: 100, true: Doğru mu?, 3.14: [1, 2, 3]}

}

```
🔹 Örnek Kullanım

Dynamic Map, farklı tiplerde veri saklaman gerektiğinde veya JSON verilerini map olarak tutarken çok kullanışlıdır:

```dart
void main() {
  Map<dynamic, dynamic> kullanici = {
    'id': 1,
    'isim': 'Ali',
    'yas': 25,
    'aktif': true,
    'roller': ['admin', 'kullanici']
  };

  print(kullanici); // {id: 1, isim: Ali, yas: 25, aktif: true, roller: [admin, kullanici]}
  print(kullanici['isim']); // Ali
  print(kullanici['id']);      // 1
}
```


## 🔹 2. Map’e Eleman Ekleme ve Güncelleme
```dart
void main() {
  Map<String, int> yaslar = {'Ali': 25};

  // Eleman ekleme
  yaslar['Ayşe'] = 30;

  // Mevcut elemanı güncelleme
  yaslar['Ali'] = 26;

  print(yaslar); // {Ali: 26, Ayşe: 30}
}
```
## 🔹 3. Map’ten Eleman Silme
```dart
void main() {
  Map<String, String> telefonRehberi = {
    'Ali': '555-1111',
    'Ayşe': '555-2222'
  };

  telefonRehberi.remove('Ali');
  print(telefonRehberi); // {Ayşe: 555-2222}

  telefonRehberi.clear();
  print(telefonRehberi); // {}
}
```
## 🔹 4. Map Özellikleri ve Metotları
| Metot / Özellik            | Açıklama                     |
| -------------------------- | ---------------------------- |
| `.length`                  | Eleman sayısını döndürür     |
| `.isEmpty` / `.isNotEmpty` | Boşluk kontrolü              |
| `.keys`                    | Anahtarları döndürür         |
| `.values`                  | Değerleri döndürür           |
| `.containsKey(k)`          | Anahtar var mı?              |
| `.containsValue(v)`        | Değer var mı?                |
| `.remove(k)`               | Anahtara göre siler          |
| `.clear()`                 | Tüm elemanları siler         |
| `.update(k, f)`            | Anahtarın değerini günceller |
| `.putIfAbsent(k, f)`       | Eğer anahtar yoksa ekler     |


## 🔹 5. Map Elemanlarına Erişim
```dart
void main() {
  Map<String, int> yaslar = {'Ali': 25, 'Ayşe': 30};

  print(yaslar['Ali']);   // 25
  print(yaslar['Mehmet']); // null (mevcut değil)
}
```
## 🔹 6. Map Döngüyle Gezme
a) Anahtarlar Üzerinden
```dart
void main() {
  Map<String, int> yaslar = {'Ali': 25, 'Ayşe': 30};

  for (var key in yaslar.keys) {
    print('$key: ${yaslar[key]}');
  }
}
```
b) Değerler Üzerinden
```dart
void main() {
  Map<String, int> yaslar = {'Ali': 25, 'Ayşe': 30};

  for (var value in yaslar.values) {
    print(value);
  }
}
```
c) Key-Value Çiftleri Üzerinden
```dart
void main() {
  Map<String, int> yaslar = {'Ali': 25, 'Ayşe': 30};

  yaslar.forEach((key, value) {
    print('$key: $value');
  });
}
```
## 🔹 7. Map Güncelleme ve Koşullu Ekleme
a) update()
```dart
void main() {
  Map<String, int> yaslar = {'Ali': 25};

  yaslar.update('Ali', (value) => value + 1);
  print(yaslar); // {Ali: 26}
}
```
b) putIfAbsent()
```dart
void main() {
  Map<String, int> yaslar = {'Ali': 25};

  yaslar.putIfAbsent('Ayşe', () => 30);
  print(yaslar); // {Ali: 25, Ayşe: 30}

  yaslar.putIfAbsent('Ali', () => 100); // Var olan değeri değiştirmez
  print(yaslar); // {Ali: 25, Ayşe: 30}
}
```
## 🔹 8. Map Kopyalama ve Dönüşümler
Map → List (Anahtarlar)
```dart
void main() {
  Map<String, int> yaslar = {'Ali': 25, 'Ayşe': 30};
  List<String> anahtarlar = yaslar.keys.toList();
  print(anahtarlar); // [Ali, Ayşe]
}
```
Map → List (Değerler)
```dart
void main() {
  Map<String, int> yaslar = {'Ali': 25, 'Ayşe': 30};
  List<int> degerler = yaslar.values.toList();
  print(degerler); // [25, 30]
}
```
## 🔹 9. Map ve Null-Safe Kullanım
```dart
void main() {
  Map<String, int>? yaslar;
  var yeniMap = {...?yaslar, 'Ali': 25};
  print(yeniMap); // {Ali: 25}
}
```
## 🔹 10. Örnek Kullanım Senaryoları

Kullanıcı bilgilerini saklamak: {id: 1, isim: 'Ali', yas: 25}

E-posta ve telefon rehberi gibi anahtar-değer yapıları

Sıklık tabloları, sayaçlar ve konfigürasyon verileri
```dart
void main() {
  Map<String, int> kelimeSayaci = {};
  List<String> kelimeler = ['Dart', 'Flutter', 'Dart'];

  for (var kelime in kelimeler) {
    kelimeSayaci.update(kelime, (value) => value + 1, ifAbsent: () => 1);
  }

  print(kelimeSayaci); // {Dart: 2, Flutter: 1}
}

```


[⬅ Ana Sayfaya Dön](../README.md)
