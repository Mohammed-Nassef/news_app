import 'package:flutter/material.dart';
import 'package:news_app/model/source_responce/source_responce.dart';
import 'package:news_app/ui/news/news.dart';
import 'package:news_app/ui/categoryDetails/source_name.dart';
import 'package:news_app/utils/app_color.dart';

class SourceTab extends StatefulWidget {
  const SourceTab({super.key, required this.listSource});
  final List<Source> listSource;

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          initialIndex: activeIndex,
          length: widget.listSource.length,
          child: TabBar(
            onTap: (index) {
              activeIndex = index;
              setState(() {});
            },
            dividerColor: AppColor.transperant,
            indicatorColor: AppColor.black,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: widget.listSource.map(
              (source) {
                return SourceName(
                  source: source,
                  isSelected: activeIndex == widget.listSource.indexOf(source),
                );
              },
            ).toList(),
          ),
        ),
        Expanded(
          child: News(
            source: widget.listSource[activeIndex],
          ),
        ),
      ],
    );
  }
}
