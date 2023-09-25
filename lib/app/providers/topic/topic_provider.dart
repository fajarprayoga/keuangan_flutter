import 'package:keuangan_flutter/app/data/api/api.dart';
import 'package:keuangan_flutter/app/data/models/topic.dart';
import 'package:riverpod/riverpod.dart';

class TopicNotifier extends StateNotifier<AsyncValue<List<Topic>>> {
  TopicNotifier() : super(const AsyncValue.data([]));

  Future getTopic() async {
    try {
      final response = await TopicApi.getTopic();
      List data = response ?? [];
      List<Topic> topics = data.map((e) => Topic.fromJson(e)).toList();
      state = AsyncData(topics);
    } catch (e, stacktrace) {
      print('error: $stacktrace');
    }
  }
}

// autoDispose untuk menghapus nilai ketika halaman di tinggalkan
final topicProvider =
    StateNotifierProvider.autoDispose<TopicNotifier, AsyncValue<List<Topic>>>(
        (ref) {
  return TopicNotifier();
});
