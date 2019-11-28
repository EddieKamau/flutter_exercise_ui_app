import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  return runApp(MaterialApp(
  home: MainApp()
  ));
}
class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentBottomNavItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value){
          setState(() {
            _currentBottomNavItem = value;
          });
        },
        currentIndex: _currentBottomNavItem,
        elevation: 0,
        backgroundColor: Color.fromRGBO(44, 44, 84,1.0),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white70,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.forward_30),
            title: _currentBottomNavItem == 0 ? Container(height: 3, width: 14, color: Colors.blueAccent, margin: EdgeInsets.only(top: 2),) : Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: _currentBottomNavItem == 1 ? Container(height: 3, width: 14, color: Colors.blueAccent, margin: EdgeInsets.only(top: 2),) : Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            title: _currentBottomNavItem == 2 ? Container(height: 3, width: 14, color: Colors.blueAccent, margin: EdgeInsets.only(top: 2),) : Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flare),
            title: _currentBottomNavItem == 3 ? Container(height: 3, width: 14, color: Colors.blueAccent, margin: EdgeInsets.only(top: 2),) : Container(),
          ),

        ],
      ),
      body: Material(
        color: Color.fromRGBO(44, 44, 84,1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Humbergger icon
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.menu, color: Colors.white70,),
            ),

            // pageview carousel
            Container(
              height: 200,
              child: PagevieCarousel(),
            ),

            // Body
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: <Widget>[
                    // Title
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Daily Exercise',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 29
                        ),
                      ),
                    ),

                    // Grid cards
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index){
                          return Card(
                            color: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.all(18),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Top
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Icon(Icons.airline_seat_recline_extra, size: 35, color: Colors.white70,),
                                        Text(
                                          'Push Up',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Bottom
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              RichText(
                                                maxLines: 1,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: '33',
                                                      style: TextStyle(
                                                        color: Colors.white38,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 17
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '/45',
                                                      style: TextStyle(
                                                        color: Colors.white38
                                                      ),
                                                    )
                                                  ]
                                                ),
                                              ),
                                              Text(
                                                'active',
                                                style: TextStyle(
                                                  color: Colors.white38,
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: Colors.white12,
                                              shape: BoxShape.circle
                                            ),
                                            child: Center(
                                              child: Text(
                                                '75%',
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PagevieCarousel extends StatefulWidget {
  @override
  _PagevieCarouselState createState() => _PagevieCarouselState();
}

class _PagevieCarouselState extends State<PagevieCarousel> {
  
  PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage, viewportFraction: 0.9)..addListener((){
      setState(() {
        _currentPage = _pageController.page.floor();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index){
              return Card(
                color: Colors.transparent,
                elevation: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width *.8,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/DeskWalls.jpg'), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,

                      child: ClipPath(
                        clipper: ClipCarousel(),
                        child: Container(
                          width: MediaQuery.of(context).size.width*.55,
                          color: Colors.white24,
                          padding: EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                maxLines: 2,
                                text: TextSpan(
                                  text: 'How to get a',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '\nMuscular Back?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                      )
                                    )

                                  ]
                                ),
                              ),
                              RichText(
                                maxLines: 2,
                                text: TextSpan(
                                  text: 'Crazy Genius',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 17
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '\n1 week ago',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 11
                                      ),
                                    )
                                  ]
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white70),
                                    child: Icon(Icons.stop, color: Color.fromRGBO(44, 44, 84,1.0), size: 15,),
                                  ),
                                  Text(
                                    'Watch Later',
                                    style: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '24 mins',
                                        style: TextStyle(
                                          color: Colors.white54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // current itemdisplay
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          <Widget>[
            for(int i = 0; i < 3; i++)
            Container(
              margin: EdgeInsets.all(4),
              width: i == _currentPage ? 23 : 9,
              height: 6,
              decoration: BoxDecoration(
                color: i == _currentPage ? Colors.blueAccent: Colors.white10,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            
          ],
        ),
      ],
    );
  }
}


class ClipCarousel extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double _height = size.height;
    double _width = size.width;
    Path path = Path();
    path.lineTo(_width *.7, 0);
    path.lineTo(_width, _height);
    path.lineTo(0, _height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}