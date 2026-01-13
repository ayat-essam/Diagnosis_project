import '../entities/doctor_entity.dart';
import '../repository/doctor_repository.dart';

class GetDoctorListUseCase {
  final DoctorRepository repository;

  GetDoctorListUseCase(this.repository);

  Future<List<DoctorEntity>> call() {
    return repository.getDoctorList();
  }
}
