import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response/news_response.dart';
import 'package:news_app/ui/news/news_list.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:news_app/utils/asset_manegar.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = 'routeName';

// final  TextEditingController _controller = TextEditingController();

  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Article> pagunationList = [];

  String? query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (value) {
                  query = value;
                  setState(() {});
                },
                style: AppStyle.medium20white,
                // controller: _controller,
                cursorColor: AppColor.white,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: AppStyle.medium20white,
                  prefixIcon: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.clear_rounded,
                      size: 30,
                      color: AppColor.white,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Navigator.pop(context);
                      ApiManager.search(query!);
                      setState(() {});
                    },
                    icon: SvgPicture.asset(
                      AssetManegar.search,
                      height: 24,
                      width: 24,
                      fit: BoxFit.scaleDown,
                      colorFilter:
                          ColorFilter.mode(AppColor.white, BlendMode.srcIn),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 2, color: AppColor.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 2, color: AppColor.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 2, color: AppColor.white),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 2, color: AppColor.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: query == null || query!.isEmpty
                  ? Text(
                      'No iteme found',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  : FutureBuilder(
                      future: ApiManager.search(query!),
                      builder: (context, snapShot) {
                        if (snapShot.connectionState ==
                            ConnectionState.waiting) {
                          Center(
                            child: CircularProgressIndicator(
                              color: AppColor.gray,
                            ),
                          );
                        } else if (snapShot.hasError) {
                          return Center(
                            child: Text(
                              'Client Erroe',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          );
                        } else if (snapShot.data!.status != 'ok') {
                          return Center(
                            child: Text(
                              snapShot.data!.message!,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          );
                        }
                        List<Article> newslist = snapShot.data?.articles ?? [];
                        pagunationList.addAll(newslist);
                        return NewsList(
                          newslist: pagunationList,
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
