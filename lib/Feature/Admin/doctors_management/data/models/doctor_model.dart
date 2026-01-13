class DoctorModel {
  final int id;
  final String image;
  final String name;
  final String experience;
  final String gender;
  final int consultationsCount;
  final String lastConsultationDate;
  final String status;

  DoctorModel({
    required this.id,
    required this.image,
    required this.name,
    required this.experience,
    required this.gender,
    required this.consultationsCount,
    required this.lastConsultationDate,
    required this.status,
  });

  static List<DoctorModel> fakeDoctorsList = [
    DoctorModel(
      id: 1,
      name: "Ali Maged",
      experience: "12 y",
      gender: "Male",
      consultationsCount: 8,
      lastConsultationDate: 'Dec 12,2025',
      status: "Active",
      image: "assets/image/profile.png",
    ),
    DoctorModel(
      id: 2,
      name: "Hany Adel",
      experience: "13 y",
      gender: "Male",
      consultationsCount: 8,
      lastConsultationDate: 'Dec 12,2025',
      status: "Active",
      image: "assets/image/profile.png",
    ),
    DoctorModel(
      id: 3,
      name: "Samy Ahmed",
      experience: "10 y",
      gender: "Male",
      consultationsCount: 8,
      lastConsultationDate: 'Dec 12,2025',
      status: "Active",
      image: "assets/image/profile.png",
    ),
    DoctorModel(
      id: 4,
      name: "Basel Mohamed",
      experience: "6 y",
      gender: "Male",
      consultationsCount: 8,
      lastConsultationDate: 'Dec 12,2025',
      status: "inActive",
      image: "assets/image/profile.png",
    ),
    DoctorModel(
      id: 5,
      name: "Shady Bassem",
      experience: "5 y",
      gender: "Male",
      consultationsCount: 8,
      lastConsultationDate: 'Dec 12,2025',
      status: "Active",
      image: "assets/image/profile.png",
    ),
    DoctorModel(
      id: 6,
      name: "Basel Mohamed",
      experience: "6 y",
      gender: "Male",
      consultationsCount: 8,
      lastConsultationDate: 'Dec 12,2025',
      status: "inActive",
      image: "assets/image/profile.png",
    ),
    DoctorModel(
      id: 7,
      name: "Basel Mohamed",
      experience: "6 y",
      gender: "Male",
      consultationsCount: 8,
      lastConsultationDate: 'Dec 12,2025',
      status: "inActive",
      image: "assets/image/profile.png",
    ),
  ];
}
