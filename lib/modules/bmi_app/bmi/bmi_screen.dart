 import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/modules/bmi_app/bmi_result/bmi_result_screen.dart';


class BmiScreen extends StatefulWidget {


   @override
   State<BmiScreen> createState() => _BmiScreenState();
 }

 class _BmiScreenState extends State<BmiScreen>
 {

   Color? colorMale = Colors.grey[300];
   Color? colorFemale = Colors.grey[300];
   double height = 120.0;

   int weight = 40 ;
   int age = 20 ;
    bool isMale = true;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text(
           'BMI Calculator',
         ),
       ),
       body: Column(
         children:
         [
           Expanded (
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Row(
                 children:
                 [
                   Expanded(
                     child: GestureDetector(
                       onTap: (){
                         setState(() {
                           colorMale = Colors.blue;
                           colorFemale = Colors.grey[300];
                           isMale = true;
                         });
                       },
                       child: Container(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children:
                           [
                             Icon(
                               Icons.male,
                               size: 70.0,
                             ),
                             SizedBox(
                               height: 15.0,
                             ),
                             Text(
                               'MALE',
                               style: TextStyle(
                                 fontSize: 25.0,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ],
                         ),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10.0,),
                           color: colorMale,
                         ),
                       ),
                     ),
                   ),
                   SizedBox(
                     width: 20.0,
                   ),
                   Expanded(
                     child: GestureDetector(
                       onTap: (){
                         setState(() {
                           colorMale = Colors.grey[300];
                           colorFemale = Colors.blue;
                           isMale = false ;
                         });
                       },
                       child: Container(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children:
                           [
                             Icon(
                               Icons.female,
                               size: 70.0,
                             ),
                             SizedBox(
                               height: 15.0,
                             ),
                             Text(
                               'FEMALE',
                               style: TextStyle(
                                 fontSize: 25.0,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ],
                         ),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10.0,),
                           color: colorFemale,
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.symmetric(
                 horizontal: 20.0,
               ),
               child: Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children:
                   [
                     Text(
                       'HEIGHT',
                       style: TextStyle(
                         fontSize: 25.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     SizedBox(
                       height: 5.0,
                     ),
                     Row(
                       crossAxisAlignment:  CrossAxisAlignment.baseline,
                       textBaseline: TextBaseline.alphabetic,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children:
                       [
                         Text(
                           '${height.round()}',
                           style: TextStyle(
                             fontSize: 40.0,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         SizedBox(
                           width: 5.0,
                         ),
                         Text(
                           'CM',
                           style: TextStyle(
                             fontSize: 15.0,
                             fontWeight: FontWeight.w900,
                           ),
                         ),
                       ],
                     ),
                     Slider(
                       value: height,
                       max: 220.0,
                       min: 80.0,
                       onChanged: (value){
                         setState(() {
                           height = value;
                         });
                       },
                     ),
                   ],
                 ),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20.0),
                   color: Colors.grey[300],
                 ),
               ),
             ),
           ),
           Expanded(
             child: Row(
               children:
               [
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children:
                         [
                           Text(
                             'WEIGHT',
                             style: TextStyle(
                               fontSize: 25.0,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                           Text(
                             '$weight',
                             style: TextStyle(
                               fontSize: 40.0,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:
                             [
                               FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     weight--;
                                   });
                                 },
                                 heroTag: 'weight-',
                                 mini: true,
                                  child: Icon(
                                    Icons.remove,
                                  ),
                               ),
                               SizedBox(
                                 width: 15.0,
                               ),
                               FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     weight++;
                                   });
                                 },
                                 heroTag: 'weight+',
                                 mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),
                               ),
                             ],
                           ),
                         ],
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20.0),
                         color: Colors.grey[300],
                       ),
                     ),
                   ),
                 ),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children:
                         [
                           Text(
                             'AGE',
                             style: TextStyle(
                               fontSize: 25.0,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                           Text(
                             '$age',
                             style: TextStyle(
                               fontSize: 40.0,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:
                             [
                               FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     age--;
                                   });
                                 },
                                 heroTag: 'age-',
                                 mini: true,
                                 child: Icon(
                                   Icons.remove,
                                 ),
                               ),
                               SizedBox(
                                 width: 15.0,
                               ),
                               FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     age++;
                                   });
                                 },
                                 heroTag: 'age+',
                                 mini: true,
                                 child: Icon(
                                   Icons.add,
                                 ),
                               ),
                             ],
                           ),
                         ],
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20.0),
                         color: Colors.grey[300],
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
           Container (
             width: double.infinity,
             color: Colors.blue,
             child: MaterialButton(
               onPressed: (){
                 var result = weight / pow(height / 100, 2);
                 print(result.round());

                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => BMIResultScreen(
                         age: age,
                         result: result.round(),
                         isMale: isMale,
                       ) ,
                     ),
                   );
               },
               height: 50.0,
               child: Text(
                 'CALCULATE',
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
             ),
           )
         ],
       ),
     );
   }
 }
