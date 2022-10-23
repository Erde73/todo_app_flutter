import 'package:flutter/material.dart';

class WantToDoPage extends StatelessWidget {
  const WantToDoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: <Widget>[
          _wantToDoItem(context, "数理統計"),
          _wantToDoItem(context, "計算理論"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // "push"で新規画面に遷移
          Navigator.pushNamed(context, '/todoadd');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget _wantToDoItem(BuildContext context, String text) {
  return GestureDetector(
    child: Card(
      child: ListTile(
        title: Text(text),
      ),
    ),
  );
}
