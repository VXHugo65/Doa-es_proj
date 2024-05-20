// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:events_app/core/constants/constants.dart';
import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/core/utils/custom_navigation.dart';
import 'package:events_app/core/utils/custom_snackbar.dart';
import 'package:events_app/core/utils/random_id.dart';
import 'package:events_app/features/common/data/models/user_model.dart';
import 'package:events_app/features/common/data/repositories_impl/user_repository_impl.dart';
import 'package:events_app/features/common/presentation/pages/login_page.dart';
import 'package:events_app/features/common/presentation/pages/normal_home_page.dart';
import 'package:events_app/features/common/presentation/pages/organization_home_page.dart';
import 'package:events_app/features/common/presentation/widgets/custom_elevated_button.dart';
import 'package:events_app/features/common/presentation/widgets/custom_text_button.dart';
import 'package:events_app/features/common/presentation/widgets/custom_text_field.dart';
import 'package:events_app/features/common/presentation/widgets/title_and_subtitle.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String selectedDesignation = 'Normal';

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
              title: "Register",
              subtitle: "Join us",
            ),
            const SizedBox(height: 35),
            CustomTextField(
              obscure: false,
              controller: nameController,
              hint: "Insira o nome",
              label: "Nome",
            ),
            CustomTextField(
              obscure: false,
              controller: emailController,
              hint: "Insira o email",
              label: "Email",
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Designation"),
                    _buildDropdownMenu(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            CustomElevatedButton(
              onPressed: () => _registerUser(),
              text: "Register",
            ),
            const SizedBox(height: 15),
            CustomTextButton(
              onPressed: () => navigateWithReplacement(
                context,
                const LoginPage(),
              ),
              lightText: "Already have an account? ",
              boldText: " Login.",
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    String email = emailController.text;
    String name = nameController.text;
    if (!kNameRegex.hasMatch(name)) {
      showCustomSnackBar(context, "Invalid Name!");
      return;
    }

    if (!kEmailRegex.hasMatch(email)) {
      showCustomSnackBar(context, "Invalid Email!");
      return;
    }

    UserRepositoryImpl repo = UserRepositoryImpl();
    UserModel user = UserModel(
      id: randomId().toString(),
      name: nameController.text,
      email: emailController.text,
      designation: selectedDesignation == UserDesignation.Normal.name
          ? UserDesignation.Normal
          : UserDesignation.Organization,
    );
    DataState<bool> res = await repo.create(user);
    if (res is DataSuccess) {
      if (user.designation == UserDesignation.Normal) {
        showCustomSnackBar(context, "Login successful!");
        navigateWithReplacement(context, NormalHomePage(user: user));
      } else {
        showCustomSnackBar(context, "Login successful!");
        navigateWithReplacement(context, OrganizationHomePage(user: user));
      }
    } else {
      showCustomSnackBar(context, "LOGIN UNSUCESSFUL: ${res.error!.message}");
    }
  }

  Container _buildDropdownMenu() {
    return Container(
      width: 390,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey,
          width: 1.0, 
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
        child: DropdownButton<String>(
          value: selectedDesignation,
          icon: const SizedBox(),
          borderRadius: BorderRadius.circular(12),
          underline: const SizedBox(),
          onChanged: (String? newValue) {
            setState(() {
              selectedDesignation = newValue!;
            });
          },
          items: ['Normal', 'Organization'].map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
