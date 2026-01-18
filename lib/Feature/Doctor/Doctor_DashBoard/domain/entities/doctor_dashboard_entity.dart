class DoctorDashboardEntity {
  final int totalConsultations;
  final int totalTreatmentPlans;
  final List<NewVsReturningEntity> newVsReturningPatients;
  final List<RatingStatEntity> ratingStats;
  final List<EarningStatEntity> earningsStats;

  DoctorDashboardEntity({
    required this.totalConsultations,
    required this.totalTreatmentPlans,
    required this.newVsReturningPatients,
    required this.ratingStats,
    required this.earningsStats,
  });
}

class NewVsReturningEntity {
  final String day;
  final int newPatients;
  final int returningPatients;

  NewVsReturningEntity({
    required this.day,
    required this.newPatients,
    required this.returningPatients,
  });
}

class RatingStatEntity {
  final String day;
  final double averageRating;

  RatingStatEntity({
    required this.day,
    required this.averageRating,
  });
}

class EarningStatEntity {
  final String day;
  final double salary;

  EarningStatEntity({
    required this.day,
    required this.salary,
  });
}
