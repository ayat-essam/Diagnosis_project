import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/admin_dashboard_entity.dart';
import '../../domain/usecases/get_admin_dashboard_usecase.dart';

part 'admin_dashboard_state.dart';

class AdminDashboardCubit extends Cubit<AdminDashboardState> {
  final GetAdminDashboardUseCase getAdminDashboardUseCase;

  AdminDashboardCubit(this.getAdminDashboardUseCase)
      : super(AdminDashboardInitial());

  Future<void> getDashboard() async {
    emit(AdminDashboardLoading());

    try {
      final data = await getAdminDashboardUseCase();
      emit(AdminDashboardSuccess(data));
    } catch (e) {
      emit(AdminDashboardError(e.toString()));
    }
  }
}
