import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/features/common/data/models/user_model.dart';
import 'package:events_app/features/common/data/repositories_impl/user_repository_impl.dart';
import 'package:events_app/features/common/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

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
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              obscure: false,
              emailController: emailController,
              hint: "Insira o email",
              label: "Email",
            ),
            CustomTextField(
              obscure: true,
              emailController: passwordController,
              hint: "Insira a palavra-passe",
              label: "Palavra-passe",
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text("Register"),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    await _login();
                  },
                  icon: const Icon(Icons.login),
                  label: const Text("Login"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    UserRepositoryImpl repo = UserRepositoryImpl();
    DataState<UserModel> res = await repo.readOne(emailController.text);
    if (res is DataSuccess) {
      //todo
    }
  }
}
