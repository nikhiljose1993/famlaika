import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/app_colors.dart';
import '../../../models/country.dart';

class AddMemberViewModel extends BaseViewModel {
  GlobalKey<FormState> addMemberFormKey = GlobalKey<FormState>();

  Country selectedCountry = defaultCountry;
  File? image;
  int? selectedIndex;
  DateTime? picked;

  bool isAlive = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    relationController.dispose();
    phoneNumberEditingController.dispose();
    dateController.dispose();

    super.dispose();
  }

  void initializeRelation(String relation) {
    relationController.text = relation;
    notifyListeners();
  }

  skipTo() {}

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  isAliveChanged(bool value) {
    isAlive = value;
    print(isAlive);
    notifyListeners();
  }

  onGenderSelectionChanged(int index) {
    selectedIndex = index;
    print(selectedIndex);
    notifyListeners();
  }

  updateCountry(Country country) {
    selectedCountry = country;
    notifyListeners();
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

  submitAddMember() {
    final validate = addMemberFormKey.currentState!.validate();
    if (validate) {
      print(phoneNumberEditingController.text);
      print(selectedCountry.phoneCode);
    }
  }
}
