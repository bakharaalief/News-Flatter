import 'package:news_flutter/domain/news/model/news.dart';

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
          "",
          Dummy.category("A")));
    }
    return data;
  }

  static String createLorem() {
    return "Lorem Ipsum is simply dummy text of the printing "
        "and typesetting industry. Lorem Ipsum has been the "
        "industry's standard dummy text ever since the 1500s, "
        "when an unknown printer took a galley of type and "
        "scrambled it to make a type specimen book. It has survived not "
        "only five centuries, but also the leap into electronic typesetting, "
        "remaining essentially unchanged. It was popularised in the 1960s with the release "
        "of Letraset sheets containing Lorem Ipsum passages, and more recently with "
        "desktop publishing software like Aldus PageMaker including versions of\n\n"
        "Lorem Ipsum."
        "Lorem Ipsum is simply dummy text of the printing "
        "and typesetting industry. Lorem Ipsum has been the "
        "industry's standard dummy text ever since the 1500s, "
        "when an unknown printer took a galley of type and "
        "scrambled it to make a type specimen book. It has survived not "
        "only five centuries, but also the leap into electronic typesetting, "
        "remaining essentially unchanged. It was popularised in the 1960s with the release "
        "of Letraset sheets containing Lorem Ipsum passages, and more recently with "
        "desktop publishing software like Aldus PageMaker including versions of\n\n"
        "Lorem Ipsum."
        "Lorem Ipsum is simply dummy text of the printing "
        "and typesetting industry. Lorem Ipsum has been the "
        "industry's standard dummy text ever since the 1500s, "
        "when an unknown printer took a galley of type and "
        "scrambled it to make a type specimen book. It has survived not "
        "only five centuries, but also the leap into electronic typesetting, "
        "remaining essentially unchanged. It was popularised in the 1960s with the release "
        "of Letraset sheets containing Lorem Ipsum passages, and more recently with "
        "desktop publishing software like Aldus PageMaker including versions of\n\n"
        "Lorem Ipsum."
        "Lorem Ipsum is simply dummy text of the printing "
        "and typesetting industry. Lorem Ipsum has been the "
        "industry's standard dummy text ever since the 1500s, "
        "when an unknown printer took a galley of type and "
        "scrambled it to make a type specimen book. It has survived not "
        "only five centuries, but also the leap into electronic typesetting, "
        "remaining essentially unchanged. It was popularised in the 1960s with the release "
        "of Letraset sheets containing Lorem Ipsum passages, and more recently with "
        "desktop publishing software like Aldus PageMaker including versions of ";
  }

  static String category(String char) {
    if (char == "A") {
      return "Sport";
    } else if (char == "B") {
      return "Health";
    } else {
      return "Ecomony";
    }
  }

  static String Image(String char) {
    if (char == "A" || char == "C") {
      return "https://tmssl.akamaized.net//images/foto/galerie/cristiano-ronaldo-portugal-2024-1718210600-139467.jpg?lm=1718210615";
    } else if (char == "B" || char == "D") {
      return "https://akcdn.detik.net.id/community/media/visual/2024/09/15/lionel-messi_169.jpeg?w=600&q=90";
    } else {
      return "https://www.tubefilter.com/wp-content/uploads/2023/10/i-show-speed-1400x825.jpg";
    }
  }
}
