class AdminDashboardEntity {
  final int totalDoctors;
  final String totalDoctorsChange;
  final int activeDoctors;
  final String activeDoctorsChange;
  final int totalPatients;
  final String totalPatientsChange;
  final String peakUsageTime;
  final List<DiagnosesOverTime> diagnosesOverTime;
  final List<TopDoctor> topDoctors;
  final List<RecentDiagnosis> recentDiagnoses;

  AdminDashboardEntity({
    required this.totalDoctors,
    required this.totalDoctorsChange,
    required this.activeDoctors,
    required this.activeDoctorsChange,
    required this.totalPatients,
    required this.totalPatientsChange,
    required this.peakUsageTime,
    required this.diagnosesOverTime,
    required this.topDoctors,
    required this.recentDiagnoses,
  });
}

class DiagnosesOverTime {
  final String month;
  final int doctorDiagnoses;
  final int aiDiagnoses;

  DiagnosesOverTime({
    required this.month,
    required this.doctorDiagnoses,
    required this.aiDiagnoses,
  });
}

class TopDoctor {
  final String doctorName;
  final int diagnosisCount;

  TopDoctor({required this.doctorName, required this.diagnosisCount});
}

class RecentDiagnosis {
  final String patientName;
  final DateTime date;
  final String time;
  final String provider;
  final String status;

  RecentDiagnosis({
    required this.patientName,
    required this.date,
    required this.time,
    required this.provider,
    required this.status,
  });
}
