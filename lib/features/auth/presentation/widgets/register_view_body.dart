import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iti_project/core/constants/app_assets.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/routing/app_routes.dart';
import 'package:iti_project/core/themes/app_text_styles.dart';
import 'package:iti_project/core/utils/functions/custom_snack_bar.dart';
import 'package:iti_project/core/utils/validator/validation_email_method.dart';
import 'package:iti_project/core/utils/validator/validation_password_method.dart';
import 'package:iti_project/features/auth/presentation/Manager/authCubit/auth_cubit.dart';
import 'package:iti_project/features/auth/presentation/widgets/custom_button.dart';
import 'package:iti_project/features/auth/presentation/widgets/custom_text_field.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool visible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          customSnackBar(
            context,
            AppStrings.registerSuccessMessage,
            backgroundColor: Colors.green,
          );
          GoRouter.of(context).pushReplacement(AppRoutes.home);
        } else if (state is AuthFailure) {
          customSnackBar(
            context,
            state.errMeasage,
            backgroundColor: Colors.red,
            borderRadius: 16,
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.registerTitle,
                      style: AppTextStyles.authTitleStyle,
                    ),
                    Text(
                      AppStrings.registerSubtitle,
                      style: AppTextStyles.authSubTitleStyle,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: AppStrings.authEmailHint,
                      controller: emailController,
                      validator: validationEmailMethod(context: context),
                      picon: Icons.person,
                    ),
                    CustomTextField(
                      hintText: AppStrings.authPasswordHint,
                      controller: passwordController,
                      validator: validationPasswordMethod(context: context),
                      picon: Icons.password,
                      visible: visible,
                      sicon: IconButton(
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        icon:
                            visible
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                      ),
                    ),
                    CustomButton(
                      backgroundColor: AppColors.kPrimaryColor,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().registerEmailPasswordC(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                      child:
                          state is AuthLoading
                              ? const SizedBox(
                                height: 32,
                                width: 32,
                                child: CircularProgressIndicator(),
                              )
                              : Text(
                                AppStrings.registerButtonSignUp,
                                style: AppTextStyles.authButtonStyle,
                              ),
                    ),
                    CustomButton(
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 32,
                            child: Image.asset(AppAssets.googleIcon),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            AppStrings.authGoogleSignIn,
                            style: AppTextStyles.authGoogleSignInStyle,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.registerHaveAccount,
                          style: AppTextStyles.authAccountStyle,
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).push(AppRoutes.login);
                          },
                          child: Text(
                            AppStrings.registerLogin,
                            style: AppTextStyles.authGoogleSignInStyle,
                          ),
                        ),
                      ],
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
