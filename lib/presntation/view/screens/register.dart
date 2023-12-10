import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:khtwat_project/config/routes/app_routs.dart';
import 'package:khtwat_project/core/utils/app_colors.dart';
import 'package:khtwat_project/core/utils/app_strings.dart';
import 'package:khtwat_project/core/utils/media_query_values.dart';
import 'package:khtwat_project/core/utils/style_manager.dart';
import 'package:khtwat_project/presntation/view/screens/login_screen.dart';
import 'package:khtwat_project/presntation/view/widgets/input_field.dart';
import 'package:khtwat_project/presntation/view/widgets/main_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController levelController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool isPassword = true;
  var formKey = GlobalKey<FormState>();
  List levels = ["الاول", "الثاني", "الثالث", "الرابع"];
  List departments = ["كمياء", "فزياء", "حاسب", "رياضيات"];

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    passController.dispose();
    phoneController.dispose();
    departmentController.dispose();
    levelController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              EneftyIcons.arrow_left_3_outline,
              color: AppColors.black,
            )),
        elevation: 0.0,
        title: Text(
          AppStrings.signUp,
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      height: context.height * 0.1,
                    ),
                    defualtFormField(context, controller: nameController,
                        validate: (String value) {
                      if (value.isEmpty) {
                        return "رجاء ادخال الاسم";
                      }
                    },
                        hint: AppStrings.fullname,
                        type: TextInputType.name,
                        width: double.infinity,
                        suffix: Icon(
                          EneftyIcons.user_outline,
                          color: AppColors.primary,
                        )),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    defualtFormField(context, controller: levelController,
                        validate: (String value) {
                      if (value.isEmpty) {
                        return "الرجاء ادخال المستوي";
                      }
                    },
                        hint: AppStrings.level,
                        type: TextInputType.text,
                        width: double.infinity,
                        suffix: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(15),
                          elevation: 5,
                          icon: Icon(
                            EneftyIcons.arrow_down_outline,
                            color: AppColors.primary,
                          ),
                          items: levels
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          fontSize: 20, color: AppColors.black),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (item) => setState(() {
                            levelController.text = item!;
                          }),
                        )),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    defualtFormField(context, controller: departmentController,
                        validate: (String value) {
                      if (value.isEmpty) {
                        return "الرجاء ادخال القسم";
                      }
                    },
                        hint: AppStrings.department,
                        type: TextInputType.text,
                        width: double.infinity,
                        suffix: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(15),
                          elevation: 5,
                          icon: Icon(
                            EneftyIcons.arrow_down_outline,
                            color: AppColors.primary,
                          ),
                          items: departments
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          fontSize: 20, color: AppColors.black),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (item) => setState(() {
                            departmentController.text = item!;
                          }),
                        )),
                    SizedBox(
                      height: context.height * 0.03,
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
                      height: context.height * 0.03,
                    ),
                    defualtFormField(context, controller: phoneController,
                        validate: (String value) {
                      if (value.length < 11 || value.length > 11) {
                        return "يجب ان يكون الرقم 11 ارقام";
                      }
                      return null;
                    },
                        hint: AppStrings.phoneNum,
                        type: TextInputType.number,
                        width: double.infinity,
                        suffix: Icon(
                          EneftyIcons.call_outline,
                          color: AppColors.primary,
                        )),
                    SizedBox(
                      height: context.height * 0.03,
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
                      height: context.height * 0.05,
                    ),
                    mainButton(context, onpressd: () {
                      if (formKey.currentState!.validate()) {}
                    }, background: AppColors.primary, text: AppStrings.signUp),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.alreadyHaveAccount,
                          style: getLightStyle(
                              color: AppColors.black, fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            navigateAndFinish(
                              context,
                              const LoginScreen(),
                            );
                          },
                          child: Text(
                            AppStrings.signIn,
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
