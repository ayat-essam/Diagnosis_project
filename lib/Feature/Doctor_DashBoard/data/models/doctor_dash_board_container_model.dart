class DoctorDashBoardContainerModel {
  final String title;
  final String imagePath;
  final String value;
  final Function() onTap;

  DoctorDashBoardContainerModel(
      {required this.title,
      required this.imagePath,
      required this.value,
      required this.onTap});
}
