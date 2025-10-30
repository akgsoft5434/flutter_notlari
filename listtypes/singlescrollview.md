# 📜 Flutter SingleChildScrollView

SingleChildScrollView, Flutter’da tek bir çocuğu (child) kaydırılabilir hâle getiren basit ama sık kullanılan bir widget’tır. Küçük ve sabit sayıda bileşenlerin dikey veya yatay olarak kaydırılmasını sağlamaya uygundur.

🚀 Giriş — Ne işe yarar?

SingleChildScrollView, içindeki tek bir widget’ın (çoğunlukla Column veya Row) ebeveyn alanından büyük olması durumunda kaydırma (scroll) yapılabilmesini sağlar. Örneğin bir form, uzun içerikli bir sayfa ya da yatay kayan küçük resim listeleri için kullanılır.

SingleChildScrollView(
  child: Column(
    children: [
      // uzun liste değil, sabit sayıda widget
    ],
  ),
)
