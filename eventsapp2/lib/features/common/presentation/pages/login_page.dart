// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:events_app/core/constants/constants.dart';
import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/core/utils/custom_navigation.dart';
import 'package:events_app/core/utils/custom_snackbar.dart';
import 'package:events_app/features/common/data/models/user_model.dart';
import 'package:events_app/features/common/data/repositories_impl/user_repository_impl.dart';
import 'package:events_app/features/common/presentation/pages/normal_home_page.dart';
import 'package:events_app/features/common/presentation/pages/organization_home_page.dart';
import 'package:events_app/features/common/presentation/pages/register_page.dart';
import 'package:events_app/features/common/presentation/widgets/custom_elevated_button.dart';
import 'package:events_app/features/common/presentation/widgets/custom_text_button.dart';
import 'package:events_app/features/common/presentation/widgets/custom_text_field.dart';
import 'package:events_app/features/common/presentation/widgets/title_and_subtitle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TitleAndSubtitle(
              title: "Login",
              subtitle: "Welcome back",
            ),
            const SizedBox(height: 35),
            CustomTextField(
              obscure: false,
              controller: emailController,
              hint: "Insira o email",
              label: "Email",
            ),
            CustomTextField(
              obscure: true,
              controller: passwordController,
              hint: "Insira a palavra-passe",
              label: "Palavra-passe",
            ),
            const SizedBox(height: 50),
            CustomElevatedButton(
              text: "Login",
              onPressed: () => _login(),
            ),
            const SizedBox(height: 15),
            CustomTextButton(
              onPressed: () => navigateWithReplacement(
                context,
                const RegisterPage(),
              ),
              lightText: "Don't have an account? ",
              boldText: " Register.",
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    String email = emailController.text;
    String password = passwordController.text;
    if (!kEmailRegex.hasMatch(email)) {
      showCustomSnackBar(context, "Invalid Email!");
      return;
    }

    if (!kPasswordRegex.hasMatch(password)) {
      showCustomSnackBar(context, "Invalid Password!");
      return;
    }

    UserRepositoryImpl repo = UserRepositoryImpl();
    DataState<UserModel> res = await repo.readOne(emailController.text);
    if (res is DataSuccess) {
      if (res.data!.designation.name == UserDesignation.Normal.name) {
        showCustomSnackBar(context, "Login successful!");
        navigateWithReplacement(context, NormalHomePage(user: res.data!));
      } else {
        showCustomSnackBar(context, "Login successful!");
        navigateWithReplacement(context, OrganizationHomePage(user: res.data!));
      }
    } else {
      showCustomSnackBar(context, "LOGIN UNSUCCESSFUL: ${res.error!.message}");
    }
  }
}
