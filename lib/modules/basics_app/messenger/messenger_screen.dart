import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://scontent.ftun2-2.fna.fbcdn.net/v/t39.30808-6/292400157_1276658643143585_6935029292759610729_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=rsGvrDM2PyMAX_uHPwn&_nc_ht=scontent.ftun2-2.fna&oh=00_AT8z1y4hHpUq42DQ4alwV5Og3BO5OApuaKqY231fukBPTQ&oe=631907F3'),
            ),
            SizedBox(
              width: 120,
            ),
            Text(
              'Chats ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){},
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
              Icons.camera_alt,
                color: Colors.white,
                size: 16.0,
          ),
            ),
          ),
          IconButton(onPressed: (){},
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0,),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0,),
                child: Row(
                  children:
                  [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) => buildStoryItem(),
                  separatorBuilder: (context , index ) => SizedBox(
                    width: 15.0,
                  ),
                  itemCount: 7,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context , index) => buildChatItem(),
                separatorBuilder: (context , index ) => SizedBox(
                  height: 15.0,
                ),
                itemCount: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 1 - build Item
  // 2 - build list
  // 3 - add item to list

  //  arrow function
  Widget buildChatItem() => Row(
    children:
    [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage('https://scontent.ftun7-1.fna.fbcdn.net/v/t39.30808-1/288848786_1728612917484802_6127146476094085685_n.jpg?stp=dst-jpg_p240x240&_nc_cat=101&ccb=1-7&_nc_sid=7206a8&_nc_ohc=qcwlsHRwqfwAX9BFaIm&tn=fsENP7bQ-rcR9I6O&_nc_ht=scontent.ftun7-1.fna&oh=00_AfDrYQw9Sz4VklDd2L75euLJMLq_gNMHh9hjU9VLMlDrng&oe=637E8751'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 15.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text(
              'Mounir Ben Romdhane',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Row(
              children:
              [
                Expanded(
                  child: Text(
                    '***********',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0 ,),
                  child: Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                  '02 : 33 pm',
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  Widget buildStoryItem() => Container(
    width: 60.0,
    child: Column(
      children:
      [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('https://scontent.ftun7-1.fna.fbcdn.net/v/t39.30808-1/288848786_1728612917484802_6127146476094085685_n.jpg?stp=dst-jpg_p240x240&_nc_cat=101&ccb=1-7&_nc_sid=7206a8&_nc_ohc=qcwlsHRwqfwAX9BFaIm&tn=fsENP7bQ-rcR9I6O&_nc_ht=scontent.ftun7-1.fna&oh=00_AfDrYQw9Sz4VklDd2L75euLJMLq_gNMHh9hjU9VLMlDrng&oe=637E8751'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          'Mounir Ben Romdhane',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );

}
