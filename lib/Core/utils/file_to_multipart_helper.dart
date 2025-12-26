import 'dart:io';
import 'package:dio/dio.dart';

List<MultipartFile> filesToMultipart(List<File> files) {
  return files
      .map(
        (file) => MultipartFile.fromFileSync(
          file.path,
          filename: file.path.split('/').last,
        ),
      )
      .toList();
}
