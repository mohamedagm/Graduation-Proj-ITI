import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/routing/app_routes.dart';
import 'package:iti_project/core/utils/functions/custom_snack_bar.dart';
import 'package:iti_project/core/utils/validator/other_validations.dart';
import 'package:iti_project/features/auth/presentation/widgets/custom_button.dart';
import 'package:iti_project/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:iti_project/features/home/data/models/user_model.dart/user_model.dart';
import 'package:iti_project/features/home/presentation/manager/setupProfileCubit/setup_profile_cubit.dart';
import 'package:iti_project/features/home/presentation/widgets/profile_image_picker.dart';

class SetupProfileViewBody extends StatefulWidget {
  const SetupProfileViewBody({super.key, required this.user});
  final UserCredential user;
  @override
  State<SetupProfileViewBody> createState() => _SetupProfileViewBodyState();
}

class _SetupProfileViewBodyState extends State<SetupProfileViewBody> {
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
    return BlocConsumer<SetupProfileCubit, SetupProfileState>(
      listener: (context, state) {
        if (state is SetupProfileSuccess) {
          customSnackBar(
            context,
            AppStrings.savedSuccess,
            backgroundColor: Colors.green,
          );
          GoRouter.of(
            context,
          ).pushReplacement(AppRoutes.home, extra: widget.user);
        } else if (state is SetupProfileFailure) {
          customSnackBar(context, state.errMsg, backgroundColor: Colors.red);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  spacing: 24,
                  children: [
                    ProfileImagePicker(
                      deafultImage: '',
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
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          String imageUrl = AppStrings.setupDefImage;
                          // context.read<SetupProfileCubit>().uploadProfileImage(
                          //   image!,
                          //   widget.user.user!.uid,
                          // );
                          final userModel = UserModel(
                            uid: widget.user.user!.uid,
                            name: nameController.text,
                            email: widget.user.user!.email!,
                            phone: phoneController.text,
                            photoUrl: imageUrl,
                            createdAt: DateTime.now(),
                            age: int.parse(ageController.text),
                            gender: genderController.text,
                            city: cityController.text,
                          );
                          context.read<SetupProfileCubit>().saveUserDataC(
                            userModel,
                          );
                        }
                      },
                      child:
                          state is SetupProfileLoading
                              ? SizedBox(
                                height: 32,
                                width: 32,
                                child: CircularProgressIndicator(),
                              )
                              : Text(AppStrings.saveButton),
                    ),
                    CustomButton(
                      onPressed: () {
                        for (var co in controllers) {
                          co.clear();
                        }
                      },
                      child: Text(AppStrings.resetButton),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
