import 'package:flutter/material.dart';
import 'package:todo_app/havetodo.dart';
import 'package:todo_app/wanttodo.dart';

class HomePageArguments {
  final String userId;
  HomePageArguments({required this.userId});
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final userId =
        ModalRoute.of(context)!.settings.arguments as HomePageArguments;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, title: const Text('TopPage')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            SizedBox(
              width: 400, //横幅
              height: 100, //高さ
              child: ElevatedButton(
                child: const Text(
                  'Have To Do Page',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/havetodo',
                      arguments: HaveToDoPageArguments(userId: userId.userId));
                },
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 400, //横幅
              height: 100, //高さ
              child: ElevatedButton(
                child: const Text('Want To Do Page',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                onPressed: () {
                  Navigator.pushNamed(context, '/wanttodo',
                      arguments: WantToDoPageArguments(userId: userId.userId));
                },
              ),
            ),
          ],
        ),
      ),
      // あとでhomeから遷移したときはhaveでもwantでもない値(nullとか)を渡す
      // どちらにもタスクを追加できるようにする
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // "push"で新規画面に遷移
      //     Navigator.pushNamed(context, '/todoadd');
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

// Widget _wantToDoItem(BuildContext context) {
//   return GestureDetector(
//     child: Container(),
//   );
// }

// Widget _haveToDoItem(BuildContext context) {
//   return GestureDetector(
//     child: const Card(),
//   );
// }
