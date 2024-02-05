import 'package:flutter/material.dart';
import 'info.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white, // Set the arrow color
          ),
          onPressed: () {
            // Navigate back to the previous page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => InfoPage()),
            );
          },
        ),
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove the app bar shadow
      ),
      extendBodyBehindAppBar: true, // Extend the body behind the app bar
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5), // Adjust the opacity as needed
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 100, horizontal: 24),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'COURSES',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 120.0),
                    height: 1.0,
                    color: Colors.white, // White horizontal line
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    'Offered by VIIT',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildContainer(
                          'Engineering',
                          '1. Computer Science.\n2. Information Technology\n3. Artificial Intelligence and Data Science \n4. Civil Engineering \n5. Electrical and Telecommunication Engineering\n6. CE Software Engineering \n7. CSE Data Science \8. CSE IOT, CS, BT',
                          'assets/images/mech.jpg',
                        ),
                        _buildContainer(
                          'Vishwakarma University',
                          '1. 11th 12th (Art, Commerce, Science)\n2. Engineering\n3. MBA\n4. Architecture\n5. BCA',
                          'assets/images/mech.jpg',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(String title, String content, String imagePath) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: Image.asset(
              imagePath,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            height: 1.0,
            color: Colors.grey[300], // Light grey horizontal line
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
