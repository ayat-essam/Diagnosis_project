import 'package:bloc/bloc.dart';
import 'consultation_state.dart';
class ConsultationCubit extends Cubit<ConsultationState>{
  final ConsultationRepo _repo;

  ConsultationCubit(this._repo):(super.initialState);

}