import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'First App',
        ),actions: [
         IconButton(
           icon : Icon(
             Icons.settings,
           ),
           onPressed: ()
           {
                print('icon parametre clicked !');
           },
         ),
        Icon(
          Icons.settings,
        ),
      ],
      ),
      body: Column(
        children: [
          Container(
            width: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0,),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                  image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__480.jpg'
                  ),
                  height: 200.0,
                  width: 200.0,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: Text(
                    'Flower',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
