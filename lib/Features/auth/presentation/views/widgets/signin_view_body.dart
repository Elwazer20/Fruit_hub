import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' show Platform;

import 'package:fruit_hup/Features/auth/presentation/cubits/sign_in_cubit.dart';
import 'package:fruit_hup/Features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';
import 'package:fruit_hup/core/widgets/custom_text_field.dart';
import 'package:fruit_hup/core/widgets/or_divider.dart';
import 'package:fruit_hup/generated/Assets.dart';

import '../../../../../../constants/constants.dart';
import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/widgets/dont_have_an_account_widget.dart';
import '../../../../../core/widgets/password_field.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Column(children: [
              CustomTextFormField(
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمه السر؟',
                    style: TextStyles.semiBold13
                        .copyWith(color: AppColors.lightPrimaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignInCubit>().signInWithEmailAndPassword(
                        email: email, password: password);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'تسجيل الدخول',
              ),
              SizedBox(
                height: 32,
              ),
              const DontHaveAnAccountWidget(),
              SizedBox(
                height: 32,
              ),
              OrDivider(),
              SizedBox(
                height: 32,
              ),
              SocialLoginButton(
                label: "تسجيل بواسطة جوجل",
                img: Assets.loginGoogle,
                onPressed: () {
                  context.read<SignInCubit>().signInWithGoogle();
                },
              ),
              SizedBox(
                height: 16,
              ),
              if (Platform.isIOS)
                SocialLoginButton(
                  label: "تسجيل بواسطة أبل ",
                  img: Assets.loginApple,
                  onPressed: () {},
                ),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                label: "تسجيل بواسطة فيسبوك",
                img: Assets.loginFace,
                onPressed: () {
                  context.read<SignInCubit>().signInWithFacebook();
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
