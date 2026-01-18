import '../../domain/entities/doctor_dashboard_entity.dart';

class DoctorDashboardModel extends DoctorDashboardEntity {
  DoctorDashboardModel({
    required super.totalConsultations,
    required super.totalTreatmentPlans,
    required super.newVsReturningPatients,
    required super.ratingStats,
    required super.earningsStats,
  });

  factory DoctorDashboardModel.fromJson(Map<String, dynamic> json) {
    return DoctorDashboardModel(
      totalConsultations: json['totalConsultations'],
      totalTreatmentPlans: json['totalTreatmentPlans'],
      newVsReturningPatients:
      (json['newVsReturningPatients'] as List)
          .map((e) => NewVsReturningModel.fromJson(e))
          .toList(),
      ratingStats: (json['ratingStats'] as List)
          .map((e) => RatingStatModel.fromJson(e))
          .toList(),
      earningsStats: (json['earningsStats'] as List)
          .map((e) => EarningStatModel.fromJson(e))
          .toList(),
    );
  }
}

class NewVsReturningModel extends NewVsReturningEntity {
  NewVsReturningModel({
    required super.day,
    required super.newPatients,
    required super.returningPatients,
  });

  factory NewVsReturningModel.fromJson(Map<String, dynamic> json) {
    return NewVsReturningModel(
      day: json['day'],
      newPatients: json['newPatients'],
      returningPatients: json['returningPatients'],
    );
  }
}

class RatingStatModel extends RatingStatEntity {
  RatingStatModel({
    required super.day,
    required super.averageRating,
  });

  factory RatingStatModel.fromJson(Map<String, dynamic> json) {
    return RatingStatModel(
      day: json['day'],
      averageRating: (json['averageRating'] as num).toDouble(),
    );
  }
}

class EarningStatModel extends EarningStatEntity {
  EarningStatModel({
    required super.day,
    required super.salary,
  });

  factory EarningStatModel.fromJson(Map<String, dynamic> json) {
    return EarningStatModel(
      day: json['day'],
      salary: (json['salary'] as num).toDouble(),
    );
  }
}
