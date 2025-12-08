import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointment_grey_container.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointment_item.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointments_add_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointments_app_bar.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointments_tab_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/view_past_appointments_button.dart';
import 'package:diagnosis_project/Feature/Doctor/Appointments/Presention/pages/appointments_search_page.dart';
import 'package:diagnosis_project/Feature/Doctor/Appointments/Presention/pages/appointment_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  int selectedIndex = 0;
  final List<Map<String, dynamic>> appointments = [
    {
      'name': 'Mohamed Reda',
      'age': 32,
      'time': '10.00 AM',
      'status': 'Follow-up'
    },
    {
      'name': 'Amira Mohamed',
      'age': 27,
      'time': '10.30 AM',
      'status': 'Follow-up'
    },
    {
      'name': 'Mohamed Ahmed',
      'age': 24,
      'time': '11.00 AM',
      'status': 'Follow-up'
    },
    {
      'name': 'Amal Ramadan',
      'age': 31,
      'time': '11.30 AM',
      'status': 'Follow-up'
    },
    {
      'name': 'Rawan Mohamed',
      'age': 48,
      'time': '12.00 PM',
      'status': 'Follow-up'
    },
    {
      'name': 'Shahd Mohamed',
      'age': 30,
      'time': '12.30 PM',
      'status': 'Follow-up'
    },
    {
      'name': 'Ahmed Reda',
      'age': 33,
      'time': '04.00 PM',
      'status': 'Follow-up'
    },
    {
      'name': 'Rawan Ali',
      'age': 48,
      'time': '12.00 PM',
      'status': 'New patient'
    },
    {
      'name': 'Ali Mohamed',
      'age': 30,
      'time': '12.30 PM',
      'status': 'New patient'
    },
    {
      'name': 'Fahmy Reda',
      'age': 33,
      'time': '04.00 PM',
      'status': 'New patient'
    },
    {'name': 'Reem Ali', 'age': 48, 'time': '12.00 PM', 'status': 'Urgent'},
    {
      'name': 'Walaa Mohamed',
      'age': 30,
      'time': '12.30 PM',
      'status': 'Urgent'
    },
    {'name': 'Ahmed Reda', 'age': 33, 'time': '04.00 PM', 'status': 'Urgent'},
  ];
  final List status = ["Follow-up", "New patient", "Urgent"];
  final List<Color> selectedColors = [
    AppColors.green,
    AppColors.orange,
    AppColors.RedError,
  ];

  List<Map<String, dynamic>> get filteredAppointments {
    return appointments.where((item) {
      return item['status'] == status[selectedIndex];
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppointmentsAppBar(
        title: "Appointments",
        onSearchPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AppointmentsSearchPage()),
          );
        },
      ),
      floatingActionButton: AppointmentsAddButton(
        onPressed: () {},
      ),
      body: Column(
        children: [
          Row(
            children: List.generate(
              3,
              (index) => AppointmentsTabButton(
                title: status[index],
                isSelected: selectedIndex == index,
                index: index,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ),
          const AppointmentGreyContainer(title: 'Today'),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return AppointmentItem(
                    image: "assets/image/person.png",
                    name: "${filteredAppointments[index]['name']}",
                    hintText:
                        "${filteredAppointments[index]['age']} years | Meeting on ${filteredAppointments[index]['time']}",
                    color: selectedColors[selectedIndex],
                    moreIconOnTap: () {},
                    rowOnTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppointmentDetails(
                                  patient: filteredAppointments[index],
                                )),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 20,
                    indent: 20.w,
                    endIndent: 20.w,
                    color: Colors.grey[300],
                  );
                },
                itemCount: filteredAppointments.length),
          ),
          ViewPastAppointmentsButton(
            onTap: () {},
          )
        ],
      ),
    );
  }
}
