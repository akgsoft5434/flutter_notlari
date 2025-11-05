# 🧩 Flutter TextFormField Widget’ı

## 📘 Tanım

`TextFormField`, `TextField` widget’ının daha gelişmiş bir sürümüdür.

Farkı:

Form yapılarında (Form widget’ı içinde) kullanılmak üzere tasarlanmıştır.

Doğrulama (validation), kaydetme (save) ve form kontrolü (FormState) özelliklerini destekler.

###🧠 TextField ile TextFormField Farkı

| Özellik                       | `TextField` | `TextFormField` |
| ----------------------------- | ----------- | --------------- |
| Form içinde kullanılabilirlik | ❌ Hayır     | ✅ Evet          |
| `validator` (doğrulama)       | ❌ Yok       | ✅ Var           |
| `onSaved`                     | ❌ Yok       | ✅ Var           |
| `Form` widget’ı ile çalışır   | ❌ Hayır     | ✅ Evet          |
| `FormState` üzerinden kontrol | ❌ Yok       | ✅ Var           |
