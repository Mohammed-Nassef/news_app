import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response/news_response.dart';
import 'package:news_app/model/source_responce/source_responce.dart';
import 'package:news_app/provider/page_provider.dart';
import 'package:news_app/ui/news/news_list.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:provider/provider.dart';

class News extends StatefulWidget {
  const News({super.key, required this.source});
  final Source source;

  @override
  State<News> createState() => _NewsState();
}

// List<Article> pagunationList = [];

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySources(widget.source.id ?? ''),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColor.gray,
              ),
            );
          } else if (snapShot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "some thing is error",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySources(widget.source.id ?? '');
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Theme.of(context).indicatorColor,
                    ),
                    child: Text('try again'),
                  ),
                ],
              ),
            );
          } else if (snapShot.data!.status != 'ok') {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    snapShot.data!.message!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySources(widget.source.id ?? '');
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Theme.of(context).indicatorColor,
                    ),
                    child: Text('try again'),
                  ),
                ],
              ),
            );
          }

          // List<Article> pagunationList = []; pagunationList.addAll(newslist);
          List<Article> newslist = snapShot.data!.articles ?? [];

          return NewsList(
            newslist: newslist,
          );
        });
  }
}
