
import '../../domain/entity/physiotherapy_result_entity.dart';

abstract class PhysiotherapyState {
  const PhysiotherapyState();
}

class PhysiotherapyInitial extends PhysiotherapyState {
  const PhysiotherapyInitial();
}

class PhysiotherapyLoading extends PhysiotherapyState {
  const PhysiotherapyLoading();
}

class PhysiotherapySuccess extends PhysiotherapyState {
  final PhysiotherapyResultEntity result;
  const PhysiotherapySuccess(this.result);
}

class PhysiotherapyError extends PhysiotherapyState {
  final String message;
  const PhysiotherapyError(this.message);
}