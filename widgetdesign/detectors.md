# 🖐️ Flutter GestureDetector Kullanımı (Detaylı Anlatım)

Flutter’da GestureDetector, kullanıcı etkileşimlerini (dokunma, sürükleme, çift tıklama, uzun basma vb.) algılamak için kullanılan güçlü bir widget’tır.

Herhangi bir görsel bileşeni “dokunulabilir” veya “hareketle kontrol edilebilir” hale getirmek için kullanılır.

🔍 Temel Tanım

```dart
GestureDetector(
  onTap: () {
    print('Ekrana dokunuldu!');
  },
  child: Container(
    color: Colors.blue,
    padding: EdgeInsets.all(20),
    child: Text('Dokun Bana!', style: TextStyle(color: Colors.white)),
  ),
);
```

📌 Bu örnekte Container, bir dokunma (tap) olayına duyarlı hale getirilmiştir.

🧩 Desteklenen Olaylar

GestureDetector, çok sayıda dokunma ve hareket türünü algılayabilir:

| Olay                                          | Açıklama                                                    |
| --------------------------------------------- | ----------------------------------------------------------- |
| `onTap`                                       | Tek tıklama algılar.                                        |
| `onDoubleTap`                                 | Çift tıklamayı algılar.                                     |
| `onLongPress`                                 | Uzun süre basılı tutmayı algılar.                           |
| `onTapDown`                                   | Parmağın ekrana değdiği an.                                 |
| `onTapUp`                                     | Parmağın kaldırıldığı an.                                   |
| `onTapCancel`                                 | Dokunma iptal edildiğinde tetiklenir.                       |
| `onVerticalDragStart`                         | Dikey sürükleme başladığında.                               |
| `onVerticalDragUpdate`                        | Dikey sürükleme hareketi boyunca.                           |
| `onVerticalDragEnd`                           | Dikey sürükleme bittiğinde.                                 |
| `onHorizontalDragStart`                       | Yatay sürükleme başladığında.                               |
| `onHorizontalDragUpdate`                      | Yatay sürükleme hareketi boyunca.                           |
| `onHorizontalDragEnd`                         | Yatay sürükleme bittiğinde.                                 |
| `onPanStart`, `onPanUpdate`, `onPanEnd`       | Serbest (hem yatay hem dikey) sürükleme hareketleri.        |
| `onScaleStart`, `onScaleUpdate`, `onScaleEnd` | İki parmakla büyütme/küçültme (zoom) hareketlerini algılar. |


🧠 Örnek: Çift Tıklama ve Uzun Basma

```dart
GestureDetector(
  onDoubleTap: () {
    print('Çift tıklandı!');
  },
  onLongPress: () {
    print('Uzun basıldı!');
  },
  child: Container(
    color: Colors.orange,
    width: 150,
    height: 150,
    alignment: Alignment.center,
    child: Text('Deneme Kutusu'),
  ),
);
```


