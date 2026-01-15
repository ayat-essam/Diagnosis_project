import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_bar_widget.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/screens/add_prescription.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/screens/treatment_plan.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/patient_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TreatmentMangment extends StatelessWidget {
  TreatmentMangment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PatientsMangementCubit>()..getpatients(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(20.w, 50.h), child: CustomAppBarWidget()),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Treatment Management",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30.h,
            ),
            patientData(),
            SizedBox(
                width: 350.w,
                height: 100.h,
                child: CustomLinearGradiantContainer(
                  child: Center(
                    child: ListTile(
                      title: const Text("Send Treatment Plan"),
                      leading: Image.asset("assets/image/Hand With a Pill.png"),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TreatmentPlanScreen()));
                        },
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 350.w,
              height: 100.h,
              child: CustomLinearGradiantContainer(
                  child: Center(
                child: ListTile(
                  title: const Text("Add Prescription"),
                  leading: Image.asset("assets/image/Treatment List.png"),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddPrescription()));
                    },
                  ),
                ),
              )),
            ),
          ]),
        ),
      ),
    );
  }
}
