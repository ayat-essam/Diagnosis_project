class DoctorModel {
  final int id;
  final String name;
  final String experience;
  final String gender;
  final String subject;
  final String status;
  final String image;

  DoctorModel({
    required this.id,
    required this.name,
    required this.experience,
    required this.gender,
    required this.subject,
    required this.status,
    required this.image,
  });

  static List<DoctorModel> fakeDoctorsList = [
    DoctorModel(
      id: 1,
      name: "Ali Maged",
      experience: "12 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
    DoctorModel(
      id: 2,
      name: "Hany Adel",
      experience: "13 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "Replied",
      image: "assets/image/profile.png",
    ),
    DoctorModel(
      id: 3,
      name: "Samy Ahmed",
      experience: "10 y",
      gender: "Male",
      subject: "Prescription Renewal Request",
      status: "New",
      image: "assets/image/profile.png",
    ),
  ];
}
