import 'package:VIIT_CONNECTS/setting.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'info.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  String _greeting = '';
  double _navbarHeight = 70.0;
  double _imageBorderRadius = 10.0;

  List<String> imagePaths = [
    'assets/images/mech.jpg',
    'assets/images/acm.jpg',
    'assets/images/mech.jpg',
    'assets/images/acm.jpg',
    'assets/images/lab.jpeg',
  ];

  int currentImageIndex = 0;

  late AnimationController _animationController;
  late Animation<double> _navbarAnimation;

  @override
  void initState() {
    super.initState();
    _setGreeting();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _navbarAnimation = Tween<double>(begin: 70.0, end: 65.0)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _navbarHeight = 65.0;
      });
    });

    Timer.periodic(Duration(seconds: 2), (timer) {
      _changeImage();
    });
  }

  void _setGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 0 && hour < 12) {
      _greeting = 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      _greeting = 'Good Afternoon';
    } else if (hour >= 17 && hour < 20) {
      _greeting = 'Good Evening';
    } else {
      _greeting = 'Good Night';
    }
  }

  void _changeImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % imagePaths.length;
    });
  }

  void _onNavigationBarItemTapped(int index) {
    switch (index) {
      case 0:
        _navigateToPage(InfoPage());
        break;
      case 1:
      // Navigate to CommunityPage()
        _navigateToPage(LandingPage());
        break;
      case 2:
      // Navigate to AnnouncementsPage()
        _navigateToPage(Setting());
        break;
    }
  }

  void _navigateToPage(Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void _launchUrl(String url) async {
    final url1 = Uri.parse(url);
    if (await launchUrl(url1)) {
      await launch(url);
    } else {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF4f524e),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // CarouselSlider
          Container(
            margin: EdgeInsets.only(top: 35.0),
            height: MediaQuery.of(context).size.height / 2.5,
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 2.9,
                aspectRatio: 16 / 9,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
              ),
              items: imagePaths.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_imageBorderRadius),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          // Greeting Container
          Container(
            width: MediaQuery.of(context).size.width - 20.0,
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '$_greeting\nWelcome to VIIT Connects!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Action Button
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  _launchUrl('https://learner.vierp.in/');
                },
                icon: Icon(Icons.school, color: Colors.white, size: 24),
              ),
              IconButton(
                onPressed: () {
                  _launchUrl('tel:+020-26950208');
                },
                icon: Icon(Icons.phone, color: Colors.white, size: 24),
              ),
              IconButton(
                onPressed: () {
                  _launchUrl('mailto:khachaneks22@gmail.com');
                },
                icon: Icon(Icons.email, color: Colors.white, size: 24),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add functionality for the button
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.orange, // Change the button color
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Icons for Education, Call, and Email
        ],
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        elevation: 0,
        selectedIndex: 1,
        onDestinationSelected: (index) => _onNavigationBarItemTapped(index),
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
}
