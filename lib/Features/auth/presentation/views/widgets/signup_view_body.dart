import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/Features/auth/presentation/views/widgets/terms_and_conditions.dart';
import '../../../../../../constants/constants.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/password_field.dart';
import '../../../../../core/widgets/scaffold_messenger.dart';
import '../../cubits/sign_up_cubit.dart';
import 'have_an_account_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String userName, email, password;
  late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                hintText: 'الاسم كامل',
                onSaved: (value) {
                  userName = value!;
                },
                textInputType: TextInputType.name,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TermsAndConditionsWidget(
                onChecked: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context
                          .read<SignUpCubit>()
                          .createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                        name: userName,

                      );
                    } else {
                      CustomScaffoldMessenger.showErrorMessenger(
                          message: 'يرجى قبول الشروط والاحكام',
                          context: context);
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              const SizedBox(
                height: 26,
              ),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
