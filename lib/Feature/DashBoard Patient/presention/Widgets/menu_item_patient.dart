import 'dart:ui';

class MenuItemPatients{
  final String title;
  final String ImagePath;
  final VoidCallback onTap;
  MenuItemPatients(
  {
    required this.title,
  required this.ImagePath,
  required this.onTap,

});
}