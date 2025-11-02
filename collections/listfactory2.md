# 📚 Dart List Oluşturma Yöntemleri

Dart’ta List (liste), birden fazla değeri sıralı biçimde saklamamızı sağlar.
Aşağıda List.empty, List.filled, List.generate ve diğer oluşturma yöntemlerinin açıklamaları ve örnekleri yer almaktadır.

## 🧱 1. List.empty
```dart
List<E>.empty({ bool growable = false })
```

Boş bir liste oluşturur.

`growable = true` yapılırsa listeye sonradan eleman eklenebilir.

Varsayılan olarak `(growable: false)` sabit boyutludur ve değiştirilemez.

```dart
var a = List<int>.empty(); // Sabit boş liste
var b = List<String>.empty(growable: true);

b.add('merhaba'); // ✅
a.add(1);         // ❌ Hata: liste sabit boyutlu
```

💡 Not: `List.empty(growable: true)` genellikle [] ile aynı işlevi görür.

## 🧱 2. List.filled

```dart
List<E>.filled(int length, E fill, { bool growable = false })
```

Belirtilen uzunlukta bir liste oluşturur.

Tüm elemanlar fill değeriyle doldurulur.

growable = true yapılırsa listeye eleman eklenebilir.

```dart
var nums = List<int>.filled(4, 0);
print(nums); // [0, 0, 0, 0]

nums[1] = 5;
print(nums); // [0, 5, 0, 0]
```
⚠️ Dikkat — Mutable Referans Tuzak!

```dart
var inner = <int>[];
var matrix = List<List<int>>.filled(3, inner);

matrix[0].add(1);
print(matrix); // [[1], [1], [1]]  => Hepsi aynı referansı paylaşıyor!
```

✅ Doğru kullanım:

```dart
var matrix = List<List<int>>.generate(3, (_) => []);
matrix[0].add(1);
print(matrix); // [[1], [], []]
```

## 🧱 3. List.generate

```dart
List<E>.generate(int length, E generator(int index), { bool growable = false })
```

length kadar eleman üretir.

Her eleman generator(index) fonksiyonuyla oluşturulur.

Varsayılan olarak sabit boyutludur (growable: false).
```dart
// 0'dan 9’a kadar sayılar
var sayilar = List<int>.generate(10, (i) => i);
print(sayilar); // [0,1,2,3,4,5,6,7,8,9]

// İç içe boş listeler

var matris = List<List<int>>.generate(3, (_) => []);
matris[0].add(42);
print(matris); // [[42], [], []]
```
## 🧱 4. List.from

```dart
List<E>.from(Iterable elements, { bool growable = true })
```

Var olan bir Iterable (ör. başka liste, set) içeriğini kopyalar.

Yeni bir referans oluşturur (yani orijinal listeyle bağlantılı değildir).

```dart
var original = [1, 2, 3];
var copy = List<int>.from(original);

copy[0] = 99;
print(original); // [1, 2, 3]
print(copy);     // [99, 2, 3]
```

## 🧱 5. List.of

```dart
List<E>.of(Iterable<E> elements, { bool growable = true })
```

List.from ile neredeyse aynıdır,
ancak tip güvenliği (type safety) açısından tercih edilir.

```dart
var cities = ['Ankara', 'İzmir', 'İstanbul'];
var copy = List<String>.of(cities, growable: false);
print(copy); // [Ankara, İzmir, İstanbul]
```

## 🧱 6. List.unmodifiable

```dart
List<E>.unmodifiable(Iterable elements)
```

Kopyalanan listeyi salt okunur hale getirir.

Sonradan eleman ekleme veya silme girişiminde hata verir.

```dart
var list = List.unmodifiable([1, 2, 3]);
list.add(4); // ❌ UnsupportedError
```

Kullanım amacı: Dışarıya liste dönerken verinin değiştirilememesini sağlamak.

## 🧱 7. const Listeler

```dart
const sabitListe = ['A', 'B', 'C'];
```

Derleme (compile-time) sabitidir.

Hiçbir şekilde değiştirilemez.

Performans ve güvenlik açısından avantajlıdır.

```dart
const renkler = ['Kırmızı', 'Mavi'];
// renkler.add('Yeşil'); ❌ Derleme hatası
```

## 🧱 8. Kopyalama ve Birleştirme
Kopyalama

```dart
var liste = [1, 2, 3];
var kopya1 = List.of(liste);
var kopya2 = [...liste]; // Spread operatörü
```
Birleştirme

```dart
var liste1 = [1, 2, 3];
var liste2 = [4, 5, 6];
var birlesik = [...liste1, ...liste2];
print(birlesik); // [1, 2, 3, 4, 5, 6]
```


## 🧱 9. Özet Tablo

| Yapı                         | Açıklama                            | Büyüyebilir mi? | Değiştirilebilir mi? |
| ---------------------------- | ----------------------------------- | --------------- | -------------------- |
| `List.empty()`               | Boş liste oluşturur                 | ❌ (varsayılan)  | ❌                    |
| `List.empty(growable: true)` | Boş ama eklenebilir                 | ✅               | ✅                    |
| `List.filled()`              | Sabit uzunluk, aynı değerlerle dolu | ❌ (varsayılan)  | ✅                    |
| `List.generate()`            | Fonksiyonla dinamik üretim          | ❌ (varsayılan)  | ✅                    |
| `List.from()`                | Başka listeden kopya                | ✅               | ✅                    |
| `List.of()`                  | Tip güvenli kopya                   | ✅               | ✅                    |
| `List.unmodifiable()`        | Salt okunur kopya                   | ❌               | ❌                    |
| `const []`                   | Derleme zamanı sabiti               | ❌               | ❌                    |


## 🧱 10. Örnek Uygulama

```dart
void main() {
  // empty
  var a = List<int>.empty(growable: true);
  a.add(10);

  // filled
  var b = List<String>.filled(3, 'x');
  print(b); // [x, x, x]

  // generate
  var c = List<int>.generate(5, (i) => i * 2);
  print(c); // [0, 2, 4, 6, 8]

  // from / of / unmodifiable
  var d = List.of([1, 2, 3]);
  var e = List.unmodifiable([4, 5, 6]);

  print(d); // [1, 2, 3]
  print(e); // [4, 5, 6]
}
```
🧩 Ne Zaman Hangisini Kullanmalı?

| İhtiyaç                              | Kullanılacak Yapı                      |
| ------------------------------------ | -------------------------------------- |
| Boş ve sonradan dolacak liste        | `[]` veya `List.empty(growable: true)` |
| Sabit uzunluk, aynı başlangıç değeri | `List.filled()`                        |
| Her eleman özel hesaplanacaksa       | `List.generate()`                      |
| Var olan listeden kopya              | `List.of()`                            |
| Değiştirilemez liste                 | `List.unmodifiable()`                  |
| Tam sabit (compile-time) liste       | `const`                                |

