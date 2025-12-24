class DoctorModel {
  final String name, experience, gender, subject, status, image;
  DoctorModel({
    required this.name,
    required this.experience,
    required this.gender,
    required this.subject,
    required this.status,
    required this.image,
  });

  static List<DoctorModel> fakeDoctorsList = [
    DoctorModel(
      name: "Ali Maged",
      experience: "12 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
    DoctorModel(
      name: "Hany Adel",
      experience: "13 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "Replied",
      image: "assets/image/profile.png",
    ),
    DoctorModel(
      name: "Samy Ahmed",
      experience: "10 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
    DoctorModel(
      name: "Basel Mohamed",
      experience: "6 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
    DoctorModel(
      name: "Shady Bassem",
      experience: "5 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
  ];
}
