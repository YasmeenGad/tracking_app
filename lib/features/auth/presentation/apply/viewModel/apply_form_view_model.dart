import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ApplyFormViewModel {
  List<dynamic> countries = [];
  String? selectedCountry;

  Future<void> loadCountries() async {
    final String response =
        await rootBundle.loadString('assets/files/country.json');
    final List<dynamic> data = json.decode(response);
    countries = data;
  }

  Future<String?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image?.name;
  }
}
