import 'package:flutter/material.dart';
import 'package:news_app/model/source_responce/source_responce.dart';

class SourceName extends StatelessWidget {
  const SourceName({super.key, required this.source, required this.isSelected});
  final Source source;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      source.name ?? ' ',
      style: isSelected ? textTheme.labelLarge : textTheme.labelMedium,
    );
  }
}
