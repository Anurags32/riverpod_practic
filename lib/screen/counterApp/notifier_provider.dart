import 'package:flutter_riverpod/flutter_riverpod.dart';

final serchProvider = StateNotifierProvider<SearchNotifire, String>((ref) {
  return SearchNotifire();
});

class SearchNotifire extends StateNotifier<String> {
  SearchNotifire() : super('');
  void search(String query){
    state = query;
  }
} 
