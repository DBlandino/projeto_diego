import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'PCInfo.dart';
import 'SideMenu.dart';

class PCGamerList extends StatefulWidget {
  @override
  _PCGamerListState createState() => _PCGamerListState();
}

class _PCGamerListState extends State<PCGamerList> {
  List img = [
    "assets/ener.jpg",
    "assets/ener2.jpg",
    "assets/ener3.jpg",
    "assets/ener4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text("PC Gamer"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () {/*_reset();*/})
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "  PC Gamer Enermax Saberay",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18.0,
              ),

              Container(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 30,
                  right: 00,
                ),
                width: 300.00,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PCInfo(),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    elevation: 0.0,
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Color(0xFF40EDD0), Color(0xFF007FFF)]),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Especificações",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight:
                                  FontWeight.bold),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 24.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    itemCount: img.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            img[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) {
                      return new StaggeredTile.count(1, index.isEven ? 1.2 : 2);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
