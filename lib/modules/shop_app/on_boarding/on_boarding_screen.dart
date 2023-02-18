import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children:
          [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => buildBoardingItem(),
                itemCount: 3,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children:
              [
                Text('Indicator'),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){},
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
    [
      Expanded(
        child: Image(
          image: AssetImage('images/onBoard.jpg'),
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        'Screen Title',
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        'Screen body',
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
    ],
  );

}
