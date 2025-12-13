import 'package:flutter/material.dart';

class ConsultationForm extends StatelessWidget {
  const ConsultationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 138),
        decoration: BoxDecoration(
            color: const Color(0xffEEEEEE),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xff6B6B6B))),
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  'Select a consultation from \n    the list to review details',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: Color(0xff6B6B6B),
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                  'Or open one of the new requests to \n            start the workflow.',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      color: Color(0xff4A5565),
                      fontWeight: FontWeight.w400)),
            ]));
  }
}
