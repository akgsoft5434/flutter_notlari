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


### 6. `textInputAction`

Klavyedeki “Enter” tuşunun işlevini değiştirir. (örn. “next”, “done”, “search”)
```dart
TextField(
  textInputAction: TextInputAction.search,
);
```
### 7. `style`

Yazı tipi, rengi ve boyutunu özelleştirir.
```dart
TextField(
  style: TextStyle(color: Colors.blue, fontSize: 18),
);
```

### 8. `enabled`

`false` yapılırsa metin alanı devre dışı kalır.

```dart
TextField(
  enabled: false,
);
```

### 9. `readOnly`

Metin alanı sadece okunabilir olur (düzenleme yapılamaz).

```dart
TextField(
  readOnly: true,
  controller: TextEditingController(text: "Sadece okunabilir"),
);
```
### 10. `cursorColor`, `cursorWidth`

İmleç (cursor) rengini ve kalınlığını değiştirir.

```dart
TextField(
  cursorColor: Colors.red,
  cursorWidth: 3,
);
```

6. `onChanged`, `onSubmitted`

`onChanged:` Kullanıcı her yazdığında tetiklenir.

`onSubmitted:` Kullanıcı klavyeden “Enter” tuşuna bastığında tetiklenir.

```dart
TextField(
  onChanged: (value) {
    print('Yazılan: $value');
  },
  onSubmitted: (value) {
    print('Gönderilen: $value');
  },
);
```
