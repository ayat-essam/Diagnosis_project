import 'package:diagnosis_project/Feature/Consultations/Data/Mapper/consultation_mapper.dart';

import '../../Domain/entity/consultation.dart';
import '../models/conultation_model.dart';


extension ConsultationListMapper on List<ConsultationModel>{
  List<Consultation> get toEntity => map((model) => model.toEntity).toList();
}

extension ConsultationFromJson on Map<String, dynamic>{
  Consultation get toConsultation{
    final model = ConsultationModel.fromJson(this);
    return model.toEntity;
  }
}