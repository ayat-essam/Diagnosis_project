import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Theme App/colors.dart';
import '../../../../Core/api/dio_consumer.dart';
import '../../../../Core/reusable_widgets/custom_app_bar.dart';
import '../../../../Core/reusable_widgets/search_bar_widget.dart';
import '../../../DashBoard Patient/presention/Widgets/slider_bar.dart';
import '../../data/cubit/help_cubit.dart';
import '../../data/datasource/help_remote_data_source.dart';
import '../../data/repository/help_repo_impl.dart';
import '../../domain/usecases/create_ticket_usecase.dart';
import '../../domain/usecases/get_faqs_usecase.dart';
import '../widgets/contact_support_item.dart';
import '../widgets/faqItem.dart';


class HelpScreenWrapper extends StatelessWidget {
  const HelpScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final apiConsumer = DioConsumer(dio: Dio());
    final remote = HelpRemoteDataSourceImpl(apiConsumer);
    final repo = HelpRepositoryImpl(remote);

    return BlocProvider(
      create: (_) => HelpCubit(
        getFaqsUseCase: GetFaqsUseCase(repo),
        createTicketUseCase: CreateTicketUseCase(repo),
      )..getFaqs("patient"),
      child: const HelpScreen(),
    );
  }
}




class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      key: _scaffoldKey,
      drawer: const SliderBar(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: CustomAppBar(
          showMenu: true,
          onMenuTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          showLogo: true,
          logoPath: "assets/image/logo2.png",
          appName: "Diagnosis",
          notificationCount: 5,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarWidget(
                hintText: 'Search...',
              ),
              FaqExpansionList(),
              ContactSupportItem(),
            ],
          ),
        ),
      ),
    );
  }
}
