import 'package:flutter/material.dart';

class XRayMediaSection extends StatelessWidget {
  const XRayMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'X-Ray Media',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Color(0xff252525),
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 152 / 172,
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _xRayItem(
              image: 'assets/image/x-ray1.png',
            ),
            _xRayItem(
              image: 'assets/image/x-ray2.png',
            ),
            _xRayItem(
              image: 'assets/image/x-ray3.png',
            ),

            // Add Button
            _addItem(),
          ],
        ),
      ],
    );
  }

  Widget _xRayItem({required String image}) {
    return AspectRatio(
      aspectRatio: 152 / 172,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _addItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffF7F7F7),
      ),
      child: const Center(
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.black,
        ),
      ),
    );
  }
}
