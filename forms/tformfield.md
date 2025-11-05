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

void main() {
  runApp(LoginForm());
}

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


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Giriş Formu')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'E-posta',
                    border: OutlineInputBorder(),
                  ),
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
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'En az 6 karakter girin';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      print('E-posta: ${emailController.text}');
                      print('Şifre: ${passwordController.text}');
                    }
                  },
                  child: Text('Giriş Yap'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```

<img src="../assets/ezgif-106e42c0d2367b.gif" width="300">


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


## ⚙️ FormState ile Kullanımı

Formu kontrol etmek için:
```dart
_formKey.currentState!.validate(); // Tüm validator’ları çalıştırır
_formKey.currentState!.save(); // onSaved metodlarını çalıştırır
_formKey.currentState!.reset(); // Formu sıfırlar
```

## 🎯 Sonuç

Özellik	Ne İşe Yarar

- `TextFormField`	Form içinde metin girişleri için gelişmiş widget
- `validator`	Hatalı girişleri önler
- `controller`	Metin kontrolü sağlar
- `onSaved`	Form kaydedildiğinde değerleri işler
- `FormState`	Tüm formu yönetir
- `GlobalKey<FormState>`	Form’a erişimi sağlar



## 🧩 FormKey Nedir?

`FormKey`, bir formu tanımlamak ve kontrol etmek için kullanılır.

Flutter’da `TextFormField` bileşenlerini tek bir form içinde yönetebilmek, ve formun doğrulamasını (validation) ya da kaydetme işlemini (save) yapabilmek için gereklidir.

### 🔑 Temel Mantık

Flutter’da bir Form widget’ı kullanıldığında, onun benzersiz bir anahtarı (key) olmalıdır.

Bu key sayesinde:

Formun geçerli (valid) olup olmadığını kontrol edebilirsin.

Formdaki tüm alanları kaydedebilirsin (save).

Gerekirse sıfırlayabilirsin (reset).

Bu key bir GlobalKey<FormState> türündedir.

🧠 Örnek

```dart
import 'package:flutter/material.dart';

class FormKeyExample extends StatefulWidget {
  @override
  State<FormKeyExample> createState() => _FormKeyExampleState();
}

class _FormKeyExampleState extends State<FormKeyExample> {
  // 1️⃣ Formun anahtarını oluşturuyoruz
  final _formKey = GlobalKey<FormState>();

  // 2️⃣ TextFormField kontrolcüsü
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FormKey Örneği')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // 3️⃣ Form widget’ına anahtarı veriyoruz
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Adınızı girin'),
                validator: (value) {
                  // 4️⃣ Boş mu kontrol ediyoruz
                  if (value == null || value.isEmpty) {
                    return 'Lütfen adınızı girin';
                  }
                  return null; // Hata yoksa null döner
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // 5️⃣ Form geçerli mi kontrol ediyoruz
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form Geçerli ✅')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form Geçersiz ❌')),
                    );
                  }
                },
                child: Text('Gönder'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
```

🧾 Adım Adım Açıklama


| Adım   | Açıklama                                                                                                     |
| ------ | ------------------------------------------------------------------------------------------------------------ |
| **1.** | `GlobalKey<FormState>` tanımlanır → bu, formun kontrolcüsüdür.                                               |
| **2.** | `TextEditingController` ile kullanıcıdan veri alınır.                                                        |
| **3.** | `Form` widget’ına `key` olarak `_formKey` verilir.                                                           |
| **4.** | `TextFormField` içinde `validator` fonksiyonu yazılır.                                                       |
| **5.** | Butona basıldığında `_formKey.currentState!.validate()` çağrılır → bütün alanların doğruluğu kontrol edilir. |

   
🧮 Önemli Metotlar


| Metot        | Açıklama                                                                                           |
| ------------ | -------------------------------------------------------------------------------------------------- |
| `validate()` | Tüm `TextFormField` alanlarındaki `validator` fonksiyonlarını çalıştırır. Geçerliyse `true` döner. |
| `save()`     | Her alanın `onSaved` fonksiyonunu çalıştırır. (Veri kaydetmek için)                                |
| `reset()`    | Formu sıfırlar, tüm alanları boş hale getirir.                                                     |


🧠 Kısa Örnek — Form Resetleme


```dart
_formKey.currentState!.reset();
```

Bu komut formdaki tüm alanları temizler.

Genellikle “Temizle” veya “Sıfırla” butonlarında kullanılır.


### 🧩 Bir Sayfada Birden Fazla FormKey Kullanımı

Flutter’da her Form widget’ı kendi FormKey’ine sahip olabilir.

Bu sayede her formu bağımsız olarak doğrulayabilir, kaydedebilir veya sıfırlayabilirsin.

🎯 Mantık

Her form için ayrı bir GlobalKey<FormState> oluşturulur.

Her Form widget’ına kendi key’i atanır.

Doğrulama (validate()), kaydetme (save()) ve sıfırlama (reset()) işlemleri tek tek yapılabilir.

🧠 Örnek Kod


```dart
import 'package:flutter/material.dart';

class MultiFormExample extends StatefulWidget {
  @override
  State<MultiFormExample> createState() => _MultiFormExampleState();
}

class _MultiFormExampleState extends State<MultiFormExample> {
  // 1️⃣ Her form için ayrı FormKey oluşturuluyor
  final _loginFormKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();

  // 2️⃣ Controller'lar
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Birden Fazla Form Örneği")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔹 GİRİŞ FORMU
            Form(
              key: _loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Giriş Formu", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: "Kullanıcı Adı"),
                    validator: (value) => value!.isEmpty ? "Kullanıcı adı zorunlu" : null,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: "Şifre"),
                    obscureText: true,
                    validator: (value) => value!.length < 6 ? "En az 6 karakter" : null,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_loginFormKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Giriş formu geçerli ✅")),
                        );
                      }
                    },
                    child: Text("Giriş Yap"),
                  ),
                ],
              ),
            ),

            Divider(height: 40, thickness: 2),

            // 🔹 KAYIT FORMU
            Form(
              key: _registerFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kayıt Formu", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: "E-posta"),
                    validator: (value) =>
                        value!.contains("@") ? null : "Geçerli bir e-posta girin",
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_registerFormKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Kayıt formu geçerli ✅")),
                        );
                      }
                    },
                    child: Text("Kayıt Ol"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

```


🔍 Açıklama


| Kısım                                       | Açıklama                             |
| ------------------------------------------- | ------------------------------------ |
| `_loginFormKey`                             | Giriş formunu yönetir                |
| `_registerFormKey`                          | Kayıt formunu yönetir                |
| `Form(key: _loginFormKey, ...)`             | Form’a kendi anahtarı atanır         |
| `_loginFormKey.currentState!.validate()`    | Sadece bu formun doğrulamasını yapar |
| `_registerFormKey.currentState!.validate()` | Diğer formu etkilemez                |



⚠️ Dikkat Edilmesi Gerekenler

Her Form kendi içinde bağımsız çalışır.

Aynı sayfada olsalar bile, key’ler çakışmaz çünkü her biri GlobalKey olarak benzersizdir.

Eğer formu sıfırlamak istersen:

```dart
_loginFormKey.currentState!.reset();
_registerFormKey.currentState!.reset();
```
