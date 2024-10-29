import 'package:flutter/material.dart';
import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_picture.png'), // Replace with user image or network image
              backgroundColor: ColorConstants.grey,
            ),
            SizedBox(height: 16),
            // Username
            Text(
              'John Doe', // Replace with user's name
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 4),
            // Email
            Text(
              'john.doe@example.com', // Replace with user's email
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 24),
            // Profile Options
            Expanded(
              child: ListView(
                children: [
                  _buildProfileOption(
                    icon: Icons.edit,
                    title: 'Edit Profile',
                    onTap: () {
                      // Navigate to Edit Profile screen
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    onTap: () {
                      // Open notification settings
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.lock,
                    title: 'Change Password',
                    onTap: () {
                      // Navigate to Change Password screen
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.logout,
                    title: 'Log Out',
                    onTap: () {
                      // Handle log out
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: ColorConstants.accentColor),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, color: ColorConstants.grey),
      onTap: onTap,
    );
  }
}
