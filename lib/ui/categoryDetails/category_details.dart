import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/category_model/category.dart';
import 'package:news_app/model/source_responce/source_responce.dart';
import 'package:news_app/ui/categoryDetails/source_tab.dart';
import 'package:news_app/utils/app_color.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({
    super.key,
    this.category,
  });
  final Category? category;
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  // final List<Source>? listSource;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponce?>(
      future: ApiManager.getSources(widget.category!.id),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.gray,
            ),
          );
        } else if (snapShot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "some thing is wrong",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(widget.category!.id);
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).indicatorColor,
                  ),
                  child: const Text('Try agian'),
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
                  '${snapShot.data!.message}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                // Text(snapShot.data!.message!),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(widget.category!.id);
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).indicatorColor,
                  ),
                  child: Text(
                    'Try agian',
                  ),
                ),
              ],
            ),
          );
        }
        List<Source> listSource = snapShot.data!.sources ?? [];
        return SourceTab(
          listSource: listSource,
        );
        //  ListView.builder(
        //   itemBuilder: (context, index) =>
        //       Text(listSource[index].name ?? " "),
        //   itemCount: listSource.length,
        // );
      },
    );
  }
}
