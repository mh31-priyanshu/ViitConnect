import 'package:flutter/material.dart';
import 'package:VIIT_CONNECTS/components/timeline.dart';
import 'info.dart'; // Import the info.dart file

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HistoryPage(),
    );
  }
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
            // Navigate back to the info.dart page
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
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg.png', // Replace with your image path
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 100, horizontal: 24),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HISTORY",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 120.0),
                      height: 1.0,
                      color: Colors.white, // White horizontal line
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      'Of VIIT',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    MyTimeLineTile(
                      isFirst: true,
                      isLast: false,
                      isPast: true,
                      historyCard: Text(
                        "Establishment: Vishwakarma Institute of Information Technology (VIIT) was established in 2002 by Bansilal Ramnath Agarwal Charitable Trust (BRACT), Pune, Maharashtra.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0, // Adjust the size as needed
                        ),
                      ),
                    ),
                    MyTimeLineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      historyCard: Text(
                        "Inauguration: The institute was formally inaugurated by Dr. Anil Kakodkar, Chairman, Atomic Energy Commission, Government of India, on 11th October 2002.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0, // Adjust the size as needed
                        ),
                      ),
                    ),
                    MyTimeLineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      historyCard: Text(
                        "Objective: VIIT was founded with the goal of producing engineering graduates capable of accepting challenges in the new environment of technical advancements.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0, // Adjust the size as needed
                        ),
                      ),
                    ),
                    MyTimeLineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      historyCard: Text(
                        "Recognition and Affiliation: VIIT is recognized amongst the top engineering colleges in Pune, Maharashtra, India. It is certified as an ISO 9001:2015 institute, a self-financed Autonomous Institute of Govt. of Maharashtra, affiliated to Savitribai Phule Pune University (SPPU), and recognized by All India Council for Technical Education (AICTE), New Delhi.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0, // Adjust the size as needed
                        ),
                      ),
                    ),
                    MyTimeLineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      historyCard: Text(
                        "Accreditations: VIIT has obtained ISO certification in 2006 and re-certification in 2009, 2012, and 2015. All undergraduate programs are accredited by NBA till 2021.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0, // Adjust the size as needed
                        ),
                      ),
                    ),
                    MyTimeLineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      historyCard: Text(
                        "NAAC Accreditation: VIIT received NAAC accreditation with 'A' grade in the year 2016.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0, // Adjust the size as needed
                        ),
                      ),
                    ),
                    MyTimeLineTile(
                      isFirst: false,
                      isLast: true,
                      isPast: false,
                      historyCard: Text(
                        "Recognition and Autonomy: The institute was awarded as the ‘Outstanding Engineering Institute West Zone’ and received Academic Autonomy from UGC, the State Government, and SPPU from the Academic Year 2017-18.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0, // Adjust the size as needed
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
