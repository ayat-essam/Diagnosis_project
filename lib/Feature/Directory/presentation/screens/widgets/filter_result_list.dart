import 'package:flutter/material.dart';
import '../../../../Admin/doctors_management/data/models/doctor_model.dart';
import 'filter_result_item.dart';

class FilterResultList extends StatelessWidget {
  const FilterResultList({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = DoctorModel.fakeDoctorsList;

    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return FilterResultItem(
          doctor: doctors[index],
        );
      },
    );
  }
}
