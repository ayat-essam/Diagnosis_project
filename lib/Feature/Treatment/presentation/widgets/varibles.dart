import 'package:flutter/material.dart';

final TextEditingController dosageController = TextEditingController();
final TextEditingController durationController = TextEditingController();
final TextEditingController frequencyController = TextEditingController();
final TextEditingController instructionsController = TextEditingController();
final TextEditingController notesController = TextEditingController();
final List<String> durationOptions = [
  "1 week",
  "1 month",
  "3 months",
  "6 months"
];
final List<String> frequencyOptions = [
  "Once daily",
  "Twice daily",
  "Every 8 hours"
];

final int patientId = 1;
String? selectedDuration = "3 months";
String? selectedFrequency = "Once daily morning";

