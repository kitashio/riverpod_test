import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mycolle_app/controllers/counter_coutroller.dart';


class CounterDetailsPage extends StatelessWidget {
  // ._() でコンストラクタを定義すると気軽に外部から呼べなくなる
  const CounterDetailsPage._(this.index);
  final int index;

  // 気軽に外部から呼べないので表示用の static メソッドを用意する
  // すると、用途を限定できるよ、という話。
  static void show(BuildContext context, int index) {
    Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (context) => CounterDetailsPage._(index),
      ),
    );
  }

  @override
  Widget build (BuildContext context,WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final countController = ref.read(counterProvider(index));
    return Scaffold(
      appBar: AppBar(
        title: Text('index: $index'),
      ),
      floatingActionButton: FloatingActionButton(
        // 引数を渡さないならここまで短く書くこともできます
        onPressed: countController.increment,
        child: const Icon(Icons.add_rounded),
      ),
      /// 全体を ConsumerWidget にせず、
      /// 部分的に Consumer を使うことで、この部分しかリビルドされず
      /// パフォーマンスが向上します。
      body: Consumer(
        builder: (_, watch, __) {
          final count = ref.watch(counterProvider(index)).count;
          return Center(
            child: Text('$count', style: textTheme.headline5),
          );
        },
      ),
    );
  }
}