# 🧩 TextFormField Widget

## 📘 Tanım

`TextFormField`, `TextField` widget’ının daha gelişmiş bir sürümüdür.

Farkı:

Form yapılarında (Form widget’ı içinde) kullanılmak üzere tasarlanmıştır.

Doğrulama (validation), kaydetme (save) ve form kontrolü (FormState) özelliklerini destekler.

### 🧠 TextField ile TextFormField Farkı

| Özellik                       | `TextField` | `TextFormField` |
| ----------------------------- | ----------- | --------------- |
| Form içinde kullanılabilirlik | ❌ Hayır     | ✅ Evet          |
| `validator` (doğrulama)       | ❌ Yok       | ✅ Var           |
| `onSaved`                     | ❌ Yok       | ✅ Var           |
| `Form` widget’ı ile çalışır   | ❌ Hayır     | ✅ Evet          |
| `FormState` üzerinden kontrol | ❌ Yok       | ✅ Var           |


🔹 Basit Kullanım

```dart
TextFormField(
  decoration: InputDecoration(
    labelText: 'E-posta',
    hintText: 'E-posta adresinizi girin',
    border: OutlineInputBorder(),
  ),
);
```

### 🧩 Form Yapısında Kullanımı

Genellikle Form widget’ı içinde kullanılır.

Form widget’ı, GlobalKey aracılığıyla tüm alanları birlikte yönetmeyi sağlar.

## 🧠 Önemli Özellikler

### 1. controller

TextField ile aynıdır.

Kullanıcının girdiği metni okumak veya değiştirmek için kullanılır.
```dart
final nameController = TextEditingController();

TextFormField(
  controller: nameController,
  decoration: InputDecoration(labelText: 'Adınız'),
);
```
### 2. validator

Form gönderilmeden önce girilen veriyi doğrular.
```dart
validator: (value) {
  if (value == null || value.isEmpty) {
    return 'Lütfen bu alanı doldurun';
  }
  if (value.length < 3) {
    return 'En az 3 karakter girin';
  }
  return null; // Doğruysa null döner
},
```

🔸 Eğer null döndürürsen, Flutter bu alanın “geçerli” olduğunu kabul eder.

🔸 Metin döndürürsen, bu metin hata mesajı olarak ekranda görünür.



