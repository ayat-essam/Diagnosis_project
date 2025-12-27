import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drug_checkerr_state.dart';

class DrugCheckerrCubit extends Cubit<DrugCheckerrState> {
  DrugCheckerrCubit() : super(DrugCheckerrInitial());
}
