import 'dart:async';

import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/slider_bar_admin.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'Widgets/header_call.dart';
import 'Widgets/patient.dart';

class MyPatientsScreen extends StatefulWidget {
  const MyPatientsScreen({super.key});

  @override
  State<MyPatientsScreen> createState() => _MyPatientsScreenState();
}

class _MyPatientsScreenState extends State<MyPatientsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Patient> _patients = [];
  List<Patient> _filteredPatients = [];

  Timer? _searchDebounce;
  final TextEditingController _searchController = TextEditingController();

  int _currentPage = 1;
  static const int _itemsPerPage = 4;

  @override
  void initState() {
    super.initState();

    _initializePatients();

    _filteredPatients = List<Patient>.from(_patients);

    _searchController.addListener(_onSearchChanged);
  }

  void _initializePatients() {
    _patients.addAll([
      Patient(
        name: 'June 8min',
        id: 'P-D01',
        lastVisit: '2025-01-15',
        status: 'Active',
        contact: '+1 (555) 123-4567',
      ),
      Patient(
        name: 'John Smith',
        id: 'P-D02',
        lastVisit: '2025-01-14',
        status: 'Active',
        contact: '+1 (555) 123-4568',
      ),
      Patient(
        name: 'Emma Johnson',
        id: 'P-D03',
        lastVisit: '2025-01-13',
        status: 'Inactive',
        contact: '+1 (555) 123-4569',
      ),
      Patient(
        name: 'Michael Brown',
        id: 'P-D04',
        lastVisit: '2025-01-12',
        status: 'Active',
        contact: '+1 (555) 123-4570',
      ),
      Patient(
        name: 'Sarah Wilson',
        id: 'P-D05',
        lastVisit: '2025-01-11',
        status: 'Active',
        contact: '+1 (555) 123-4571',
      ),
      Patient(
        name: 'David Lee',
        id: 'P-D06',
        lastVisit: '2025-01-10',
        status: 'Inactive',
        contact: '+1 (555) 123-4572',
      ),
    ]);
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_searchDebounce?.isActive ?? false) {
      _searchDebounce!.cancel();
    }

    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          final query = _searchController.text.toLowerCase();
          if (query.isEmpty) {
            _filteredPatients = List<Patient>.from(_patients);
          } else {
            _filteredPatients = _patients
                .where((patient) => patient.name.toLowerCase().contains(query))
                .toList();
          }
          _currentPage = 1;
        });
      }
    });
  }

  List<Patient> get _currentPagePatients {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;

    if (startIndex >= _filteredPatients.length) {
      return [];
    }

    return _filteredPatients.sublist(
      startIndex,
      endIndex > _filteredPatients.length ? _filteredPatients.length : endIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SliderBarAdmin(),
      appBar: AppBar(
        backgroundColor: AppColors.whiteBackground,
        leadingWidth: 90,
        leading: Row(
          children: [
            IconButton(
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              icon: Icon(Icons.menu_outlined, color: AppColors.black),
            ),
            Image.asset(
              "assets/image/logo2.png",
              width: 40,
              height: 38,
            ),
          ],
        ),
        elevation: 0,
        foregroundColor: AppColors.gray,
        actions: [
          const Icon(
            Icons.notifications,
            color: AppColors.BluePrimary,
            size: 40,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: const CircleAvatar(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/image/person.png'),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.whiteBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            Text(
              "My Patients",
              style: StyleApp.font25LightGrayMedium,
            ),
            Text(
              "Manage Patient records and access their profiles",
              style: StyleApp.font10blackSecondryMedium,
            ),
            const Gap(40),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search patient by name",
                suffixIcon: const Icon(Icons.search_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            const Gap(12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  HeaderCell(text: 'Patient Name', flex: 2),
                  HeaderCell(text: 'ID'),
                  HeaderCell(text: 'Last Visit'),
                  HeaderCell(text: 'Status'),
                  HeaderCell(text: 'Contact Info', flex: 2),
                  HeaderCell(text: 'Action', flex: 2),
                ],
              ),
            ),
            const Gap(8),
            Expanded(
              child: _buildPatientsList(),
            ),
            _buildPaginationFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientsList() {
    if (_currentPagePatients.isEmpty) {
      return const Center(
        child: Text(
          'No patients found',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }
    return ListView.separated(
      itemCount: _currentPagePatients.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final patient = _currentPagePatients[index];
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              _buildDataCell(patient.name, flex: 2),
              _buildDataCell(patient.id),
              _buildDataCell(patient.lastVisit),
              _buildStatusCell(patient.status),
              _buildDataCell(patient.contact, flex: 2),
              _buildActionCell(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPaginationFooter() {
    final startItem = ((_currentPage - 1) * _itemsPerPage) + 1;
    final endItem = _currentPage * _itemsPerPage;
    final actualEndItem =
        endItem > _filteredPatients.length ? _filteredPatients.length : endItem;
    final hasPrevious = _currentPage > 1;
    final hasNext = _currentPage * _itemsPerPage < _filteredPatients.length;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Showing $startItem-$actualEndItem of ${_filteredPatients.length}',
            style: const TextStyle(color: Colors.grey),
          ),
          Row(
            children: [
              _buildPaginationButton(
                text: 'Previous',
                isEnabled: hasPrevious,
                onPressed: hasPrevious
                    ? () {
                        setState(() => _currentPage--);
                      }
                    : null,
              ),
              const SizedBox(width: 16),
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '$_currentPage',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const Gap(16),
              _buildPaginationButton(
                text: 'Next >',
                isEnabled: hasNext,
                onPressed: hasNext
                    ? () {
                        setState(() => _currentPage++);
                      }
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDataCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 14,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildStatusCell(String status) {
    final isActive = status == 'Active';

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColors.green : AppColors.orange,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? AppColors.green : AppColors.orange,
          ),
        ),
        child: Text(
          status,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isActive ? Colors.green[800] : Colors.orange[800],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildActionCell() {
    return Expanded(
      flex: 2,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[50],
          foregroundColor: Colors.blue[800],
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(color: Colors.blue[200]!),
          ),
          elevation: 0,
        ),
        child: const Text(
          'View Profile',
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }

  Widget _buildPaginationButton({
    required String text,
    required bool isEnabled,
    VoidCallback? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isEnabled ? Colors.white : Colors.grey[100],
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isEnabled ? Colors.grey[300]! : Colors.grey[200]!,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isEnabled ? Colors.grey[800] : Colors.grey[400],
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
