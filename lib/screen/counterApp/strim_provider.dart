import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final strime = StreamProvider<double>((ref) async* {
  final random = Random();
  double currentprice = 100.00;
  while (true) {
    await Future.delayed(Duration(seconds: 2));
    currentprice += random.nextDouble() * 4 - 2;
    yield double.parse(currentprice.toStringAsFixed(2));
  }
});

class StrimeScreen extends ConsumerWidget {
  const StrimeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strimeprovider = ref.watch(strime);

    return Scaffold(
      appBar: AppBar(
        title: Text("Strime Provider"),
      ),
      body: Center(
        
      ),
    );
  }
}
