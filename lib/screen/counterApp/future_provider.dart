import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureprovider = FutureProvider<int>(
  (ref) async {
    await Future.delayed(Duration(seconds: 2));
    return 0;
  },
);

class FutureProviderScreen extends ConsumerStatefulWidget {
  const FutureProviderScreen({super.key});

  @override
  ConsumerState<FutureProviderScreen> createState() =>
      _FutureProviderScreenState();
}

class _FutureProviderScreenState extends ConsumerState<FutureProviderScreen> {
  @override
  Widget build(BuildContext context) {
    final futureproviderr = ref.watch(futureprovider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(futureprovider);
        },
        child: Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: Text("Future Provider"),
      ),
      body: Column(
        children: [
          Center(
            child: futureproviderr.when(
                skipLoadingOnRefresh: false,
                data: (value) => Text(value.toString()),
                error: (error, Stack) => Text(error.toString()),
                loading: () => CircularProgressIndicator()),
          )
        ],
      ),
    );
  }
}
