import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpode_project/screen/api/api_model.dart';

class ApiScreen extends ConsumerWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Calling"),
      ),
      body: Center(
        child: api.when(
            data: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.title.toString()),
                      subtitle: Text(item.body.toString()),
                    ),
                  );
                }),
            error: (error, stack) => Text("Error,$error"),
            loading: () => CircularProgressIndicator()),
      ),
    );
  }
}
