import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyFirestorePage extends StatefulWidget {
  const MyFirestorePage({super.key});
  @override
  State<MyFirestorePage> createState() => _MyFirestorePageState();
}

class _MyFirestorePageState extends State<MyFirestorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Test'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          ElevatedButton(
            child: const Text('コレクション＋ドキュメント作成'),
            onPressed: () async {
              // ドキュメント作成
              await FirebaseFirestore.instance.collection('users') // コレクションID
                  .add({'name': 'mizutani', 'age': 22}); // データ
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            child: const Text('サブコレクション＋ドキュメント作成'),
            onPressed: () async {
              // サブコレクション内にドキュメント作成
              await FirebaseFirestore.instance
                  .collection('users') // コレクションID
                  .doc('id_abc') // ドキュメントID << usersコレクション内のドキュメント
                  .collection('orders') // サブコレクションID
                  .doc('id_123') // ドキュメントID << サブコレクション内のドキュメント
                  .set({'price': 600, 'date': '9/13'}); // データ
            },
          ),
        ]),
      ),
    );
  }
}
