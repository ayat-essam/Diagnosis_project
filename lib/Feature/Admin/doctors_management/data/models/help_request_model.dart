class HelpRequestModel {
  final String name, experience, gender, subject, status, image;
  HelpRequestModel({
    required this.name,
    required this.experience,
    required this.gender,
    required this.subject,
    required this.status,
    required this.image,
  });

  static List<HelpRequestModel> fakeRequests = [
    HelpRequestModel(
      name: "Ali Maged",
      experience: "12 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
    HelpRequestModel(
      name: "Hany Adel",
      experience: "13 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "Replied",
      image: "assets/image/profile.png",
    ),
    HelpRequestModel(
      name: "Samy Ahmed",
      experience: "10 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
    HelpRequestModel(
      name: "Basel Mohamed",
      experience: "6 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
    HelpRequestModel(
      name: "Shady Bassem",
      experience: "5 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
  ];
}
