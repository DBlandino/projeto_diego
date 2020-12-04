import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'SideMenu.dart';

class PCInfo extends StatefulWidget {
  @override
  _PCInfoState createState() => _PCInfoState();
}

class _PCInfoState extends State<PCInfo> {
  
  int _current = 0;
  List imgList = [
    "assets/ener.jpg",
    "assets/ener2.jpg",
    "assets/ener3.jpg",
    "assets/ener4.jpg",
    "assets/ener5.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text("Informações"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () {})
        ],
      ),
      backgroundColor: Colors.white, 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Enermax Saberay",
                style: TextStyle(
                  color: Color(0xff142243),
                  fontSize: 28.0,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Computador Gamer I7 10700K, 64GB DDR4, Nvidia RTX 2080 Super",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff142243),
                    letterSpacing: 3.0,
                    height: 1.5),
              ),
              SizedBox(
                height: 30.0,
              ),
              CarouselSlider(
                height: 400.0,
                initialPage: 0,
                enlargeCenterPage: true,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                items: imgList.map((imgUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(35.0),
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Image.asset(
                          imgUrl,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFF007FFF),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box, color: Colors.white 
                  ),
              title: Text(
                "Projeto",
                style: TextStyle(color: Colors.white), 
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.gamepad, color: Colors.white
                  ),
              title: Text(
                "Galeria",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplay, color: Colors.white
                  ),
              title: Text(
                "Informações",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.white),
        ],
      ),
    );
  }
}
