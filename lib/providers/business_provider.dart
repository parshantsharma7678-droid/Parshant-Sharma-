import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BusinessProvider extends ChangeNotifier {
  bool _isLoading = false;
  String _businessName = 'Parshant Brand EMS';
  String _statusText = 'Live updates sync pending...';
  String _revenue = '45,250';

  bool get isLoading => _isLoading;
  String get businessName => _businessName;
  String get statusText => _statusText;
  String get revenue => _revenue;

  Future<void> fetchBusinessData() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Replace with your actual Google Sheet ID
      final String sheetCsvUrl =
          'https://docs.google.com/spreadsheets/d/YOUR_SHEET_ID_HERE/export?format=csv';

      final response = await http.get(Uri.parse(sheetCsvUrl)).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        List<String> lines = const LineSplitter().convert(response.body);
        if (lines.length > 1) {
          List<String> firstDataRow = lines[1].split(',');
          _businessName = firstDataRow[0].replaceAll('"', '');
          _statusText = firstDataRow[1].replaceAll('"', '');
          _revenue = firstDataRow.length > 2
              ? firstDataRow[2].replaceAll('"', '')
              : '0';
        }
      }
    } catch (e) {
      print('Error fetching business data: $e');
      // Keep fallback data
    }

    _isLoading = false;
    notifyListeners();
  }

  void updateBusinessMetrics(String name, String status, String revenue) {
    _businessName = name;
    _statusText = status;
    _revenue = revenue;
    notifyListeners();
  }
}
