import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:khtwat_project/config/routes/app_routs.dart';
import 'package:khtwat_project/core/utils/app_colors.dart';
import 'package:khtwat_project/core/utils/app_strings.dart';
import 'package:khtwat_project/core/utils/media_query_values.dart';
import 'package:khtwat_project/core/utils/style_manager.dart';
import 'package:khtwat_project/presntation/view/screens/register.dart';
import 'package:khtwat_project/presntation/view/widgets/input_field.dart';
import 'package:khtwat_project/presntation/view/widgets/main_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          AppStrings.signIn,
          style: getBoldStyle(color: AppColors.primary, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  right: context.width * 0.05,
                  left: context.width * 0.05,
                  top: context.height * 0.01),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Student",
                            style: getBoldStyle(
                                color: AppColors.black, fontSize: 30),
                          ),
                          Text(
                            "Hub",
                            style: getBoldStyle(
                                color: AppColors.primary, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    SizedBox(
                      width: context.width * 0.5,
                      child: Text(
                        AppStrings.loginWelcom,
                        textAlign: TextAlign.center,
                        style:
                            getLightStyle(color: AppColors.grey, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.1,
                    ),
                    defualtFormField(context, controller: idController,
                        validate: (String value) {
                      if (value.length < 9 || value.length > 9) {
                        return "يجب ان يكون الكود 9 ارقام";
                      }
                      return null;
                    },
                        hint: AppStrings.personalID,
                        type: TextInputType.number,
                        width: double.infinity,
                        suffix: Icon(
                          EneftyIcons.personalcard_outline,
                          color: AppColors.primary,
                        )),
                    SizedBox(
                      height: context.height * 0.05,
                    ),
                    defualtFormField(context, controller: passController,
                        validate: (String value) {
                      if (value.isEmpty) {
                        return "من فضلك ادخل كلمة السر";
                      }
                    },
                        hint: AppStrings.password,
                        type: TextInputType.text,
                        width: double.infinity,
                        isPassword: isPassword,
                        suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            },
                            icon: Icon(
                              isPassword
                                  ? EneftyIcons.eye_outline
                                  : EneftyIcons.eye_slash_outline,
                              color: AppColors.primary,
                            ))),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.forgetPassword,
                            style: getBoldStyle(
                                color: AppColors.black, fontSize: 15),
                          )),
                    ),
                    SizedBox(
                      height: context.height * 0.1,
                    ),
                    mainButton(context, onpressd: () {
                      if (formKey.currentState!.validate()) {}
                    }, background: AppColors.primary, text: AppStrings.signIn),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.dontHaveAcount,
                          style: getLightStyle(
                              color: AppColors.black, fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            navigatTo(context, const RegisterScreen());
                          },
                          child: Text(
                            AppStrings.signUp,
                            style: getLightStyle(
                                color: AppColors.primary, fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
