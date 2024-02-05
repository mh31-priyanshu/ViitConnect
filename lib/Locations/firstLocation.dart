import 'package:VIIT_CONNECTS/info.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class FirstLocation extends StatefulWidget {
  const FirstLocation({super.key});

  @override
  State<FirstLocation> createState() => _FirstLocationState();
}

class _FirstLocationState extends State<FirstLocation> {
  Widget hotspotbutton({VoidCallback? onPressed}){
    return TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(CircleBorder()),
          backgroundColor: MaterialStateProperty.all(Colors.black38),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: onPressed,
        child: Expanded(
          child: Container(
            child: const Icon(
              Icons.arrow_upward,
              size: 25,
            ),
          ),
          // Text(
          //   "B Building",
          //   style: TextStyle(
          //       color: Colors.white
          //   ),
          //
          // ),
        )
    );
  }
  int _panID = 0;
  late Widget panaroma;
  @override

  Widget build(BuildContext context) {
    switch(_panID){
      case 0:
        panaroma = Panorama(
          animSpeed: 0,
          sensitivity: 2,
          child: Image.asset("assets/locations/BBuildingGate.jpg"),
          hotspots: [
            Hotspot(
                latitude: 5,
                longitude: 187,
                widget: hotspotbutton(
                    onPressed: () =>
                        setState(() {
                          print(_panID);
                          _panID = 1;
                          print(_panID);

                        })
                )
            )
          ],
        );
        break;
      case 1:
        panaroma = Panorama(
          sensitivity: 2,

          child: Image.asset("assets/locations/BBuildingLift.jpg"),
          hotspots: [
            Hotspot(
                latitude: 10,
                longitude: 66,
                widget: hotspotbutton(
                    onPressed: () =>
                        setState(() {
                          _panID=3;
                          setState(() {

                          });
                        })
                )
            ),
            Hotspot(
                latitude: 351,
                longitude: 350,
                widget: hotspotbutton(
                    onPressed: () =>
                        setState(() {
                          _panID=2;
                          setState(() {

                          });
                        })
                )
            ),
            Hotspot(
                latitude: 350,
                longitude: 225,
                widget: hotspotbutton(
                    onPressed: () =>
                        setState(() {
                          _panID=0;
                          setState(() {

                          });
                        })
                )
            )
          ],
        );
        break;
      case 2:
        panaroma = Panorama(
          sensitivity: 2,
          child: Image.asset("assets/locations/BBuildingGround.jpg"),
          hotspots: [
            Hotspot(
                latitude: 5,
                longitude: 322,
                widget: hotspotbutton(
                    onPressed: () =>
                        setState(() {
                          _panID=1;
                          setState(() {

                          });
                        })
                )
            )
          ],
        );
        break;
      case 3:
        panaroma = Panorama(
          sensitivity: 2,
          child: Image.asset("assets/locations/BBuildingFirstFloor.jpg"),
          hotspots: [
            Hotspot(
                latitude: 0,
                longitude: 180,
                widget: hotspotbutton(
                    onPressed: () =>
                        setState(() {
                          print(_panID);
                          _panID = 4;
                          print(_panID);

                        })
                )
            ),
            Hotspot(
                latitude: 2,
                longitude: 240,
                widget: hotspotbutton(
                    onPressed: () =>
                        setState(() {
                          print(_panID);
                          _panID = 5;
                          print(_panID);

                        })
                )
            ),
            Hotspot(
                latitude: 0,
                longitude: 260,
                widget: hotspotbutton(
                    onPressed: () =>
                        setState(() {
                          print(_panID);
                          _panID = 6;
                          print(_panID);

                        })
                )
            ),
            Hotspot(
                latitude: 340,
                longitude: 355,
                widget: hotspotbutton(
                    onPressed: () =>
                        setState(() {
                          print(_panID);
                          _panID = 1;
                          print(_panID);

                        })
                )
            )
          ],
        );
        break;
      case 4:
        panaroma = Panorama(
          sensitivity: 2,
          animSpeed: 0,
          child: Image.asset("assets/locations/BBuildingTutorialRoom.jpg"),
          hotspots: [
            Hotspot(
                latitude: 350,
                longitude: 205,
                widget: hotspotbutton(
                    onPressed: () =>
                        setState(() {
                          print(_panID);
                          _panID = 3;
                          print(_panID);

                        })
                )
            )
          ],
        );
        break;
      case 5:
        panaroma = Panorama(
          animSpeed: 0,
          sensitivity: 2,
          child: Image.asset("assets/locations/BBuilding107.jpg"),
          hotspots: [
            Hotspot(
                latitude: 0,
                longitude: 220,
                widget: hotspotbutton(
                    onPressed: () =>
                        setState(() {
                          print(_panID);
                          _panID = 3;
                          print(_panID);
                        })
                )
            )
          ],
        );
        break;
      case 6:
        panaroma = Panorama(
          sensitivity: 2,
          animSpeed: 0,
          child: Image.asset("assets/locations/BBuildingClassroom.jpg"),
          hotspots: [
            Hotspot(
                latitude: 352,
                longitude: 25,
                widget: hotspotbutton(
                    onPressed: () =>
                        setState(() {
                          print(_panID);
                          _panID = 3;
                          print(_panID);

                        })
                )
            )
          ],
        );
        break;
      default:
        panaroma = Panorama(
          animSpeed: 0,
          child: Image.asset("assets/locations/BBuildingGate.jpg"),
          hotspots: [
            Hotspot(
                latitude: 5,
                longitude: 187,
                widget: hotspotbutton(
                    onPressed: () =>
                        setState(() {
                          print(_panID);
                          _panID = 1;
                          print(_panID);

                        })
                )
            )
          ],
        );
        break;
    }
    return Scaffold(
      body: Center(
          child: panaroma
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => InfoPage()),
            );
          });
        },
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
