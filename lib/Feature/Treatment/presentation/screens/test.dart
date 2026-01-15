import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/cubit/prescription/prescription_cubit.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/cubit/treatment_plan/treatment_plan_cubit.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/dosageInfo.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/dropButton.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/fastumCard.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/medicationCard.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/patient_data.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/SubmitPrescriptionButton.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/static.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/treatmentCard.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/varibles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class treatmentScreen extends StatefulWidget {
  const treatmentScreen({super.key});

  @override
  State<treatmentScreen> createState() => _treatmentScreenState();
}

class _treatmentScreenState extends State<treatmentScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<TreatmentCubit>(),
        child: Scaffold(
            backgroundColor: Colors.grey[200],
            body: BlocBuilder<TreatmentCubit, TreatmentState>(
              builder: (context, state) {
                if (state is TreatmentLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is TreatmentError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                if (state is TreatmentLoaded) {
                  final plan = state.plan;
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                          child: Row(
                            children: [
                              Treatmentcard(
                                "Doctor",
                                plan?.doctorName ?? "Dr. Jelen Kaya",
                              ),
                              const SizedBox(width: 12),
                              Treatmentcard(
                                "Duration",
                                plan?.duration ?? "2 Weeks",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text("Overview",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(
                          width: 300.w,
                          height: 120.h,
                          child: CustomLinearGradiantContainer(
                            child: Text(
                              plan?.overview ??
                                  "Targeted therapy combined with standard chemotherapy...",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text("Key Medications",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(height: 8),
                        // if (plan != null && plan.medications.isNotEmpty)
                        //   ...plan.medications
                        //       .map(
                        //         (m) => buildMedicationCard(
                        //           m.dosage ?? "20 mg",
                        //           m.medicationName ?? "Tamoxifen",
                        //         ),
                        //       )
                        //       .toList()
                        // else
                        //   const Text("No medications available"),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Treatmentcard(
                              "Hydration",
                              plan?.hydration ?? "2.5 L water daily",
                            ),
                            const SizedBox(width: 12),
                            Treatmentcard(
                              "Restrictions",
                              plan?.restrictions ?? "No Grap Fruit",
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                return staticData();
              },
            )));
  }
}
