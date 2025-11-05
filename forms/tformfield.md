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

### 3. onSaved

Form kaydedildiğinde (örneğin formKey.currentState!.save() çağrıldığında) tetiklenir.

```dart
onSaved: (value) {
  print('Kaydedilen değer: $value');
},
```

### 4. decoration

`InputDecoration` ile görsel düzenleme yapılır.

```dart
decoration: InputDecoration(
  labelText: 'Şifre',
  hintText: 'Şifrenizi girin',
  border: OutlineInputBorder(),
  prefixIcon: Icon(Icons.lock),
),
```


### 5. onChanged ve onFieldSubmitted

`onChanged:` Her karakter yazıldığında çalışır

`onFieldSubmitted:` Klavyeden "Enter" (Done) tuşuna basıldığında çalışır.

```dart
onChanged: (value) => print('Yazıldı: $value'),
onFieldSubmitted: (value) => print('Gönderildi: $value'),
```


### 🧩 Örnek – Giriş Formu

```dart
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('E-posta: ${emailController.text}');
      print('Şifre: ${passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Giriş Formu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'E-posta'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'E-posta boş olamaz';
                  } else if (!value.contains('@')) {
                    return 'Geçerli bir e-posta girin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Şifre'),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'En az 6 karakter girin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Giriş Yap'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 🧾 Sık Kullanılan Özellikler Özeti

| Özellik            | Açıklama                      | Tip                           |
| ------------------ | ----------------------------- | ----------------------------- |
| `controller`       | Metin kontrolü sağlar         | `TextEditingController`       |
| `validator`        | Doğrulama yapar               | `Function(String?) → String?` |
| `onSaved`          | Form kaydedildiğinde çağrılır | `Function(String?)`           |
| `decoration`       | Görsel ayarlar                | `InputDecoration`             |
| `keyboardType`     | Klavye türü                   | `TextInputType`               |
| `obscureText`      | Metni gizler (şifre)          | `bool`                        |
| `onChanged`        | Her değişiklikte çalışır      | `Function(String)`            |
| `onFieldSubmitted` | Enter’a basıldığında çalışır  | `Function(String)`            |



