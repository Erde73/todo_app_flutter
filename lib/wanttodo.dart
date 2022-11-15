import 'package:flutter/material.dart';
import 'package:todo_app/todoadd.dart';

class WantToDoPageArguments {
  final String userId;
  WantToDoPageArguments({required this.userId});
}

class WantToDoPage extends StatefulWidget {
  const WantToDoPage({super.key});
  @override
  State<WantToDoPage> createState() => _WantToDoPageState();
}

class _WantToDoPageState extends State<WantToDoPage> {
  List<String> todoList = ["数理統計", "数理最適化", "時系列分析", "シェアスタ"];
  int which = 1; // which = 0 then have to do, which = 1 then want to do
  @override
  Widget build(BuildContext context) {
    final userId =
        ModalRoute.of(context)!.settings.arguments as WantToDoPageArguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('want to do list'),
        actions: [
          IconButton(
            icon: const Icon(Icons.change_circle),
            onPressed: () => {Navigator.pushNamed(context, '/havetodo')},
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
                //whichを渡す
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

// Widget _wantToDoItem(BuildContext context, String text) {
//   return GestureDetector(
//     child: Card(
//       child: ListTile(
//         title: Text(text),
//       ),
//     ),
//   );
// }
