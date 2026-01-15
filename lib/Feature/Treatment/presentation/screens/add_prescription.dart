import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_button.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/cubit/prescription/prescription_cubit.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/dosageInfo.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/dropButton.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/fastumCard.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/patient_data.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/SubmitPrescriptionButton.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/varibles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPrescription extends StatefulWidget {
  const AddPrescription({super.key});

  @override
  State<AddPrescription> createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<AddPrescription> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<AddPrescriptionCubit>(),
          ),
          BlocProvider(
              create: (context) => sl<PatientsMangementCubit>()..getpatients()),
        ],
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: BlocListener<AddPrescriptionCubit, AddPrescriptionState>(
            listener: (context, state) {
              if (state is AddPrescriptionAuthExpired) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Session expired, please login again')),
                );

                Navigator.pushReplacementNamed(context, '/login');
              }
              if (state is AddPrescriptionSuccess) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Success")));
                Navigator.of(context, rootNavigator: true).pop();
              }

              if (state is AddPrescriptionError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: Center(
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Add Prescription",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Edit active medications for current treatment cycle",
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                      const SizedBox(height: 16),
                      patientData(),
                      const SizedBox(height: 12),
                      const FastumCard(),
                      Row(
                        children: [
                          Expanded(child: buildInputField("Dosage", "20 mg")),
                          const SizedBox(width: 12),
                          Expanded(
                              child: buildDropdownField(
                                  items: durationOptions,
                                  label: "Duration",
                                  value: selectedDuration,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedDuration = newValue;
                                      durationController.text = newValue ?? "";
                                    });
                                  })),
                        ],
                      ),
                      const SizedBox(height: 12),
                      buildDropdownField(
                          label: "Frequency",
                          onChanged: (newValue) {
                            setState(() {
                              selectedFrequency = newValue;
                              frequencyController.text = newValue ?? "";
                            });
                          },
                          value: selectedFrequency,
                          items: frequencyOptions),
                      const SizedBox(height: 12),
                      buildInputField("Instructions",
                          "Take with food to avoid stomach upset."),
                      const SizedBox(height: 12),
                      buildInputField(
                          "Notes", "Add optional notes for medical records"),
                      const SizedBox(height: 20),
                      Text("Last Modified by doctor Ahmed on Dec 15",
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[500])),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomButton(
                            text: "Cancel",
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            backgroundColor: Colors.white,
                            width: 8.w,
                            textColor: Color(0xff747474),
                            height: 37.h,
                          ),
                          SubmitPrescriptionSection(
                            dosageController: dosageController,
                            durationController: durationController,
                            frequencyController: frequencyController,
                            instructionsController: instructionsController,
                            notesController: notesController,
                            patientId: patientId,
                          ),
                          const SizedBox(width: 12),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
