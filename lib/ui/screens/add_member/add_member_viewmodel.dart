import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:famlaika/constants/app_strings.dart';
import 'package:famlaika/constants/assets.gen.dart';
import 'package:famlaika/ui/tools/screen_size.dart';
import 'package:famlaika/ui/widgets/animated_renew_icon.dart';
import 'package:famlaika/ui/widgets/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

import '../../../app/app.locator.dart';
import '../../../constants/app_colors.dart';
import '../../../models/country.dart';
import '../../../services/theme_service.dart';

class AddMemberViewModel extends BaseViewModel {
  GlobalKey<FormState> addMemberFormKey = GlobalKey<FormState>();

  final theme = locator<ThemeService>().theme;

  Country selectedCountry = defaultCountry;
  File? image;
  int? selectedIndex;
  DateTime? picked;

  bool isAlive = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController generatedCodeController = TextEditingController();

  final Uuid _uuid = const Uuid();

  static const svgTheme = SvgTheme(currentColor: Palette.foreground);

  @override
  void dispose() {
    nameController.dispose();
    relationController.dispose();
    phoneNumberEditingController.dispose();
    dateController.dispose();
    generatedCodeController.dispose();

    super.dispose();
  }

  void initializeRelation(String relation) {
    relationController.text = relation;
    notifyListeners();
  }

  void closeModalBottomSheet(BuildContext context) {
    Navigator.pop(context);
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

  isAliveChanged(BuildContext context) {
    isAlive = !isAlive;
    notifyListeners();

    if (!isAlive) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Palette.scaffoldBackgroundColor,
        builder: (context) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 269, minWidth: ScreenSize.width),
            child: Column(
              children: [
                const Spacer(flex: 24),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: GestureDetector(
                        onTap: () => closeModalBottomSheet(context),
                        child: SvgPicture.asset(Assets.svg.close, theme: svgTheme)),
                  ),
                ),
                const Spacer(flex: 24),
                SvgPicture.asset(Assets.svg.personIsNotAlive, theme: svgTheme),
                const Spacer(flex: 15),
                Text(AppStrings.personIsNotAlive, style: theme.textTheme.headlineMedium),
                const Spacer(flex: 20),
                Text(AppStrings.personIsNotAliveInfo,
                    style: theme.textTheme.labelSmall, textAlign: TextAlign.center),
                const Spacer(flex: 23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customButton(
                      buttonText: AppStrings.link,
                      width: 156.w,
                      onTap: () => closeIsAliveAndOpenLink(context),
                    ),
                    customButton(
                      buttonText: AppStrings.generate,
                      width: 156.w,
                      onTap: () => closeIsAliveAndOpenGenerate(context),
                    ),
                  ],
                ),
                const Spacer(flex: 40),
              ],
            ),
          );
        },
      );
    }
  }

  Future<void> closeIsAliveAndOpenLink(BuildContext context) async {
    Navigator.pop(context);
    await Future.delayed(const Duration(milliseconds: 100));
    if (!context.mounted) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Palette.scaffoldBackgroundColor,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 315, minWidth: ScreenSize.width),
              child: Padding(
                padding: EdgeInsets.only(bottom: ScreenSize.data.viewInsets.bottom),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 18),
                          child: GestureDetector(
                              onTap: () => closeModalBottomSheet(context),
                              child: SvgPicture.asset(Assets.svg.close, theme: svgTheme)),
                        ),
                      ),
                      SvgPicture.asset(Assets.svg.link, theme: svgTheme),
                      const SizedBox(height: 20),
                      Text(AppStrings.linkCode, style: theme.textTheme.headlineMedium),
                      const SizedBox(height: 14),
                      Text(AppStrings.linkCodeInfo,
                          style: theme.textTheme.labelSmall, textAlign: TextAlign.center),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(4),
                          dashPattern: const [5, 5],
                          color: Palette.inputBorder,
                          padding: const EdgeInsets.all(0),
                          child: Container(
                            constraints: const BoxConstraints(maxHeight: 34),
                            decoration: BoxDecoration(
                              color: Palette.inputGrey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 18, left: 10),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customButton(
                            buttonText: AppStrings.cancel,
                            bgColor: Palette.inputFormHint,
                            fgColor: Palette.foreground,
                            width: 156.w,
                            onTap: () => closeIsAliveAndOpenLink(context),
                          ),
                          customButton(buttonText: AppStrings.confirm, width: 156.w, onTap: () {}),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> closeIsAliveAndOpenGenerate(BuildContext context) async {
    Navigator.pop(context);
    await Future.delayed(const Duration(milliseconds: 100));
    if (!context.mounted) return;

    generateCode();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Palette.scaffoldBackgroundColor,
      builder: (context) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 269, minWidth: ScreenSize.width),
          child: Column(
            children: [
              const Spacer(flex: 24),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: GestureDetector(
                      onTap: () => closeModalBottomSheet(context),
                      child: SvgPicture.asset(Assets.svg.close, theme: svgTheme)),
                ),
              ),
              const Spacer(flex: 24),
              SvgPicture.asset(Assets.svg.personIsNotAlive, theme: svgTheme),
              const Spacer(flex: 15),
              Text(AppStrings.generateCode, style: theme.textTheme.headlineMedium),
              const Spacer(flex: 20),
              Text(AppStrings.generateCodeInfo,
                  style: theme.textTheme.labelSmall, textAlign: TextAlign.center),
              const Spacer(flex: 23),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(4),
                    dashPattern: const [5, 5],
                    color: Palette.inputBorder,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      constraints: const BoxConstraints(maxHeight: 34),
                      decoration: BoxDecoration(
                        color: Palette.inputGrey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextFormField(
                        controller: generatedCodeController,
                        readOnly: true,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                        decoration: InputDecoration(
                          constraints: BoxConstraints(maxWidth: 236.w),
                          contentPadding: const EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 6, bottom: 6),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                copyToClipboard(context);
                              },
                              child: SvgPicture.asset(Assets.svg.contentCopy, theme: svgTheme),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  RotatingRenew(generateCode: generateCode)
                ],
              ),
              const Spacer(flex: 16),
              GestureDetector(
                onTap: () {
                  shareCode();
                },
                child: IntrinsicWidth(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.svg.share,
                        theme: const SvgTheme(currentColor: Palette.primary),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        AppStrings.shareCode,
                        style: theme.textTheme.bodySmall!.copyWith(color: Palette.primary),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 36),
            ],
          ),
        );
      },
    );
  }

  void onGenderSelectionChanged(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void updateCountry(Country country) {
    selectedCountry = country;
    notifyListeners();
  }

  void generateCode() {
    String uuid = _uuid.v4();
    generatedCodeController.text = 'generatedcode/FamlaikaXr@$uuid';
  }

  void copyToClipboard(context) {
    final text = generatedCodeController.text;
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard!')),
    );
  }

  void shareCode() {
    Share.share(generatedCodeController.text);
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
    if (validate) {}
  }
}
