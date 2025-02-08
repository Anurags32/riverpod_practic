import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpode_project/screen/counterApp/notifier_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(serchProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("SearchBar"),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              ref.read(serchProvider.notifier).search(value);
            },
          ),
          Text(search)
        ],
      ),
    );
  }
}
