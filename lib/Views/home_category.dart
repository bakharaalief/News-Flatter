import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/Views/article.dart';
import 'package:flutter_app1/Views/home.dart';
import 'package:flutter_app1/helper/news.dart';
import 'package:flutter_app1/helper/news_category.dart';
import 'package:flutter_app1/model/category_model.dart';
import 'package:flutter_app1/model/news_model.dart';
import 'dart:developer';

class HomeCategory extends StatefulWidget {
  final String categoryInput;
  HomeCategory({this.categoryInput});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeCategory> {
  NewsCategory newsCategory = new NewsCategory();
  News news = new News();
  List<CategoryModel> categories = new List<CategoryModel>();
  List<NewsModel> newsList = new List<NewsModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = newsCategory.getCategories();
    getNews(widget.categoryInput);
  }

  getNews(String category) async{
    await news.fetchNews(category);
    newsList = news.listNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Flutter"),
              Text("News",
                style: TextStyle(
                    color: Colors.blue
                ),)
            ],
          ),
          actions: <Widget>[
            Opacity(
              opacity: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save),
              ),
            )
          ],
          centerTitle: true,
          elevation: 0,
        ),

        body: _loading ?
        //loading
        Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ) :

        /// loading done
        SingleChildScrollView(
          child: Column(
            children: <Widget>[

              //category
              Container(
                height: 70,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return CategoryTitle(
                        categoryName: categories[index].categoryName,
                        imageUrl: categories[index].imageUrl,
                      );
                    }),
              ),

              // news
              Container(
                height: 520,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount : newsList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index){
                      return NewsTile(
                        imageUrl: newsList[index].urlToImage,
                        title: newsList[index].title,
                        desc: newsList[index].description,
                        url: newsList[index].url,
                      );
                    }
                ),
              ),
            ],
          ),
        )
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final String imageUrl, categoryName;
  CategoryTitle({this.categoryName, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => HomeCategory(
              categoryInput: categoryName.toLowerCase(),
            )
        ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                  imageUrl, width: 120, height: 60, fit: BoxFit.cover
              ),
            ),
            Container(
              width: 120, height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26
              ),
              child: Text(categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),),
            )
          ],
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  NewsTile({this.imageUrl, this.title, this.desc, this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => Article(
                url: url,
              )
          ));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(imageUrl)
              ),
              SizedBox(height: 10),
              Text(title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
              SizedBox(height: 8),
              Text(desc,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 12,
                ),)
            ],
          ),
        )
    );
  }
}


