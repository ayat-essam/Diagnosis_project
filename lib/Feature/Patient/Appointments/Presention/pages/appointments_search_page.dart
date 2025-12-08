import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointment_grey_container.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointment_item.dart';
import 'package:diagnosis_project/Core/reusable_widgets/appointments_app_bar.dart';
import 'package:diagnosis_project/Feature/Patient/Appointments/Presention/pages/appointment_details_page.dart';
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
    {
      'name': 'Reem Ali',
      'specialty': "Cardiologist",
      'time': '12.00 PM',
      'status': 'Cancelled'
    },
    {
      'name': 'Walaa Mohamed',
      'specialty': "Cardiologist",
      'time': '12.30 PM',
      'status': 'Cancelled'
    },
    {
      'name': 'Ahmed Reda',
      'specialty': "Cardiologist",
      'time': '04.00 PM',
      'status': 'Cancelled'
    },
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
      case "Confirmed":
        return AppColors.green;
      case "Pending":
        return AppColors.orange;
      case "Cancelled":
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
                  image: "assets/image/Group.png",
                  name: "Dr. ${filteredList[index]['name']}",
                  hintText:
                      "${filteredList[index]['specialty']} | Meeting ${filteredList[index]['time']}",
                  moreIconOnTap: () {},
                  rowOnTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentDetails(
                          patient: filteredList[index],
                        ),
                      ),
                    );
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
