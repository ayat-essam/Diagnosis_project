import 'dart:ui';

class MenuItemPatients {
  final String title;
  final String ImagePath;
  final VoidCallback onTap;
  final String iconPath;
  MenuItemPatients({
    required this.title,
    required this.ImagePath,
    required this.onTap,
    required this.iconPath,
  });
}
