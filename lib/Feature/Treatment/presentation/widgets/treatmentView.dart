import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/entities/treatment_plan.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/medicationCard.dart';

import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/treatmentCard.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildContent(TreatmentPlanEntity? plan) {
  return Padding(
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 8),
        if (plan != null && plan.medications.isNotEmpty)
          ...plan.medications.map(
            (m) => buildMedicationCard(
              m.dosage ?? "20 mg",
              m.medicationName ?? "Tamoxifen",
            ),
          )
        else
          const Text("No medications available"),
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
