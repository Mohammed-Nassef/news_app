import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response/news_response.dart';
import 'package:news_app/provider/localization/app_localization_provider.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsIteme extends StatelessWidget {
  const NewsIteme({super.key, required this.article, required this.onpressed});
  final Article article;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    AppLocalizationProvider languageProvider =
        Provider.of<AppLocalizationProvider>(context);
    String lang = languageProvider.language;
    timeago.setLocaleMessages(
        lang, lang == 'ar' ? timeago.ArMessages() : timeago.EnMessages());
    String timeAgo =
        timeago.format(DateTime.parse(article.publishedAt!), locale: lang);

    double heightScreen = MediaQuery.of(context).size.height;
   
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        onpressed();
      },
      child: Container(
        height: heightScreen * 0.37,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: Theme.of(context).indicatorColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 11,
              child: Container(
                height: heightScreen * 0.255,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: article.urlToImage ?? '',
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                    color: AppColor.gray,
                  )),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    size: 50,
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  article.title ?? "no title",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
             
                      ),
             
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'By : ${article.author ?? 'UnKnow'}',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  const Spacer(),
                  Text(timeAgo, style: Theme.of(context).textTheme.titleLarge)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
