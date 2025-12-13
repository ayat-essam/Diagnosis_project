import 'package:diagnosis_project/Feature/Doctor/Finance_Doctor/presentation/widgets/transaction_data_cell.dart';
import 'package:diagnosis_project/Feature/Doctor/Finance_Doctor/presentation/widgets/transactions_header_cell.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/Theme App/colors.dart';


class TransactionsTableContainer extends StatelessWidget {
  const TransactionsTableContainer({super.key});

  static const List<Map<String, dynamic>> transactions = [
    {
      'id': 'TXN-2024-1145',
      'patient': 'Mohamed',
      'type': 'Emergency',
      'amount': 250.0,
      'date': 'Nov 1, 2024',
    },
    {
      'id': 'TXN-2024-1146',
      'patient': 'Mohamed',
      'type': 'Specialist',
      'amount': 250.0,
      'date': 'Nov 2, 2024',
    },
    {
      'id': 'TXN-2024-1147',
      'patient': 'Mohamed',
      'type': 'Follow-up',
      'amount': 250.0,
      'date': 'Nov 3, 2024',
    },
    {
      'id': 'TXN-2024-1148',
      'patient': 'Mohamed',
      'type': 'Consultation',
      'amount': 250.0,
      'date': 'Nov 4, 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width * 0.9;

    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.dateSloteColor,
                AppColors.BluePrimary,
              ],
            ),
          ),
          padding: const EdgeInsets.all(2),
          child: Container(
            width: totalWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.grayF2,
            ),
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header
                  Row(
                    children: const [
                      TransactionsTableHeaderCell(text: 'Transaction ID'),
                      TransactionsTableHeaderCell(text: 'Patient'),
                      TransactionsTableHeaderCell(text: 'Session Type'),
                      TransactionsTableHeaderCell(text: 'Amount'),
                      TransactionsTableHeaderCell(text: 'Date'),
                    ].map(
                          (e) => SizedBox(width: 180, child: e),
                    ).toList(),
                  ),

                  const Divider(height: 1),

                  /// Rows
                  ...transactions.map(
                        (tx) => Row(
                      children: [
                        TransactionsTableDataCell(text: tx['id']),
                        TransactionsTableDataCell(text: tx['patient']),
                        TransactionsTableDataCell(text: tx['type']),
                        TransactionsTableDataCell(
                          text: '\$${tx['amount'].toStringAsFixed(2)}',
                        ),
                        TransactionsTableDataCell(text: tx['date']),
                      ].map(
                            (e) => SizedBox(width: 180, child: e),
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
