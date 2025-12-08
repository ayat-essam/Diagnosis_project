import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointment_grey_container.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointment_item.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointments_add_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointments_app_bar.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointments_tab_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/view_past_appointments_button.dart';
import 'package:diagnosis_project/Feature/Patient/Appointments/Presention/pages/appointment_details_page.dart';
import 'package:diagnosis_project/Feature/Patient/Appointments/Presention/pages/appointments_search_page.dart';
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
      'specialty': "Cardiologist",
      'time': '10.00 AM',
      'status': 'Confirmed'
    },
    {
      'name': 'Amira Mohamed',
      'specialty': "Cardiologist",
      'time': '10.30 AM',
      'status': 'Confirmed'
    },
    {
      'name': 'Mohamed Ahmed',
      'specialty': "Cardiologist",
      'time': '11.00 AM',
      'status': 'Confirmed'
    },
    {
      'name': 'Amal Ramadan',
      'specialty': "Cardiologist",
      'time': '11.30 AM',
      'status': 'Confirmed'
    },
    {
      'name': 'Rawan Mohamed',
      'specialty': "Cardiologist",
      'time': '12.00 PM',
      'status': 'Confirmed'
    },
    {
      'name': 'Shahd Mohamed',
      'specialty': "Cardiologist",
      'time': '12.30 PM',
      'status': 'Confirmed'
    },
    {
      'name': 'Ahmed Reda',
      'specialty': "Cardiologist",
      'time': '04.00 PM',
      'status': 'Confirmed'
    },
    {
      'name': 'Rawan Ali',
      'specialty': "Cardiologist",
      'time': '12.00 PM',
      'status': 'Pending'
    },
    {
      'name': 'Ali Mohamed',
      'specialty': "Cardiologist",
      'time': '12.30 PM',
      'status': 'Pending'
    },
    {
      'name': 'Fahmy Reda',
      'specialty': "Cardiologist",
      'time': '04.00 PM',
      'status': 'Pending'
    },
    {'name': 'Reem Ali', 'specialty': "Cardiologist", 'time': '12.00 PM', 'status': 'Cancelled'},
    {
      'name': 'Walaa Mohamed',
      'specialty': "Cardiologist",
      'time': '12.30 PM',
      'status': 'Cancelled'
    },
    {'name': 'Ahmed Reda', 'specialty': "Cardiologist", 'time': '04.00 PM', 'status': 'Cancelled'},
  ];
  final List status = ["Confirmed", "Pending", "Cancelled"];
  final List<Color> selectedColors = [
    AppColors.green, // زرار 1
    AppColors.orange, // زرار 2
    AppColors.RedError, // زرار 3
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
                // ["Follow-up", "New patient", "Urgent"][index],
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
          // Appointments List
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return AppointmentItem(
                    image: "assets/image/Group.png",
                    color: selectedColors[selectedIndex],
                    hintText:"${filteredAppointments[index]['specialty']} | Meeting ${filteredAppointments[index]['time']}",
                    name: "Dr. ${filteredAppointments[index]['name']}",
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
