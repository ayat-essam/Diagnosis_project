import 'dart:ui';

class MenuItemDoctors {
  final String title;
  final String ImagePath;
  final VoidCallback onTap;
  MenuItemDoctors({
    required this.title,
    required this.ImagePath,
    required this.onTap,
  });
}
