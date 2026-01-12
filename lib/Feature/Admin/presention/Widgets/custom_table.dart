import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomTable extends StatelessWidget {
  final List<String> columnTitles;
  final List<DataRow> rows;

  const CustomTable({
    super.key,
    required this.columnTitles,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: DataTable(
                  columnSpacing: 20.w,
                  horizontalMargin: 12,
                  headingRowColor: WidgetStateProperty.all(Colors.grey[100]),
                  columns: columnTitles
                      .map((title) => DataColumn(
                            label: Expanded(
                              child: Skeleton.keep(
                                child: Text(
                                  title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                  rows: rows,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
