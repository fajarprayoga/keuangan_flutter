import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keuangan_flutter/app/data/services/local/storage.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            prefs.remove('token');
            context.go('/login');
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
