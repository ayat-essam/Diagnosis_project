import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';

class DataTypesList extends StatelessWidget {
  const DataTypesList({super.key});
  final List<String> dataItem = const [
    'Patient',
    'Type',
    'Symptoms',
    'Response',
    'Status',
    'Requested',
    'Action'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
          color: const Color(0xffF7F7F7),
          borderRadius: BorderRadius.circular(15),
          border: Border.symmetric(
              horizontal: BorderSide(color: AppColors.BluePrimary))),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataItem.length,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                dataItem[index],
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff4A5565)),
              ),
            );
          }),
    );
  }
}
