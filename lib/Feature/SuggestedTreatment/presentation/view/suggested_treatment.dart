import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Theme App/colors.dart';
import 'widgets/doctor_card.dart';
import 'widgets/duration_card.dart';
import 'widgets/effect_progress_bar.dart';
import 'widgets/frequancy_card.dart';
import 'widgets/info_card.dart';
import 'widgets/method_card.dart';
import 'widgets/side_effect_item.dart';

class SuggestedTreatmentScreen extends StatelessWidget {
  const SuggestedTreatmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.2),
        // shadowColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(Icons.menu, size: 24.sp, color: Color(0xff231F20)),
            Image.asset('assets/image/logo.png'),
            SizedBox(width: 80.w),
            Stack(clipBehavior: Clip.none, children: [
              Icon(Icons.notifications, size: 24.sp, color: Color(0xff231F20)),
              Positioned(
                bottom: 14,
                left: 15,
                child: Container(
                  width: 15.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: AppColors.BluePrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      '5',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              //SvgPicture.asset('assets/image_SVG/notification.svg'),
            ]),
            SizedBox(width: 10.w),
            CircleAvatar(
              radius: 18.r,
              backgroundImage: AssetImage('assets/image/profile.png'),
            ),
            SizedBox(width: 14.w),
          ]),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Suggested Treatment",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: Color(0xff505050)),
            ),
            const SizedBox(height: 16),

            /// Top Cards
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: const [
                DosageCard(),
                MethodCard(),
                FrequencyCard(),
                DurationCard(),
              ],
            ),

            const SizedBox(height: 20),

            /// Side Effects
            WhiteCard(
                child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent, // يلغي الخط
              ),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    const Icon(Icons.warning, color: Colors.red, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      'Side Effects & Warnings',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff505050),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                children: List.generate(
                  4,
                  (index) => const SideEffectItem(
                    leftText: 'Fatigue',
                    rightText: 'Severe Nerve Pain',
                  ),
                ),
              ),
            )),

            const SizedBox(height: 20),

            /// Alternatives
            WhiteCard(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffBACCEE),
                          child:
                              Icon(Icons.swap_horiz, color: Color(0xff4C84F7)),
                        ),
                        SizedBox(width: 40.w),
                        Text(
                          'Alternatives',
                          style: TextStyle(
                            color: Color(0xff505050),
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Docetaxel'),
                        Text('Nab-Paclitaxel'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Color(
                          0xffF5F5F5,
                        ),
                        border: Border.all(
                          color: Color(0xff3562BC),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Alternatives may have different side effects",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: Color(0xff4682FA)),
                        ),
                      ),
                    ),
                    const Text(
                      'Side Effects Comparisons',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    EffectBar(label: 'Hair Loss'),
                    EffectBar(label: 'Hair Loss'),
                    EffectBar(label: 'Hair Loss'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// Buttons
            WhiteCard(child: ButtonWidget()),
           
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 52),
            backgroundColor: const Color(0xff2F6FED),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text('Check Interactions',style: TextStyle(color: Colors.white),),
        ),
         const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text('Print Treatment Plan',style: TextStyle(color: Colors.blue),),
            ),

            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Any Questions?"),
                Text(" Contact team.",style: TextStyle(color: Colors.blue),),
              ],
            )
      ],
    );
  }
}
