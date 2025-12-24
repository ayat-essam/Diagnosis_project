import 'package:flutter/material.dart';
import '../../../../../Core/Theme App/colors.dart';
import '../widgets/transactions_table_widget.dart';

class RecentTransactionsScreen extends StatelessWidget {
  const RecentTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.whiteBackground,
        appBar: AppBar(
          backgroundColor: AppColors.whiteBackground,
          elevation: 1,
          title: const Text(
            'Recent\nTransactions',
            style: TextStyle(
              color: AppColors.black,
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: AppColors.green,
            labelColor: AppColors.graySecondary,
            unselectedLabelColor: AppColors.graySecondary,
            tabs: [
              Tab(text: 'Completed'),
              Tab(text: 'Pending'),
              Tab(text: 'Cancelled'),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.BluePrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'back',
                  style: TextStyle(
                    color: AppColors.whiteBackground,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: TabBarView(
            children: [
              TransactionsTableContainer(),
              TransactionsTableContainer(),
              TransactionsTableContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
