import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 入力されたメールアドレス
  String newUserEmail = "";
  // 入力されたパスワード
  String newUserPassword = "";
  // 入力されたメールアドレス（ログイン）
  String loginUserEmail = "";
  // 入力されたパスワード（ログイン）
  String loginUserPassword = "";
  // 登録に関する情報を表示
  String registerInfoText = "";
  // ログインに関する情報を表示
  String loginInfoText = "";
  // ユーザーID用の変数
  String userId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LoginPage')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              Row(
                children: const [Text("ユーザー登録はこちらから")],
              ),
              TextFormField(
                // テキスト入力のラベルを設定
                decoration: const InputDecoration(labelText: "メールアドレス"),
                onChanged: (String value) {
                  setState(() {
                    newUserEmail = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: "パスワード（６文字以上）"),
                // パスワードが見えないようにする
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    newUserPassword = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // メール/パスワードでユーザー登録
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final UserCredential result =
                        await auth.createUserWithEmailAndPassword(
                      email: newUserEmail,
                      password: newUserPassword,
                    );
                    // 登録したユーザー情報
                    final User user = result.user!;
                    setState(() {
                      userId = user.uid;
                      registerInfoText = '''
                      登録OK：${user.email}
                      ログインしてください．
                      ''';
                    });
                  } catch (e) {
                    // 登録に失敗した場合
                    setState(() {
                      registerInfoText = "登録NG：${e.toString()}";
                    });
                  }
                },
                child: const Text("ユーザー登録"),
              ),
              const SizedBox(height: 8),
              Text(registerInfoText),
              const SizedBox(height: 32),
              Row(
                children: const [Text("ログインはこちらから")],
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "メールアドレス"),
                onChanged: (String value) {
                  setState(() {
                    loginUserEmail = value;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "パスワード"),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    loginUserPassword = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // メール/パスワードでログイン
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final UserCredential result =
                        await auth.signInWithEmailAndPassword(
                      email: loginUserEmail,
                      password: loginUserPassword,
                    );
                    // ログインに成功した場合
                    final User user = result.user!;
                    setState(() {
                      userId = user.uid;
                      loginInfoText = '''
                      ログインOK：${user.email}
                      ''';
                    });
                    // ログインに成功した場合
                    // homepageに遷移
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pushNamed(context, '/home',
                          arguments: HomePageArguments(userId: userId));
                    });
                  } catch (e) {
                    // ログインに失敗した場合
                    setState(() {
                      loginInfoText = "ログインNG：${e.toString()}";
                    });
                  }
                },
                child: const Text("ログイン"),
              ),
              const SizedBox(height: 8),
              Text(loginInfoText),
            ],
          ),
        ),
      ),
    );
  }
}
