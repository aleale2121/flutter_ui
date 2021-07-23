import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BurgerTracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: BurgerTracker()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BurgerTracker extends StatefulWidget {
  const BurgerTracker({Key? key}) : super(key: key);

  @override
  _BurgerTrackerState createState() => _BurgerTrackerState();
}

class _BurgerTrackerState extends State<BurgerTracker> {
  int photoIndex = 0;

  List<String> photos = [
    'assets/images/burger1.jpeg',
    'assets/images/burger2.jpeg',
    'assets/images/burger3.jpeg',
    'assets/images/burger4.jpeg',
  ];

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 210.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(photos[photoIndex]),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back_ios),
                          color: Colors.white),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite),
                          color: Colors.pink),
                    ],
                  ),
                  Positioned(
                      top: 105,
                      left: 5.0,
                      right: 5.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: _previousImage,
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.amber,
                              )),
                          IconButton(
                              onPressed: _nextImage,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.amber,
                              ))
                        ],
                      )),
                  Positioned(
                    top: 170.0,
                    left: 5.0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          '4.0',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        SelectedPhoto(
                            noOfDots: photos.length, photoIndex: photoIndex)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OPEN NOW UNTIL 7PM',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'The Cinnamon Snail',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 27.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Text(
                          '17th st & Union Sq East',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5.0),
                        Icon(Icons.location_on),
                        SizedBox(width: 5.0),
                        Text(
                          '400ft Away',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.wifi,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          'Location confirmed by 3 users today',
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      'FEATURED ITEMS',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              _buildListItem(photos[0], 'Halas Labela',
                  'burger contain nice feature of dskf', '11'),
              _buildListItem(photos[1], 'Cr7 Labela',
                  'burger contain nice feature of dskf', '51'),
              _buildListItem(photos[2], 'Leo Labela',
                  'burger contain nice feature of dskf', '33'),
              _buildListItem(photos[3], 'Burno Labela',
                  'burger contain nice feature of dskf', '24'),
            ],
          )
        ],
      ),
    );
  }
}

Widget _buildListItem(
    String picture, String title, String description, String price) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0, left: 20.0),
    child: Row(
      children: [
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(picture),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              )),
        ),
        SizedBox(
          width: 10.0,
        ),
        Container(
          height: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 11.0,
                  fontFamily: 'Montserrat',
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "\$" + price,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

class SelectedPhoto extends StatelessWidget {
  const SelectedPhoto(
      {Key? key, required this.noOfDots, required this.photoIndex})
      : super(key: key);

  final int noOfDots;
  final int photoIndex;

  Widget _inactivePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(4.0)),
        ),
      ),
    );
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0.0,
                  blurRadius: 2.0,
                )
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < noOfDots; i++) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
