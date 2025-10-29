import 'package:flutter/material.dart';

class ShowDialogKullanimi extends StatelessWidget {
  const ShowDialogKullanimi({super.key});

  void _showMyDialog(BuildContext myContext) {
    showDialog(
      context: myContext,
      builder: (myContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Giriş Yap'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Kullanıcı Adı'),
              ),
              TextField(decoration: InputDecoration(labelText: 'Şifre'), obscureText: true,),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(myContext),
              child: const Text('İptal'),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Giriş')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basit AlertDialog Örneği'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showMyDialog(context),
          child: const Text('AlertDialog Göster'),
        ),
      ),
    );
  }
}
