import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:VIIT_CONNECTS/info.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'landing.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4f524e), // Set background color

      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 80),
          child: Column(
            children: [
              Text(
                'SETTINGS',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 105),
                height: 2.0,
                color: Colors.white, // White horizontal line
              ),
              SizedBox(height: 20), // Add some space

              _buildSettingOption("Privacy and Policy", "https://www.viit.ac.in/index.php", context),
              _buildSettingOption("Contact Us", "https://www.viit.ac.in/contact", context),
              _buildSettingOption("Suggest a Feature", "https://docs.google.com/forms/d/e/1FAIpQLSdwV1m277KVpgn-HP3Wjv5hEFhqJdtM0o4slqwD7AyG5xGfqg/viewform?vc=0&c=0&w=1&flr=0", context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        elevation: 0,
        selectedIndex: 2, // Set the selected index for the "Setting" page
        onDestinationSelected: (index) => _onNavigationBarItemTapped(index, context),
        destinations: [
          NavigationDestination(
            icon: Icon(Iconsax.information),
            label: "Info",
          ),
          NavigationDestination(
            icon: Icon(Iconsax.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Iconsax.setting),
            label: "Setting",
          ),
        ],
      ),
    );
  }

  Widget _buildSettingOption(String label, String url, BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL(url, context); // Pass the context to _launchURL
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  void _onNavigationBarItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        _navigateToPage(InfoPage(), context);
        break;
      case 1:
      // Navigate to the home page or any other page as needed
        _navigateToPage(LandingPage(), context);
        break;
      case 2:
      // Already on the "Setting" page
        _navigateToPage(Setting(), context);
        break;
    }
  }

  void _navigateToPage(Widget page, BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void _launchURL(String url, BuildContext context) async {
    final Uri url1 = Uri.parse(url);
    if (await launchUrl(url1)) {
      await launch(url);
    } else {
      // Handle the error gracefully, e.g., show an error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Could not launch the URL: $url'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
