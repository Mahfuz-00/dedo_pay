import 'package:flutter/material.dart';

import '../../Common/Config/Theme/app_colors.dart';
import '../../Core/Navigation/app_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email*',
                  labelStyle: const TextStyle(color: AppColors.textSecondary),
                  suffix: const Text(
                    '*',
                    style: TextStyle(color: AppColors.error),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password*',
                  labelStyle: const TextStyle(color: AppColors.textSecondary),
                  suffix: const Text(
                    '*',
                    style: TextStyle(color: AppColors.error),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: AppColors.secondary),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.claimTracking);
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}