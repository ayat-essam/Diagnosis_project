import 'package:diagnosis_project/Feature/Diagnosis%20Module/widgets/base_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManualSymptomsCard extends StatelessWidget {
  const ManualSymptomsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Manual Symptoms Entry',
            style: TextStyle(
              color: Color(0xff505050),
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'please enter all information about your symptoms to receive accurate diagnosis.',
            style: TextStyle(
                color: Color(0xff777777),
                fontSize: 15.sp,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 16),
          BoxWidget(text: 'Add your symptoms',icon: Icons.add,),
          const SizedBox(height: 12),
          BoxWidget(text: 'Describe your case',icon: Icons.edit,),
          
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 52),
              backgroundColor: const Color(0xff4C84F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text('Analyze',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
   BoxWidget({
    super.key,
    required this.text,
    required this.icon
  });
  String text;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Color(0xff4682FA),
          width: 1.5,
        ),
        minimumSize: const Size(double.infinity, 48),
        padding: EdgeInsets.symmetric(horizontal: 1.5, vertical: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      icon:  Icon(
        icon,
        color: Color(0xff4682FA),
      ),
      label: Text(
        text,
        style: TextStyle(
            color: Color(0xff4682FA),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
