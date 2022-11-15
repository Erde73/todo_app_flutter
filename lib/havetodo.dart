import 'package:flutter/material.dart';
import 'package:todo_app/todoadd.dart';
import 'package:todo_app/wanttodo.dart';

class HaveToDoPageArguments {
  final String userId;
  HaveToDoPageArguments({required this.userId});
}

class HaveToDoPage extends StatefulWidget {
  const HaveToDoPage({super.key});
  @override
  State<HaveToDoPage> createState() => _HaveToDoPageState();
}

class _HaveToDoPageState extends State<HaveToDoPage> {
  List<String> todoList = ["研究", "イノチャレバックエンド", "確率解析ゼミ 復習"];
  int which = 0; // which = 0 then have to do, which = 1 then want to do
  @override
  Widget build(BuildContext context) {
    final userId =
        ModalRoute.of(context)!.settings.arguments as HaveToDoPageArguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('have to do list'),
        actions: [
          IconButton(
            icon: const Icon(Icons.change_circle),
            onPressed: () => {
              Navigator.pushNamed(context, '/wanttodo',
                  arguments: WantToDoPageArguments(userId: userId.userId))
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              {Navigator.popUntil(context, ModalRoute.withName("/home"))},
        ),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          final newListText = await Navigator.of(context).push(
            // リスト追加画面から渡される値を受け取る
            MaterialPageRoute(
              settings: RouteSettings(arguments: which),
              builder: (context) {
                // 遷移先の画面としてリスト追加画面を指定
                return TodoAddPage(which: which);
              },
            ),
          );
          if (newListText != null) {
            // キャンセルした場合は newListText が null となるので注意
            setState(() {
              // リスト追加
              todoList.add(newListText);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
