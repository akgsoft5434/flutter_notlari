# 🧩 TextField → controller Özelliği (Detaylı Anlatım)

## 📘 Tanım

`controller`, `TextField` içinde yazılan metni kontrol etmeyi sağlayan bir özelliktir.
Bu özellik `TextEditingController` sınıfı ile birlikte kullanılır.

```dart
final myController = TextEditingController();

TextField(
  controller: myController,
);
```

## 🧠 TextEditingController Nedir?

`TextEditingController`, `TextField` veya `TextFormField` gibi metin tabanlı widget’ların içerdiği metni yönetmek için kullanılan bir kontrol nesnesidir.

Bu sınıf sayesinde şunları yapabilirsin:

Kullanıcının yazdığı metni okuyabilirsin:

- Metin alanındaki içeriği programatik olarak değiştirebilirsin

- Dinleyici (listener) ekleyerek her değişikliği algılayabilirsin

- TextField’ı temizleyebilir veya varsayılan değer verebilirsin

### 🧾 En Basit Kullanım
```dart
final myController = TextEditingController();

TextField(
  controller: myController,
);
```

Bu şekilde TextField, myController üzerinden kontrol edilebilir hale gelir.

## 🔍 Controller ile Metni Okuma

Bir butona basıldığında veya bir olay gerçekleştiğinde kullanıcı tarafından girilen metni almak için:
```dart
ElevatedButton(
  onPressed: () {
    print(myController.text);
  },
  child: Text("Göster"),
)
```

🧩 Örnek çıktı:
```dart
Kullanıcının yazdığı metin
```
