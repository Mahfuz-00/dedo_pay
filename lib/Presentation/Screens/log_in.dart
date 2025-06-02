import 'package:flutter/material.dart';

import '../../Common/Config/Assets/app_images.dart';
import '../../Common/Config/Theme/app_colors.dart';
import '../../Core/Navigation/app_router.dart';
import '../../Core/Widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.loginLogo,
                height: 100,
                width: 100,
                // errorBuilder: (context, error, stackTrace) => const Icon(
                //   Icons.image,
                //   size: 100,
                //   color: AppColors.textSecondary,
                // ),
              ),
              const SizedBox(height: 24.0),
              const CustomTextField(
                labelText: 'Email',
                isRequired: true,
              ),
              const SizedBox(height: 16.0),
              const CustomTextField(
                labelText: 'Password',
                isRequired: true,
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