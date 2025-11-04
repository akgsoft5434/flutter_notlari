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

### 1. `keyboardType`

Klavye türünü belirler. (örn. sayı girişi, e-posta, çok satırlı metin)

```dart
TextField(
  keyboardType: TextInputType.emailAddress,
);
```

🧩 Örnekler:

- `TextInputType.text`

- `TextInputType.number`

- `TextInputType.emailAddress`

- `TextInputType.multiline`

- `TextInputType.phone`


### 2. `obscureText`

Metni gizler (şifre alanlarında kullanılır).
```dart
TextField(
  obscureText: true,
  decoration: InputDecoration(labelText: 'Şifre'),
);
```

### 3.`maxLength` ve `maxLines`

`maxLength:` Girilebilecek maksimum karakter sayısı.

`maxLines:` Satır sayısını belirler (örn. çok satırlı metin kutusu).
```dart
TextField(
  maxLength: 50,
  maxLines: 3,
);
```

### 4. `decoration`

Giriş alanının görünümünü özelleştirir.

`InputDecoration` sınıfı ile kullanılır.
```dart
TextField(
  decoration: InputDecoration(
    labelText: 'E-posta',
    hintText: 'E-posta adresinizi girin',
    prefixIcon: Icon(Icons.email),
    border: OutlineInputBorder(),
  ),
);
```

### 5. `controller`

Girilen metni okumak veya değiştirmek için kullanılır.

`TextEditingController` nesnesi gerekir.
```dart
final myController = TextEditingController();

TextField(
  controller: myController,
);

```
💡 myController.text ile kullanıcı tarafından girilen metni alabilirsin.
