# 📗 Dart’ta Set Yapısı

Dart’ta Set, eşsiz (unique) elemanlardan oluşan koleksiyon yapısıdır.
Listelerden farkı, bir Set’in aynı elemanı birden fazla kez tutmamasıdır.

## 🔹 1. Set Nedir?

Tanım: Eşsiz elemanlardan oluşan bir koleksiyon.

Sıralama: Dart’ta standart Set sıralı değildir.

Eleman tekrarını engeller.
```dart
void main() {
  Set<String> meyveler = {'Elma', 'Armut', 'Muz', 'Elma'};
  print(meyveler); // Çıktı: {Elma, Armut, Muz}
}
```

Elma sadece bir kez eklenir.

## 🔹 2. Set Oluşturma Yöntemleri
a) Doğrudan Küme İşaretleriyle

```dart
void main() {
  Set<int> sayilar = {1, 2, 3};
  print(sayilar); // {1, 2, 3}
}
```
b) Boş Set Oluşturma

Boş {} ifadesi Map olarak kabul edilir. Boş Set için Set<T>() kullanılır.
```dart
void main() {
  Set<String> bosSet = Set();
  bosSet.add('Yeni Eleman');
  print(bosSet); // {Yeni Eleman}
}
```
## 🔹 3. Set’e Eleman Ekleme
```dart
void main() {
  Set<int> sayilar = {1, 2};
  
  sayilar.add(3);
  sayilar.addAll([4, 5, 5]); // Tekrar eden eleman eklenmez

  print(sayilar); // {1, 2, 3, 4, 5}
}
```
## 🔹 4. Set’ten Eleman Silme
```dart
void main() {
  Set<String> meyveler = {'Elma', 'Armut', 'Muz'};

  meyveler.remove('Armut');
  print(meyveler); // {Elma, Muz}

  meyveler.clear();
  print(meyveler); // {}
}
```
## 🔹 5. Set Özellikleri
| Özellik / Metot            | Açıklama               |
| -------------------------- | ---------------------- |
| `.length`                  | Eleman sayısını verir  |
| `.isEmpty` / `.isNotEmpty` | Boşluk kontrolü        |
| `.contains(x)`             | x elemanı var mı?      |
| `.add(x)` / `.addAll()`    | Eleman ekler           |
| `.remove(x)`               | Eleman siler           |
| `.clear()`                 | Tüm elemanları siler   |
| `.union(Set)`              | İki Set’i birleştirir  |
| `.intersection(Set)`       | Ortak elemanları alır  |
| `.difference(Set)`         | Farklı elemanları alır |


## 🔹 6. Set Döngüyle Gezme
```dart
void main() {
  Set<String> renkler = {'Kırmızı', 'Yeşil', 'Mavi'};
```
  // For-in ile
```dart
  for (var renk in renkler) {
    print(renk);
  }
```
  // forEach ile
```dart
  renkler.forEach((renk) => print(renk));
}
```
## 🔹 7. Set İşlemleri
a) Birleştirme (union)
```dart
void main() {
  Set<int> a = {1, 2, 3};
  Set<int> b = {3, 4, 5};
  
  var birlesik = a.union(b);
  print(birlesik); // {1, 2, 3, 4, 5}
}
```
b) Kesişim (intersection)
```dart
void main() {
  Set<int> a = {1, 2, 3};
  Set<int> b = {2, 3, 4};

  var ortak = a.intersection(b);
  print(ortak); // {2, 3}
}
```
c) Fark (difference)
```dart
void main() {
  Set<int> a = {1, 2, 3};
  Set<int> b = {2, 3, 4};

  var fark = a.difference(b);
  print(fark); // {1}
}
```
## 🔹 8. Set ve List Dönüşümleri
Set → List
```dart
void main() {
  Set<int> sayilar = {1, 2, 3};
  List<int> liste = sayilar.toList();
  print(liste); // [1, 2, 3]
}
```
List → Set
```dart
void main() {
  List<int> liste = [1, 2, 2, 3, 3];
  Set<int> set = liste.toSet();
  print(set); // {1, 2, 3}
}
```
## 🔹 9. Set ile Null-Safe Kullanım
```dart
void main() {
  Set<int>? sayilar;
  var bosSet = {...?sayilar, 1, 2}; 
  print(bosSet); // {1, 2}
}
```
## 🔹 10. Örnek Kullanım Senaryoları

Eşsiz değerler (ID, isim, e-posta) saklamak için.

Tekrarlayan verileri temizlemek için.

Kesişim, fark ve birleşim işlemleri gerektiren durumlar.
```dart
void main() {
  List<int> tumSayilar = [1, 2, 2, 3, 4, 4, 5];
  Set<int> benzersiz = tumSayilar.toSet();
  print(benzersiz); // {1, 2, 3, 4, 5}
}
```
