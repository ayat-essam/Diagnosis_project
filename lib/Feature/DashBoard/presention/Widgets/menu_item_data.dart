

import 'dart:ui';

class MenuItemData{
  final String title;
  final String iconPath;
  final VoidCallback onTap;
  MenuItemData
      ({
    required this.title,
  required this.iconPath,
        required this.onTap,
});
}