import 'package:auto_route/auto_route.dart';
import 'package:todo_app/login.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/havetodo.dart';
import 'package:todo_app/wanttodo.dart';
import 'package:todo_app/todoadd.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(page: HomePage),
    AutoRoute(page: HaveToDoPage),
    AutoRoute(page: WantToDoPage),
    AutoRoute(page: TodoAddPage),
  ],
)
class $AppRouter {}
