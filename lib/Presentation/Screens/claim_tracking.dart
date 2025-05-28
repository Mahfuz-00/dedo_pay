import 'package:flutter/material.dart';
import '../../Common/Config/Theme/app_colors.dart';
import '../../Core/Navigation/app_router.dart';

class ClaimTrackingPage extends StatelessWidget {
  const ClaimTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.secondary,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 8.0),
            const Text('User Name'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Claim Tracking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Tracking No.*',
                labelStyle: const TextStyle(color: AppColors.textSecondary),
                suffix: const Text(
                  '*',
                  style: TextStyle(color: AppColors.error),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.claimForm);
              },
              child: const Text('New Claim'),
            ),
          ],
        ),
      ),
    );
  }
}