# 🧩 TextField Widget

`TextField`, Flutter'da kullanıcıdan metin girişi almak için kullanılan temel widget’tır.

Formlar, arama kutuları, kullanıcı adları, şifre alanları gibi birçok yerde kullanılır.

## 🔹 Temel Kullanım

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Kullanıcı Adı',
    hintText: 'Adınızı girin',
    border: OutlineInputBorder(),
  ),
)
```

## 🧠 Önemli Özellikler

### 1. keyboardType

Klavye türünü belirler. (örn. sayı girişi, e-posta, çok satırlı metin)


1. controller

Girilen metni okumak veya değiştirmek için kullanılır.

TextEditingController nesnesi gerekir.
