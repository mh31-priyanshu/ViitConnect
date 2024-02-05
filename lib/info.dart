import 'package:VIIT_CONNECTS/Locations/firstLocation.dart';
import 'package:VIIT_CONNECTS/courses.dart';
import 'package:VIIT_CONNECTS/setting.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:VIIT_CONNECTS/landing.dart';
import 'history.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  double _navbarHeight = 70.0;
  double _imageBorderRadius = 22.0;

  List<String> imagePaths = [
    'assets/images/mech.jpg',
    'assets/images/History.jpeg',
    'assets/images/mech.jpg',
    'assets/images/Courses.jpg',
    'assets/images/Admission.jpg',
  ];

  List<String> horizontalBoxItems = [
    'History',
    'Directions',
    'Courses',
    'Admissions',
  ];

  void _onNavigationBarItemTapped(int index) {
    switch (index) {
      case 0:
        _navigateToPage(InfoPage());
        break;
      case 1:
        _navigateToPage(LandingPage());
        break;
      case 2:
        _navigateToPage(Setting());
        break;
    }
  }

  void _onNavigateListview(int index) {
    Widget nextPage;

    // Determine the next page based on the index
    switch (index) {
      case 0:
        _navigateToPage(HistoryPage());
        break;
      case 1:
        _navigateToPage(FirstLocation());
        break;
      case 2:
        _navigateToPage(CoursesPage());
        break;
      case 3:
        _launchURL('https://www.viit.ac.in/');
        break;
      default:
      // Navigate to a default page if needed
        nextPage = Container(); // Replace with an appropriate default value
    }
  }

  void _launchURL(String url) async {
    print('get in');

    final Uri url1 = Uri.parse(url);
    // await _requestInternetPermission();
    if (await launchUrl(url1)) {
      print('Launching...');
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

  void _navigateToPage(Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF4f524e),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2 + 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(imagePaths[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2 + 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  ),
                ),
              ),
              Column(

                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 175, horizontal: 40),
                    width: 350,
                    child: Positioned(
                      bottom: 20.0,
                      left: 20.0,
                      right: 20.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'AT VIIT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Text(
                            'We believe that',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          Container(
                            height: 2.0,
                            width: 150.0,
                            color: Colors.white, // Horizontal line below "We believe that"
                          ),
                          SizedBox(height: 5.0),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '“Union of science and spirituality alone will bring peace to mankind”',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: horizontalBoxItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _onNavigateListview(index); // Pass the index to the handler
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    width: 180.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePaths[index + 1]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          horizontalBoxItems[index],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        elevation: 0,
        selectedIndex: 0,
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