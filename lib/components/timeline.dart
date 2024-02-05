import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:VIIT_CONNECTS/components/historycard.dart';
import 'package:VIIT_CONNECTS/history.dart';



class MyTimeLineTile extends StatelessWidget {
 final bool isFirst;
 final bool isLast;
 final bool isPast;
 final historyCard;

 const MyTimeLineTile({
   super.key,
   required this.isFirst,
   required this.isLast,
   required this.isPast,
   required this.historyCard,
});

   @override
   Widget build(BuildContext context) {

     return SizedBox(
       height: 200,
       child: TimelineTile(
         isFirst: isFirst,
         isLast: isLast,

         //decorate the lines
         beforeLineStyle: LineStyle(
           color: Colors.white),
         indicatorStyle: IndicatorStyle(
           width: 40,
           color:  Colors.white,
           // iconStyle: IconStyle(
           //   iconData: Icons.done_all,
           //   color:  Colors.deepPurple,
           // )
         ),
         // event card
         endChild: HistoryCard(
           child: historyCard,
         ),
       ),
     );
   }
 }
 