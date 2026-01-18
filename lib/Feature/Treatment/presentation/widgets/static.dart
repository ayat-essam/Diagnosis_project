import 'package:diagnosis_project/Core/reusable_widgets/custom_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/treatmentCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class staticData extends StatelessWidget {
  const staticData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
                    "Dr. Jelen Kaya",
                  ),
                  const SizedBox(width: 12),
                  Treatmentcard(
                    "Duration",
                    "2 Weeks",
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
              child: const CustomLinearGradiantContainer(
                child: Center(
                  child: Text(
                    "Targeted therapy combined with standard chemotherapy...",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text("Key Medications",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            SizedBox(
                width: 300.w,
                height: 120.h,
                child: const CustomLinearGradiantContainer(
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Tamoxifen"), Text("20 mg dialy")],
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            SizedBox(
                width: 300.w,
                height: 120.h,
                child: const CustomLinearGradiantContainer(
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Tamoxifen"), Text("20 mg dialy")],
                    ),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Treatmentcard(
                    "Hydration",
                    "2.5 L water daily",
                  ),
                  const SizedBox(width: 12),
                  Treatmentcard(
                    "Restrictions",
                    "No Grap Fruit",
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Download PDF",
                  style: TextStyle(color: Color(0xff4682FA)),
                )),
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
                CustomButton(
                    text: "Send to patient",
                    onPressed: () {},
                    width: 100.w,
                    height: 35.h,
                    backgroundColor: Color(0xff4682FA),
                    textColor: Colors.white),
                const SizedBox(width: 12),
              ],
            )
          ],
        ),
      ),
    );
  }
}
