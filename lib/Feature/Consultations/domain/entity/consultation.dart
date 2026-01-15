import 'package:equatable/equatable.dart';

class Consultation extends Equatable {
  final int id;
  final String patientName;
  final DateTime patientBirthDate;
  final String patientGender;
  final String symptoms;
  final String? response;
  final DateTime requestDate;
  final String? notes;
  final List<String> attachments;
  final bool success;
  final String? errorMessage;

  const Consultation({
    required this.id,
    required this.patientName,
    required this.patientBirthDate,
    required this.patientGender,
    required this.symptoms,
    this.response,
    required this.requestDate,
    this.notes,
    required this.attachments,
    required this.success,
    this.errorMessage,
  });

  int get patientAge =>
      DateTime.now().difference(patientBirthDate).inDays ~/ 365;

  bool get isMale => patientGender.toLowerCase() == 'male';
  bool get isFemale => patientGender.toLowerCase() == 'female';

  bool get hasResponse => response != null && response!.isNotEmpty;
  bool get hasNotes => notes != null && notes!.isNotEmpty;
  bool get hasAttachments => attachments.isNotEmpty;

  String get formattedRequestDate =>
      '${requestDate.day}/${requestDate.month}/${requestDate.year}';

  String get formattedPatientInfo =>
      '$patientName, $patientAge years, $patientGender';

  bool get canBeAccepted => !hasResponse && success;
  bool get canBeModified => hasResponse && success;

  @override
  List<Object?> get props => [
        id,
        patientName,
        patientBirthDate,
        patientGender,
        symptoms,
        response,
        requestDate,
        notes,
        attachments,
        success,
        errorMessage,
      ];

  @override
  String toString() {
    return 'Consultation(id: $id, patient: $patientName, symptoms: $symptoms, hasResponse: $hasResponse)';
  }
}
