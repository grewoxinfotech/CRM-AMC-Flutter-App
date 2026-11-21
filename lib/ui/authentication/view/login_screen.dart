
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raiser_amc/core/utils/app_validators.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/core/utils/custom_snackbar.dart';
import 'package:raiser_amc/core/utils/custom_text_field.dart';
import 'package:raiser_amc/ui/authentication/view/register_screen.dart';
import 'package:raiser_amc/ui/company_panel/home_screen/view/company_home_screen.dart';
import 'package:sizer/sizer.dart';

import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordLogin = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController =
  TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void handleLogin() {

    if (isPasswordLogin) {
      AppSnackbar.show(
        title: 'Login',
        message: 'Login submitted successfully!',
        isSuccess: true,
      );

      Get.off(() =>  CompanyHomeScreen());

      // TODO: Integrate Login API here.
    } else {
      AppSnackbar.show(
        title: 'OTP Login',
        message: 'OTP request submitted successfully!',
        isSuccess: true,
      );


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFE4EEFF),
                    Color(0xFFF8FAFC),
                    Color(0xFFF1F5FC),
                  ],
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: 1),
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeOutCubic,
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value,
                              child: Transform.translate(
                                offset: Offset(0, 25 * (1 - value)),
                                child: child,
                              ),
                            );
                          },
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 3.h),

                                // LOGO
                                Container(
                                  height: 25.w,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF3978FF),
                                        Color(0xFF4F46E5),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primary.withValues(
                                          alpha: 0.25,
                                        ),
                                        blurRadius: 15,
                                        offset: const Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.layers_rounded,
                                    color: AppColors.white,
                                    size: 35.sp,
                                  ),
                                ),

                                SizedBox(height: 1.5.h),

                                Text(
                                  'RAISER AMC',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: AppFonts.bold,
                                    color: AppColors.primary,
                                    letterSpacing: 1.2,
                                  ),
                                ),

                                SizedBox(height: 0.8.h),

                                Text(
                                  'Sign in to your account',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 19.sp,
                                    fontFamily: AppFonts.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),

                                SizedBox(height: 0.5.h),

                                Text(
                                  'Welcome back to Raiser AMC',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: AppFonts.regular,
                                    color: AppColors.textSecondary,
                                  ),
                                ),

                                SizedBox(height: 4.h),

                                // LOGIN FIELDS
                                AnimatedSize(
                                  duration: const Duration(milliseconds: 350),
                                  curve: Curves.easeInOut,
                                  alignment: Alignment.topCenter,
                                  child: AnimatedSwitcher(
                                    duration: const Duration(
                                      milliseconds: 350,
                                    ),
                                    switchInCurve: Curves.easeOutCubic,
                                    switchOutCurve: Curves.easeInCubic,
                                    transitionBuilder: (child, animation) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: SizeTransition(
                                          sizeFactor: animation,
                                          axisAlignment: -1,
                                          child: child,
                                        ),
                                      );
                                    },
                                    child: isPasswordLogin
                                        ? Column(
                                      key: const ValueKey('password_mode'),
                                      children: [
                                        // EMAIL FIELD
                                        CustomTextField(
                                          label: 'Email Address',
                                          hintText: 'Enter your email',
                                          inputType:
                                          TextInputType.emailAddress,
                                          prefixIcon:
                                          Icons.email_outlined,
                                          controller: emailController,
                                          validator:
                                          AppValidators.validateEmail,
                                        ),

                                        SizedBox(height: 2.5.h),

                                        // PASSWORD FIELD
                                        CustomTextField(
                                          label: 'Password',
                                          hintText: 'Enter your password',
                                          inputType: TextInputType
                                              .visiblePassword,
                                          prefixIcon:
                                          Icons.lock_outline,
                                          controller: passwordController,
                                          isPassword: true,
                                          validator: AppValidators
                                              .validatePassword,
                                        ),
                                      ],
                                    )
                                        : Column(
                                      key: const ValueKey('otp_mode'),
                                      children: [
                                        // ONLY MOBILE NUMBER FIELD
                                        CustomTextField(
                                          label: 'Mobile Number',
                                          hintText:
                                          'Enter your mobile number',
                                          inputType: TextInputType.phone,
                                          prefixIcon:
                                          Icons.phone_android_outlined,
                                          controller:
                                          phoneNumberController,
                                          validator: AppValidators
                                              .validatePhoneNumber,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: 2.5.h),

                                // LOGIN TYPE SWITCH
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Login with ',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: AppFonts.regular,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isPasswordLogin = !isPasswordLogin;
                                          emailController.clear();
                                          passwordController.clear();
                                          phoneNumberController.clear();
                                        });
                                      },
                                      child: AnimatedSwitcher(
                                        duration: const Duration(
                                          milliseconds: 250,
                                        ),
                                        transitionBuilder:
                                            (child, animation) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: SlideTransition(
                                              position: Tween<Offset>(
                                                begin: const Offset(0, 0.3),
                                                end: Offset.zero,
                                              ).animate(animation),
                                              child: child,
                                            ),
                                          );
                                        },
                                        child: Text(
                                          isPasswordLogin
                                              ? 'OTP?'
                                              : 'ID/Password?',
                                          key: ValueKey(isPasswordLogin),
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontFamily: AppFonts.semiBold,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 3.h),

                                // LOGIN BUTTON
                                CustomButton(
                                  text: isPasswordLogin
                                      ? 'Sign In'
                                      : 'Login with OTP',
                                  width: 70.w,
                                  height: 6.h,
                                  showArrow: true,
                                  onPressed: handleLogin,
                                ),

                                SizedBox(height: 5.h),

                                // SIGN UP
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account? ",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: AppFonts.regular,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(
                                              () => const RegisterScreen(),
                                        );
                                      },
                                      child: Text(
                                        'Sign up',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.semiBold,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 2.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
