import 'dart:ui';

class MenuItemData{
  final String title;
  final String iconPath;
  final VoidCallback onTab;
  MenuItemData
      ({
    required this.title,
  required this.iconPath,
        required this.onTab,
});
}