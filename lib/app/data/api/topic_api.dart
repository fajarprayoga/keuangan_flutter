part of api;

class TopicApi {
  static Future getTopic() async {
    Response response = await dio.get(baseUrl('/topics'));
    return response.data ?? [];
  }
}
