import 'package:flutter/material.dart';
import 'package:todo_app/todoadd.dart';

class HaveToDoPage extends StatefulWidget {
  const HaveToDoPage({super.key});
  @override
  State<HaveToDoPage> createState() => _HaveToDoPageState();
}

class _HaveToDoPageState extends State<HaveToDoPage> {
  List<String> todoList = [];
  int which = 1; // if = 0 then have to do
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('have to do list'),
        actions: [
          IconButton(
            icon: const Icon(Icons.change_circle),
            onPressed: () => {Navigator.pushNamed(context, '/wanttodo')},
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
      // body: ListView(
      //   children: <Widget>[
      //     _haveToDoItem(context, "数理最適化"),
      //     _haveToDoItem(context, "時系列分析"),
      //     _haveToDoItem(context, "シェアスタ"),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        // *** 追加する部分 ***
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.of(context).push(
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
