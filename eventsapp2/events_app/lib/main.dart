import 'package:events_app/core/utils/mock_data.dart';
import 'package:events_app/features/common/presentation/pages/normal_home_page.dart';
import 'package:flutter/material.dart';

import 'package:events_app/features/common/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: NormalHomePage(user: mockNormalUser),
      // home: OrganizationHomePage(user: mockNormalUser),
      home: const LoginPage(),
    );
  }
}
