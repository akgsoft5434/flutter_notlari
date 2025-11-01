# 🧭 Flutter Navigation (Sayfalar Arası Geçiş) Rehberi

Flutter uygulamalarında sayfalar (screens) arasında geçiş yapmak için Navigator sınıfı kullanılır.

Bu yapı, sayfaları bir yığın (stack) mantığıyla yönetir:

Yeni sayfa açmak = `push` (yığına ekleme)

Geri dönmek = `pop` (yığından çıkarma)

## 🧩 1. Basit Navigation Mantığı

Flutter’da sayfa geçişi `Navigator.push()` ve `Navigator.pop()` ile yapılır.

### 📄 Örnek 1: Temel İki Sayfa Geçişi
