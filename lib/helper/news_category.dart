import 'package:flutter_app1/model/category_model.dart';

class NewsCategory{
  List<CategoryModel> categories = new List<CategoryModel>();

  List<CategoryModel> getCategories(){

    //sport
    CategoryModel sport = new CategoryModel(
        "Sports",
        "https://images.unsplash.com/photo-1556817411-31ae72fa3ea0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
    );
    categories.add(sport);

    //politic
    CategoryModel business = new CategoryModel(
        "Business",
        "https://images.unsplash.com/photo-1532214950507-92ba44a2f6f7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
    );
    categories.add(business);

    //food
    CategoryModel entertainment = new CategoryModel(
        "Entertainment",
        "https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
    );
    categories.add(entertainment);

    return categories;
  }

}
