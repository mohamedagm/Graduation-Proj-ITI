import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/themes/app_text_styles.dart';
import 'package:iti_project/core/utils/validator/other_validations.dart';
import 'package:iti_project/features/auth/presentation/widgets/custom_button.dart';
import 'package:iti_project/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:iti_project/features/home/data/models/user_model.dart/user_model.dart';
import 'package:iti_project/features/home/presentation/widgets/profile_image_picker.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  File? image;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  List<TextEditingController> controllers = [];
  List<String? Function(String?)?> validators = [];
  List<IconData> icons = [];
  List<String> hints = [];

  @override
  void initState() {
    super.initState();
    controllers = [
      nameController,
      phoneController,
      cityController,
      ageController,
      genderController,
    ];
    validators = [
      validationNameMethod(),
      validationPhoneMethod(),
      validationCityMethod(),
      validationAgeMethod(),
      validationGenderMethod(),
    ];
    icons = [
      Icons.person,
      Icons.phone,
      Icons.location_city,
      Icons.numbers,
      Icons.person_2,
    ];
    hints = [
      AppStrings.nameHint,
      AppStrings.phoneHint,
      AppStrings.cityHint,
      AppStrings.ageHint,
      AppStrings.genderHint,
    ];
  }

  @override
  void dispose() {
    super.dispose();
    for (var co in controllers) {
      co.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            spacing: 24,
            children: [
              ProfileImagePicker(
                image: image,
                onImagePicked: (file) {
                  setState(() {
                    image = file;
                  });
                },
              ),
              Column(
                spacing: 15,
                children: List.generate(
                  5,
                  (index) => CustomTextField(
                    hintText: hints[index],
                    controller: controllers[index],
                    validator: validators[index],
                    picon: icons[index],
                  ),
                ),
              ),
              CustomButton(
                backgroundColor: AppColors.kPrimaryColor,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    String imageUrl = AppStrings.setupDefImage;
                    // context.read<SetupProfileCubit>().uploadProfileImage(
                    //   image!,
                    //   widget.user.user!.uid,
                    // );
                    final userModel = UserModel(
                      uid: widget.userModel.uid,
                      name: nameController.text,
                      email: widget.userModel.email,
                      phone: phoneController.text,
                      photoUrl: imageUrl,
                      createdAt: DateTime.now(),
                      age: int.parse(ageController.text),
                      gender: genderController.text,
                    );
                  //  context.read<SetupProfileCubit>().saveUserDataC(userModel);
                  }
                },
                child: Text(
                  AppStrings.saveButton,
                  style: AppTextStyles.textButtonStyle,
                ),
              ),
              CustomButton(
                backgroundColor: AppColors.kPrimaryColor,
                onPressed: () {
                  for (var co in controllers) {
                    co.clear();
                  }
                },
                child: Text(
                  AppStrings.resetButton,
                  style: AppTextStyles.textButtonStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
