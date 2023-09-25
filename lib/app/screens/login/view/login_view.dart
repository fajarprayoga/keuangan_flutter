import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keuangan_flutter/app/core/constans/value.dart';
import 'package:keuangan_flutter/app/providers/login/login_provider.dart';
import 'package:keuangan_flutter/app/screens/login/widgets/form_input.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifer = ref.read(loginProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  FormInput(
                    hintText: 'Your Email Address',
                    controller: notifer.email,
                  ),
                  SizedBox(
                    height: SzHeight,
                  ),
                  FormInput(
                    hintText: 'Password',
                    controller: notifer.password,
                  ),
                  SizedBox(
                    height: SzHeight,
                  ),
                  InkWell(
                    onTap: () => notifer.login(context),
                    child: Container(
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                          color: colors['blue'],
                          borderRadius: BorderRadius.circular(radius)),
                      child: Center(
                          child: Text(
                        "Signin",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
