
class NewsModel {
    final String? author;
    final String? content;
    final String? description;
    final String? publishedAt;
    final String? title;
    final String? url;
    final String? urlToImage;

    const NewsModel({this.author, this.content, this.description, this.publishedAt, this.title, this.url, this.urlToImage});

    factory NewsModel.fromJson(Map<String, dynamic> json) {
        return NewsModel(
            author: json['author'], 
            content: json['content'], 
            description: json['description'], 
            publishedAt: json['publishedAt'],
            title: json['title'], 
            url: json['url'], 
            urlToImage: json['urlToImage'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['author'] = this.author;
        data['content'] = this.content;
        data['description'] = this.description;
        data['publishedAt'] = this.publishedAt;
        data['title'] = this.title;
        data['url'] = this.url;
        data['urlToImage'] = this.urlToImage;
        return data;
    }
}