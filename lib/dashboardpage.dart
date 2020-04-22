import 'package:flutter/material.dart';
import 'package:foodorderappui/burgerpage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'foodtabs.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6.0,
                        spreadRadius: 4.0,
                        offset: Offset(0.0, 3.0))
                  ],
                  color: Color(0xFFC6E7FE),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/tuxedo.png'),
                      fit: BoxFit.contain),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'SEARCH FOR',
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w800,
              fontSize: 27.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'RECIPIES',
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w800,
              fontSize: 27.0,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Container(
            padding: EdgeInsets.only(left: 5.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Recommended',
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildListItem('Hamburger', 'assets/burger.png', '21',
                  Colors.orange.shade100, Colors.orange.shade800),
              _buildListItem('Fries', 'assets/fries.png', '21',
                  Colors.blue.shade100, Colors.blue.shade800),
              _buildListItem('Donuts', 'assets/donut.png', '21',
                  Colors.green.shade100, Colors.green.shade800),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(0.5),
            labelStyle: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: GoogleFonts.notoSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            tabs: <Widget>[
              Tab(
                child: Text('FEATURED'),
              ),
              Tab(
                child: Text('COMBO'),
              ),
              Tab(
                child: Text('FAVOURITES'),
              ),
              Tab(
                child: Text('RECOMMENDED'),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 450,
          child: TabBarView(
            controller: tabController,
            children: [
              FoodTab(),
              FoodTab(),
              FoodTab(),
              FoodTab(),
            ],
          ),
        )
      ],
    ));
  }

  _buildListItem(String foodName, String imgPath, String price, Color bgColor,
      Color textColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BurgerPage(
                  heroTag: foodName,
                  foodName: foodName,
                  pricePerItem: price,
                  imagePath: imgPath)));
        },
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: bgColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: foodName,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      imgPath,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                foodName,
                style: GoogleFonts.notoSans(fontSize: 17, color: textColor),
              ),
              Text(
                '\$' + price,
                style: GoogleFonts.notoSans(fontSize: 17, color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
