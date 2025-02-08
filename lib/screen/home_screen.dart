import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final name = Provider<String>((ref) {
  return "Anurag Tiwari";
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final namee = ref.watch(name);
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPode".toUpperCase()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(namee)),
        ],
      ),
    );
  }
}
