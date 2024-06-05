import 'dart:io';
import 'package:famlaika/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class PersonalInformationViewModel extends BaseViewModel {
  File? image;
  int? selectedIndex;

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> personalInformationFormKey =
      GlobalKey<FormState>();

  @override
  void dispose() {
    dateController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Palette.primary,
              onPrimary: Palette.scaffoldBackgroundColor,
              onSurface: Palette.foreground,
              surface: Palette.lightGrey,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Palette.foreground),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      dateController.text = formattedDate;
      notifyListeners();
    }
  }

  onSelectionChanged(int index) {
    selectedIndex = index;
    print(selectedIndex);
    notifyListeners();
  }

  void submitPersonalDetails() {}
}
