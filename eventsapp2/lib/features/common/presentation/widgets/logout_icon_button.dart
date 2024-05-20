// ignore_for_file: use_build_context_synchronously

import 'package:events_app/core/utils/custom_navigation.dart';
import 'package:events_app/features/common/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class LogoutIconButton extends StatelessWidget {
  const LogoutIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        tooltip: "Logout",
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext ctx) => AlertDialog(
              title: const Text('Logout'),
              content: const Text("Are you sure you want to exit?"),
              actions: <Widget>[
                TextButton(
                  child: const Text('Confirm'),
                  onPressed: () => navigateWithReplacement(
                    ctx,
                    const LoginPage(),
                  ),
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(ctx).pop(),
                ),
              ],
            ),
          );
        },
        icon: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
