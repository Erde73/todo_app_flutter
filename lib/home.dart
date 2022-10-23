import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, title: const Text('TopPage')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Have To Do Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/havetodo');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Want To Do Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/wanttodo');
              },
            ),
          ],
        ),
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

Widget _wantToDoItem(BuildContext context) {
  return GestureDetector(
    child: Container(),
  );
}

Widget _haveToDoItem(BuildContext context) {
  return GestureDetector(
    child: const Card(),
  );
}
