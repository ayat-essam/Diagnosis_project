abstract class ConsultationEntity {
  final int? id;
  final String? patientName;
  final String? patientGender;
  final String? patientBirthDate;
  final String? type;
  final String? symptoms;
  final dynamic response;
  final String? status;
  final String? requestDate;

  const ConsultationEntity({
    this.id,
    this.patientName,
    this.patientGender,
    this.patientBirthDate,
    this.type,
    this.symptoms,
    this.response,
    this.status,
    this.requestDate,
  });
}
