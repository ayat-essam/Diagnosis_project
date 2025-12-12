class NoitificationModel {
  final String title;
  final String subtitle;
  final bool isCompleted;
  final String image1;
  final String? image2;

  NoitificationModel(
      {required this.title,
      required this.subtitle,
      required this.isCompleted,
      required this.image1,
      this.image2});
}
