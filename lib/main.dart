import 'package:flutter/material.dart';
import 'package:news_app/src/pages/tabs_page.dart';
import 'package:news_app/src/services/news_services.dart';
import 'package:news_app/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //para cuando necesito muchos providers
      providers: [ChangeNotifierProvider(create: (_) => new NewsService())],
      child: MaterialApp(
          title: 'Material App',
          theme: miTema,
          debugShowCheckedModeBanner: false,
          home: TabsPage()),
    );
  }
}

/* 0f203cce701249daa3088dc67c0a1fd1 */
