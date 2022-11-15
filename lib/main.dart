import 'package:flutter/material.dart';
import 'package:todo_app/havetodo.dart';
import 'package:todo_app/wanttodo.dart';
import 'package:todo_app/todoadd.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/login.dart';
import 'package:todo_app/firestoretest.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:todo_app/router.gr.dart';

Future<void> main() async {
  //Initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Run app
  runApp(const MyTodoApp());
}

// final _appRouter = AppRouter();

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      debugShowCheckedModeBanner: false, // Not tagged with debug
      title: 'Todo Management App', //App name
      //Theme settings
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // routerDelegate: _appRouter.delegate(),
      // routeInformationParser: _appRouter.defaultRouteParser(),
      initialRoute: '/login',
      // Define routes below
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/havetodo': (context) => const HaveToDoPage(),
        '/wanttodo': (context) => const WantToDoPage(),
        '/todoadd': (context) => const TodoAddPage(which: 0),
        "/firestoretest": (context) => const MyFirestorePage(),
      },
    );
  }
}
