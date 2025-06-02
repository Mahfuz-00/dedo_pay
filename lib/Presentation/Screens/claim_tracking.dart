import 'package:flutter/material.dart';
import '../../Common/Config/Theme/app_colors.dart';
import '../../Core/Navigation/app_router.dart';
import '../../Core/Widgets/custom_textfield.dart';

class ClaimTrackingPage extends StatelessWidget {
  const ClaimTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.secondary,
                      child: Icon(Icons.person, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 8.0),
                    const Text('User Name'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Text('Log Out'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Claim Tracking',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              const CustomTextField(
                labelText: 'Tracking No.',
                isRequired: true,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Submit'),
              ),
              const SizedBox(height: 48.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.claimForm);
                },
                child: const Text('New Claim'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}