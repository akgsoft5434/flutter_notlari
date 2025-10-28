# 🏗️ Dart List Fabrika Yapıları
Dart dilinde List sınıfı, farklı ihtiyaçlara göre optimize edilmiş çeşitli fabrika yapıları sunar. Bu döküman, Dart'ta liste üretimi için kullanılan fabrika constructor'larını detaylıca açıklar.

## 📚 İçindekiler
- [List.filled](#1-listfilled)
- [List.generate](#2-listgenerate)
- [List.unmodifiable](#3-listunmodifiable)
- [List.empty](#4-listempty)
- [List.from](#5-listfrom)
- [List.of](#6-listof)
- [List.castFrom](#7-listcastfrom)
- [Kullanım Senaryoları](#🎯-ne-zaman-hangi-yapı-kullanılır)


Kullanım Senaryoları

## 1. List.filled(int length, E fill, {bool growable = false})
Belirli bir uzunlukta, aynı öğeyle doldurulmuş bir liste oluşturur.

dart
var sabitListe = List.filled(5, 0); // [0, 0, 0, 0, 0]
growable: true → Listeye sonradan eleman eklenebilir.

Tüm elemanlar aynı referansa sahipse dikkatli olunmalı (özellikle nesnelerde).

## 2. List.generate(int length, E generator(int index), {bool growable = true})
Her elemanı bir fonksiyonla oluşturarak liste üretir.

dart
var kareler = List.generate(5, (i) => i * i); // [0, 1, 4, 9, 16]
Dinamik içerik üretimi için idealdir.

growable parametresi ile genişletilebilirlik kontrol edilir.

## 3. List.unmodifiable(Iterable elements)
Değiştirilemez (immutable) bir liste oluşturur.

dart
var sabit = List.unmodifiable([1, 2, 3]);
// sabit.add(4); // Hata verir
Güvenli veri paylaşımı için kullanılır.

Performans açısından sabit veri yapılarında tercih edilir.

## 4. List.empty({bool growable = false})
Boş bir liste oluşturur.

dart
var bos = List.empty(growable: true);
bos.add(1); // [1]
growable: false ise sabit uzunlukta boş liste olur (ekleme yapılamaz).

## 5. List.from(Iterable elements, {bool growable = true})
Var olan bir iterable’dan yeni bir liste oluşturur.

dart
var orijinal = [1, 2, 3];
var kopya = List.from(orijinal);
Derin kopya değildir; referanslar korunur.

growable ile genişletilebilirlik ayarlanabilir.

## 6. List.of(Iterable<E> elements, {bool growable = true})
List.from ile aynıdır, ancak daha semantik bir alternatiftir.

dart
var yeni = List.of([10, 20, 30]);
Daha okunabilir kod için tercih edilebilir.

## 7. List.castFrom<S, T>(List<S> source)
Bir listeyi farklı türdeki listeye dönüştürür (runtime'da).

dart
List<dynamic> karisik = [1, 2, 3];
List<int> sayilar = List.castFrom<dynamic, int>(karisik);
Tip güvenliği sağlar.

as operatörüne göre daha kontrollüdür.

# 🎯 Ne Zaman Hangi Yapı Kullanılır?


Senaryo	Kullanılacak Fabrika
Sabit uzunlukta, aynı değerle dolu liste	List.filled
Dinamik içerik üretimi	List.generate
Değiştirilemez liste	List.unmodifiable
Boş ama genişletilebilir liste	List.empty(growable: true)
Mevcut iterable’dan kopya	List.from veya List.of
Tip dönüşümü	List.castFrom

# 📌 Notlar
List.generate ile dinamik veri üretimi (örneğin anket soruları) kolayca yapılabilir.

List.unmodifiable sabit seçenekler tanımlamak için idealdir.

List.castFrom ile runtime'da güvenli tip dönüşümleri sağlanabilir.
