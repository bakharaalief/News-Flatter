import 'package:flutter_app1/domain/news/model/news.dart';

class Dummy {
  static List<News> createNewsDummy(int count) {
    List<News> data = [];
    for (int i = 0; i < count; i++) {
      data.add(News(
          "The New York Times",
          "Full Transcript of Kamala Harris’s Speech at the Democratic Convention - The New York Times",
          "",
          "",
          "",
          "2024-08-23T04:55:30Z",
          ""));
    }
    return data;
  }
}
