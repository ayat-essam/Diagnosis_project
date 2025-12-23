import 'package:flutter/material.dart';
import 'filter_result_item.dart';

class FilterResultList extends StatelessWidget {
  const FilterResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const FilterResultItem();
      },
    );
  }
}