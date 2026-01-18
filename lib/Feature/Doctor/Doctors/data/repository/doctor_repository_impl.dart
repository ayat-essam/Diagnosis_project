import '../../domain/entities/doctor_entity.dart';
import '../../domain/repository/doctor_repository.dart';
import '../data_sources/doctor_remote_data_source.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorRemoteDataSource remoteDataSource;

  DoctorRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<DoctorEntity>> getDoctorList() async {
    return await remoteDataSource.getDoctorList();
  }
}
