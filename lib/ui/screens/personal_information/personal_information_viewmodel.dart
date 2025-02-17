import 'dart:io';
import 'package:famlaika/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';

class PersonalInformationViewModel extends BaseViewModel {
  final GlobalKey<FormState> personalInformationFormKey = GlobalKey<FormState>();

  File? image;
  int? selectedIndex;
  DateTime? picked;

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
    picked = await showDatePicker(
      context: context,
      initialDate: picked != null
          ? DateTime.fromMillisecondsSinceEpoch(picked!.millisecondsSinceEpoch)
          : DateTime.now(),
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
      final formattedDate = DateFormat('dd/MM/yyyy').format(picked!);
      dateController.text = formattedDate;
      notifyListeners();
    }
  }

  onSelectionChanged(int index) {
    selectedIndex = index;
    print(selectedIndex);
    notifyListeners();
  }

  void submitPersonalDetails() {
    final state = personalInformationFormKey.currentState;
    late String name;
    late String dob;
    if (state != null) {
      state.validate();
      name = nameController.text.trim();

      if (dateController.text.isNotEmpty) {
        dob = dateController.text;
      }
    }

    navigationService.navigateTo(Routes.createFamilyTreeView);
  }
}
