import 'package:flutter/material.dart';
import '../../../../Admin/doctors_management/data/models/doctor_model.dart';
import 'filter_result_item.dart';
class FilterResultList extends StatelessWidget {
  const FilterResultList({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = [
      DoctorModel(
        id: 1,
        fullName: 'Dr. John Doe',
        experienceYears: 5,
        gender: 'Male',
        profileImageUrl: 'assets/images/doctor1.png',
        consultationsCount: 120,    
        status: 'Active',
    )];

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
