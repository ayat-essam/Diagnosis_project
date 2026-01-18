import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String experience;
  final String nextAvailable;
  final String rating;
  final String reviews;
  final String image;
  final VoidCallback onBook;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.experience,
    required this.nextAvailable,
    required this.rating,
    required this.reviews,
    required this.image,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue.shade300, width: 1.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage(image),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$specialty - $experience yrs exp",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Next available: $nextAvailable",
                    style: TextStyle(fontSize: 13.sp, color: Color(0xff777777)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(color: Color(0xff77777766), thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Color(0xffFA8014), size: 20),
                  const SizedBox(width: 5),
                  Text(
                    rating,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xffFA8014),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    " ($reviews)",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xff777777),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onBook,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff4682FA),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 45.h, vertical: 20.h),
                ),
                child: const Text("Book",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
