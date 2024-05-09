import 'package:flutter/material.dart';

import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/core/utils/random_id.dart';
import 'package:events_app/features/common/data/models/user_model.dart';
import 'package:events_app/features/common/data/repositories_impl/user_repository_impl.dart';
import 'package:events_app/features/common/presentation/pages/login_page.dart';
import 'package:events_app/features/common/presentation/pages/normal_home_page.dart';
import 'package:events_app/features/common/presentation/widgets/custom_text_field.dart';

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
      appBar: AppBar(
        title: const Text("Register"),
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
              emailController: nameController,
              hint: "Insira o nome",
              label: "Nome",
            ),
            CustomTextField(
              obscure: false,
              emailController: emailController,
              hint: "Insira o email",
              label: "Email",
            ),
            /* CustomTextField(
              obscure: false,
              emailController: passwordController,
              hint: "Insira a palavra-passe",
              label: "Palavra-passe",
            ), */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Designation"),
                const SizedBox(width: 20),
                _buildDropdownMenu(),
              ],
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
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text("Login"),
                ),
                ElevatedButton(
                  onPressed: () => _registerUser(),
                  child: const Text("Register"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    UserRepositoryImpl _repo = UserRepositoryImpl();
    UserModel user = UserModel(
      id: randomId().toString(),
      name: nameController.text,
      email: emailController.text,
      designation: selectedDesignation == UserDesignation.Normal.name
          ? UserDesignation.Normal
          : UserDesignation.Organization,
    );
    DataState<bool> result = await _repo.create(user);
    if (result is DataSuccess) {
      if (user.designation == UserDesignation.Normal) {
        navigateWithReplacement(context, const NormalHomePage());
      } else {}
    }
  }

  DropdownButton<String> _buildDropdownMenu() {
    return DropdownButton<String>(
      value: selectedDesignation,
      icon: const Icon(Icons.arrow_drop_down_circle_outlined),
      iconSize: 24,
      elevation: 16,
      // style: const TextStyle(color: Colors.deepPurple),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? newValue) {
        setState(() {
          selectedDesignation = newValue!;
        });
      },
      items: <String>['Normal', 'Organization']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void navigateWithReplacement(BuildContext c, Widget page) {
    Navigator.pushReplacement(
      c,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void navigate(BuildContext c, Widget page) {
    Navigator.pushReplacement(
      c,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
