import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/presentation/settings/logout/logout.dart'; // Import the LogoutPage
import 'package:ecommerce/presentation/settings/widgets/my_orders_tile.dart';
import 'package:flutter/material.dart';
import '../widgets/my_favorties_tile.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart'; // Import AppColors

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Align children to stretch across the available width
          children: [
            const MyFavortiesTile(),
            const SizedBox(height: 15),
            const MyOrdersTile(),
            const SizedBox(height: 15), // Add spacing
            _buildLogoutButton(context), // Call to the method that creates the styled logout button
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showLogoutConfirmationDialog(context);
      },
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.secondBackground, // Use AppColors.secondBackground
          borderRadius: BorderRadius.circular(10), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // Shadow color
              blurRadius: 5, // Shadow blur
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Logout', // Button text
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white, // Text color
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded, // Icon for visual cue
              color: Colors.white, // Icon color
            ),
          ],
        ),
      ),
    );
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Do you really want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                logout(context); // Call the logout function
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void logout(BuildContext context) {
    // Perform your logout logic here (e.g., clearing user data, tokens, etc.)
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LogoutPage()),
      (Route<dynamic> route) => false,
    );
  }
}
