import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});
final switchbutton = StateProvider<bool>((ref) {
  return false;
});

class CounterAppScreen extends ConsumerWidget {
  const CounterAppScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final counterr = ref.watch(counter);
              return Center(
                child: Text(counterr.toString()),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final counterr = ref.watch(switchbutton);
              return Center(
                child: Switch(
                    value: counterr,
                    onChanged: (value) {
                      ref.read(switchbutton.notifier).state = value;
                    }),
              );
            },
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state++;
                  },
                  child: Text("+")))
        ],
      ),
    );
  }
}
