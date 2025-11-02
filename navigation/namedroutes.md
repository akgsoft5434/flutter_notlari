# 🧭 Flutter Named Routes (İsimlendirilmiş Rotalar)

## 📘 1. Giriş

Flutter’da sayfalar (ekranlar) arasında geçiş yapmak için Navigator sınıfı kullanılır.

Ancak uygulama büyüdükçe, sayfa adlarını manuel olarak yazmak (örneğin `Navigator.push(context, MaterialPageRoute(...))` ) karmaşık hale gelir.

Bu nedenle Flutter, Named Routes (isimlendirilmiş rotalar) özelliğini sunar.

Bu sayede sayfaları bir adla (string) tanımlarız ve geçişleri bu adla yaparız.

## ⚙️ 2. Temel Mantık

Normal (Anonim) route örneği:
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondPage()),
);
```

Named route örneği:

```dart
Navigator.pushNamed(context, '/second');
```

Gördüğün gibi sadece sayfa adını ('/second') kullanarak geçiş yapılır.

Bu yöntemde sayfalar merkezi bir noktada tanımlanır — bu, uygulama yapısını sadeleştirir.


## 🏗️ 3. Rotaları Tanımlama (main.dart içinde)

📄 Örnek yapı

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/', // Uygulama ilk hangi sayfadan başlasın
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
      },
    );
  }
}
```

Burada:

'/' ana sayfayı temsil eder.

'/second' ve '/third' adlarında iki rota tanımlanmıştır.


## 🏠 4. Sayfa (Widget) Örnekleri

### 🏡 HomePage.dart

```dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ana Sayfa')),
      body: Center(
        child: ElevatedButton(
          child: Text('İkinci sayfaya git'),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}
```


### 📄 SecondPage.dart

```dart
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('İkinci Sayfa')),
      body: Center(
        child: ElevatedButton(
          child: Text('Üçüncü sayfaya git'),
          onPressed: () {
            Navigator.pushNamed(context, '/third');
          },
        ),
      ),
    );
  }
}
```

### 📄 ThirdPage.dart

```dart
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Üçüncü Sayfa')),
      body: Center(
        child: ElevatedButton(
          child: Text('Geri dön'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
```


## 📦 5. Rotalar Arasında Veri Aktarma
### 🎯 Veri Gönderme
```dart
Navigator.pushNamed(
  context,
  '/second',
  arguments: 'Selam! Ben HomePage’den geldim.',
);
```

### 🎯 SecondPage’te Veriyi Alma
```dart
final args = ModalRoute.of(context)!.settings.arguments as String;

return Scaffold(
  appBar: AppBar(title: Text('Veri Alan Sayfa')),
  body: Center(
    child: Text(args),
  ),
);
```

## 🧰 6. onGenerateRoute Kullanımı (Daha Esnek Yöntem)

Eğer rota listesi dinamik olacaksa veya rota bulunamadığında özel işlem yapmak istiyorsan, onGenerateRoute kullanılır.
```dart
MaterialApp(
  initialRoute: '/',
  onGenerateRoute: (settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/second':
        final data = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => SecondPage(data: data));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('404 - Sayfa bulunamadı')),
          ),
        );
    }
  },
);
```

## 🔄 7. Rotalar Arasında Geri Dönme

| İşlem                            | Kod                                                     |
| -------------------------------- | ------------------------------------------------------- |
| Yeni sayfaya git                 | `Navigator.pushNamed(context, '/second')`               |
| Geri dön                         | `Navigator.pop(context)`                                |
| Önceki sayfalara kadar geri dön  | `Navigator.popUntil(context, ModalRoute.withName('/'))` |
| Belirli sayfayı değiştirerek git | `Navigator.pushReplacementNamed(context, '/home')`      |


## ⚡ 8. Örnek: Basit Uygulama Akışı
```dart
main.dart
 ├── routes: { '/', '/second', '/third' }
 ├── HomePage
 ├── SecondPage
 └── ThirdPage
```

Kullanıcı akışı:

Ana sayfadan → İkinci sayfaya gider

İkinci sayfadan → Üçüncü sayfaya gider

Üçüncü sayfada → Geri döner

Bu akışın tamamı sadece rota isimleriyle yönetilir.

Kodun her yerinde Navigator.pushNamed(context, '/second') diyerek aynı geçişi kolayca yapabilirsin.

## 🧠 9. İpuçları

Rota adlarını sabit olarak tanımla, böylece yazım hatalarını önlersin:

```dart
class RouteNames {
  static const home = '/';
  static const second = '/second';
  static const third = '/third';
}
```

Kullanım:
```dart
Navigator.pushNamed(context, RouteNames.second);
```

## ✅ 10. Özet

| Özellik                 | Açıklama                                         |
| ----------------------- | ------------------------------------------------ |
| `initialRoute`          | Uygulamanın ilk açılacağı rota                   |
| `routes`                | Rota adlarını ve sayfalarını tanımladığın sözlük |
| `Navigator.pushNamed()` | Rota ismiyle yeni sayfaya gitme                  |
| `Navigator.pop()`       | Bir önceki sayfaya dönme                         |
| `arguments`             | Sayfalar arası veri aktarımı                     |
| `onGenerateRoute`       | Dinamik rota yönetimi                            |


💡 Kısa Örnek (Tüm Kod Bir Arada)

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Örneği',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => SecondPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ana Sayfa')),
      body: Center(
        child: ElevatedButton(
          child: Text('İkinci Sayfaya Git'),
          onPressed: () {
            Navigator.pushNamed(context, '/second', arguments: 'Selam!');
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(title: Text('İkinci Sayfa')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data ?? 'Veri yok'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Geri Dön'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
```



