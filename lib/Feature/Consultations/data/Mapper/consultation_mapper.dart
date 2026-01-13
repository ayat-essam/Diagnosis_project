<<<<<<< HEAD
import '../../Domain/entity/consultation.dart';
import '../models/conultation_model.dart';

extension ConsultationMapper on ConsultationModel {
  Consultation get toEntity => Consultation(
        id: id,
        patientName: patientName,
        patientBirthDate: DateTime.parse(patientBirthDate),
        patientGender: patientGender,
        symptoms: symptoms,
        response: response,
        requestDate: DateTime.parse(requestDate),
        notes: notes,
        attachments: attachments,
        success: success,
        errorMessage: errorMessage,
      );
}
=======
// import '../../Domain/entity/consultation.dart';
// import '../models/conultation_model.dart';
//
// extension ConsultationMapper on ConsultationModel {
//   Consultation get toEntity => Consultation(
//     id: id,
//     patientName: patientName,
//     patientBirthDate: DateTime.parse(patientBirthDate),
//     patientGender: patientGender,
//     symptoms: symptoms,
//     response: response,
//     requestDate: DateTime.parse(requestDate),
//     notes: notes,
//     attachments: attachments,
//     success: success,
//     errorMessage: errorMessage,
//   );
// }
>>>>>>> b59bc0e0c30810bbf52f75671c3352d782c29bc0
