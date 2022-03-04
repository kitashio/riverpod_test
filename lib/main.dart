import 'package:flutter/material.dart';
import 'package:mycolle_app/views/todo_list_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'views/counter_list_page.dart';


void main() {
  const ProviderScope(child: MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => CounterListPage.show(context),
              child: const Text('Counter'),
            ),
            ElevatedButton(
              onPressed: () => TodoListPage.show(context),
              child: const Text('TODO'),
            ),
          ],
        ),
      ),
    );
  }
}