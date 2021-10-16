import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/screens/login_screen.dart';
import 'package:social_media_app/screens/profile_screen.dart';

import 'home_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl!),
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 30,
                bottom: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 3.0,
                        ),
                        image: DecorationImage(
                          image: AssetImage(currentUser.profileImageUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      currentUser.name!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildDrawerOption(
              icon: const Icon(Icons.dashboard),
              title: 'Home',
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()))),
          _buildDrawerOption(
              icon: const Icon(Icons.chat), title: 'Chats', onTap: () {}),
          _buildDrawerOption(
              icon: const Icon(Icons.location_on), title: 'Map', onTap: () {}),
          _buildDrawerOption(
              icon: const Icon(Icons.account_circle),
              title: 'Your Profile',
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProfileScreen(
                            user: currentUser,
                          )))),
          _buildDrawerOption(
              icon: const Icon(Icons.settings),
              title: 'Settings',
              onTap: () {}),
          _buildDrawerOption(
              icon: const Icon(Icons.directions_run),
              title: 'Logout',
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()))),
        ],
      ),
    );
  }

  _buildDrawerOption(
      {required Icon icon, required String title, required Function() onTap}) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}
