class RequestModel {
  final String name, experience, gender, subject, status, image;
  RequestModel({
    required this.name,
    required this.experience,
    required this.gender,
    required this.subject,
    required this.status,
    required this.image,
  });

  static List<RequestModel> fakeRequests = [
    RequestModel(
      name: "Ali Maged",
      experience: "12 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
    RequestModel(
      name: "Hany Adel",
      experience: "13 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "Replied",
      image: "assets/image/profile.png",
    ),
    RequestModel(
      name: "Samy Ahmed",
      experience: "10 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
    RequestModel(
      name: "Basel Mohamed",
      experience: "6 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
    RequestModel(
      name: "Shady Bassem",
      experience: "5 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
  ];
}
