import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crousel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Crousel(),
    );
  }
}

class Crousel extends StatefulWidget {
  const Crousel({Key? key}) : super(key: key);

  @override
  _CrouselState createState() => _CrouselState();
}

class _CrouselState extends State<Crousel> {
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
      appBar: AppBar(
        title: Text('Carousel'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  image: DecorationImage(
                      image: AssetImage(photos[photoIndex]), fit: BoxFit.cover),
                ),
                height: 400.0,
                width: 300.0,
              ),
              Positioned(top: 375.0, left: 25.0, right: 25.0,
              child: SelectedPhoto(
                noOfDots: photos.length,
                photoIndex:photoIndex ,
              ),)
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _nextImage,
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  elevation: 5.0,
                ),
                child: Text('Next'),
              ),
              SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                onPressed: _previousImage,
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  elevation: 5.0,
                ),
                child: Text('Prev'),
              ),
            ],
          )
        ],
      ),
    );
  }
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
        children: _buildDots(),),
    );
  }
}
