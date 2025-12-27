import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointment_grey_container.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointment_item.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointments_app_bar.dart';
// import 'package:diagnosis_project/Feature/Doctor/Appointments/Presention/pages/appointment_details_page.dart';
import 'package:flutter/material.dart';

class AppointmentsSearchPage extends StatefulWidget {
  const AppointmentsSearchPage({super.key});

  @override
  State<AppointmentsSearchPage> createState() => _AppointmentsSearchPageState();
}

class _AppointmentsSearchPageState extends State<AppointmentsSearchPage> {
  TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> allAppointments = [
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

  List<Map<String, dynamic>> filteredList = [];

  FocusNode searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(searchFocus);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredList = [];
      });
      return;
    }

    final results = allAppointments.where((element) {
      return element['name'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredList = results;
    });

    // بعد الباك إند:
    /*
    final response = await http.get(...);
    setState(() {
      filteredList = apiResults;
    });
    */
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Follow-up":
        return AppColors.green;
      case "New patient":
        return AppColors.orange;
      case "Urgent":
        return AppColors.RedError;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppointmentsAppBar(
        textField: TextField(
          controller: searchController,
          onChanged: search,
          focusNode: searchFocus,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search Appointments",
            hintStyle: StyleApp.font14graySecondaryRegular,
          ),
        ),
        onSearchPressed: () {},
      ),
      body: Column(
        children: [
          const AppointmentGreyContainer(title: 'Results'),
          // results list
          Expanded(
            child: ListView.separated(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return AppointmentItem(
                  image: "assets/image/person.png",
                  name: "${filteredList[index]['name']}",
                  hintText:
                      "${filteredList[index]['age']} years | Meeting on ${filteredList[index]['time']}",
                  moreIconOnTap: () {},
                  rowOnTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AppointmentDetails(
                    //       patient: filteredList[index],
                    //     ),
                    //   ),
                    // );
                  },
                  color: getStatusColor(filteredList[index]['status']),
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 20,
                indent: 20,
                endIndent: 20,
                color: Colors.grey[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
