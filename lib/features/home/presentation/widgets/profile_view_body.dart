import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/utils/functions/custom_snack_bar.dart';
import 'package:iti_project/core/utils/validator/other_validations.dart';
import 'package:iti_project/features/auth/presentation/widgets/custom_button.dart';
import 'package:iti_project/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:iti_project/features/home/data/models/user_model.dart/user_model.dart';
import 'package:iti_project/features/home/presentation/manager/setupProfileCubit/setup_profile_cubit.dart';
import 'package:iti_project/features/home/presentation/widgets/profile_image_picker.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  File? image;
  late String defImg;
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController cityController;
  late TextEditingController ageController;
  late TextEditingController genderController;
  List<TextEditingController> controllers = [];
  List<String? Function(String?)?> validators = [];
  List<IconData> icons = [];
  List<String> hints = [];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.userModel.name);
    phoneController = TextEditingController(text: widget.userModel.phone);
    cityController = TextEditingController(text: widget.userModel.city);
    ageController = TextEditingController(
      text: widget.userModel.age.toString(),
    );
    genderController = TextEditingController(text: widget.userModel.gender);

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
            AppStrings.updatedSuccess,
            backgroundColor: Colors.green,
          );
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();
        } else if (state is SetupProfileFailure) {
          customSnackBar(context, state.errMsg, backgroundColor: Colors.red);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                spacing: 24,
                children: [
                  SizedBox(height: 5),
                  ProfileImagePicker(
                    deafultImage: widget.userModel.photoUrl,
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
                          uid: widget.userModel.uid,
                          name: nameController.text,
                          email: widget.userModel.email,
                          phone: phoneController.text,
                          photoUrl: imageUrl,
                          createdAt: DateTime.now(),
                          age: int.parse(ageController.text),
                          gender: genderController.text,
                          city: cityController.text,
                        );
                        bool hasChanged =
                            nameController.text != widget.userModel.name ||
                            phoneController.text != widget.userModel.phone ||
                            imageUrl != widget.userModel.photoUrl ||
                            ageController.text !=
                                widget.userModel.age.toString() ||
                            genderController.text != widget.userModel.gender ||
                            cityController.text != widget.userModel.city;
                        if (hasChanged) {
                          context.read<SetupProfileCubit>().saveUserDataC(
                            userModel,
                          );
                        }
                      }
                    },
                    child:
                        state is SetupProfileLoading
                            ? SizedBox(
                              height: 32,
                              width: 32,
                              child: CircularProgressIndicator(),
                            )
                            : Text(AppStrings.updateButton),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
