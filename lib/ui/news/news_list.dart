import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response/news_response.dart';
import 'package:news_app/ui/news/news_iteme.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsList extends StatelessWidget {
  final List<Article> newslist;

  const NewsList({super.key, required this.newslist});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;

    return ListView.separated(
      separatorBuilder: (context, __) => SizedBox(
        height: heightScreen * 0.02,
      ),
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return NewsIteme(
          onpressed: () {
            bottomSheet(
              context,
              newslist[index],
            );
          },
          article: newslist[index],
        );
      },
      itemCount: newslist.length,
    );
  }

  Future<void> _launchUrl(Article article) async {
    if (!await launchUrl(Uri.parse(article.url ?? "not found"),
        mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch ${article.url}');
    }
  }

  void bottomSheet(
    BuildContext context,
    Article article,
  ) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.transperant,
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 20),
        decoration: BoxDecoration(
          color: Theme.of(context).indicatorColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.gray,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: 50,
                  color: Theme.of(context).indicatorColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                article.description ?? "no description",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Theme.of(context).primaryColor),
              onPressed: () {
                _launchUrl(article);
              },
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "View Full Articel",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
