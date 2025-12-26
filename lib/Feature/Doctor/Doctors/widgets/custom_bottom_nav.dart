import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF4A8CFF),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _navItem(
              index: 0,
              icon: Icons.home_outlined,
              label: "Home",
            ),
            _navItem(
              index: 1,
              icon: Icons.hub_outlined,
              label: "Explore",
            ),
            _navItem(
              index: 2,
              icon: Icons.medical_services_outlined,
              label: "Doctors",
              isCenter: true,
            ),
            _navItem(
              index: 3,
              icon: Icons.settings_outlined,
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required int index,
    required IconData icon,
    required String label,
    bool isCenter = false,
  }) {
    bool selected = currentIndex == index;

    if (isCenter) {
      return GestureDetector(
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: selected ? Colors.black : Colors.white,
              ),
              const SizedBox(width: 6),
              if (selected)
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => onTap(index),
      child: Icon(
        icon,
        color: Colors.white,
        size: 26,
      ),
    );
  }
}
