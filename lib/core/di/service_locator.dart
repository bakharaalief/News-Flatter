import 'package:flutter_app1/data/news/news_repository_impl.dart';
import 'package:flutter_app1/data/news/remote/news_remote_data.dart';
import 'package:flutter_app1/domain/news/repository/news_repository.dart';
import 'package:flutter_app1/domain/news/usecase/news_use_case.dart';
import 'package:flutter_app1/domain/news/usecase/news_use_case_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  //news remote data
  serviceLocator.registerSingleton<NewsRemoteData>(NewsRemoteData());

  //news repository impl
  serviceLocator.registerSingleton<NewsRepository>(NewsRepositoryImpl());

  //news repository impl
  serviceLocator.registerSingleton<NewsUseCase>(NewsUseCaseImpl());
}
