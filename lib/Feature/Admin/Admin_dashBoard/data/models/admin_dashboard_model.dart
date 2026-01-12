import '../../domain/entities/admin_dashboard_entity.dart';

class AdminDashboardModel extends AdminDashboardEntity {
  AdminDashboardModel({
    required super.totalDoctors,
    required super.totalDoctorsChange,
    required super.activeDoctors,
    required super.activeDoctorsChange,
    required super.totalPatients,
    required super.totalPatientsChange,
    required super.peakUsageTime,
    required super.diagnosesOverTime,
    required super.topDoctors,
    required super.recentDiagnoses,
  });

  factory AdminDashboardModel.fromJson(Map<String, dynamic> json) {
    return AdminDashboardModel(
      totalDoctors: json['totalDoctors'] ?? 0,
      totalDoctorsChange: json['totalDoctorsChange'] ?? '',
      activeDoctors: json['activeDoctors'] ?? 0,
      activeDoctorsChange: json['activeDoctorsChange'] ?? '',
      totalPatients: json['totalPatients'] ?? 0,
      totalPatientsChange: json['totalPatientsChange'] ?? '',
      peakUsageTime: json['peakUsageTime'] ?? '',
      diagnosesOverTime: (json['diagnosesOverTime'] as List<dynamic>?)
          ?.map((e) => DiagnosesOverTime(
        month: e['month'] ?? '',
        doctorDiagnoses: e['doctorDiagnoses'] ?? 0,
        aiDiagnoses: e['aiDiagnoses'] ?? 0,
      ))
          .toList() ??
          [],
      topDoctors: (json['topDoctors'] as List<dynamic>?)
          ?.map((e) => TopDoctor(
        doctorName: e['doctorName'] ?? '',
        diagnosisCount: e['diagnosisCount'] ?? 0,
      ))
          .toList() ??
          [],
      recentDiagnoses: (json['recentDiagnoses'] as List<dynamic>?)
          ?.map((e) => RecentDiagnosis(
        patientName: e['patientName'] ?? '',
        date: e['date'] != null
            ? DateTime.parse(e['date'])
            : DateTime.now(),
        time: e['time'] ?? '',
        provider: e['provider'] ?? '',
        status: e['status'] ?? '',
      ))
          .toList() ??
          [],
    );
  }
}
