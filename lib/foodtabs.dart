import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildListItem('Delicious hot dog', 4.0, '6', 'assets/hotdog.png'),
          _buildListItem('Tasty Pizza', 4.0, '6', 'assets/burger.png'),
          _buildListItem('Yummy Fries', 4.0, '6', 'assets/fries.png'),
        ],
      ),
    );
  }

  _buildListItem(String foodName, rating, String price, String imgPath) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 210.0,
            child: Row(
              children: <Widget>[
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Color(0xFFFFE3DF)),
                  child: Center(
                      child: Image.asset(imgPath, height: 50, width: 50)),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      foodName,
                      style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    SmoothStarRating(
                      allowHalfRating: false,
                      onRatingChanged: (v) {},
                      starCount: rating.toInt(),
                      rating: rating,
                      color: Color(0xFFFFD143),
                      borderColor: Color(0xFFFFD143),
                      size: 15.0,
                      spacing: 0.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '\$' + price,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            textStyle: TextStyle(
                              color: Color(0xFFF68D7F),
                            ),
                          ),
                        ),
                        SizedBox(width: 3.0,),
                        Text(
                          '\$' + '18',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            textStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          FloatingActionButton(
            heroTag: foodName,
            mini: true,
            onPressed: (){},
            child: Center(
              child: Icon(Icons.add,color:Colors.white),
            ),
            backgroundColor: Color(0xFFFE7D6A),
          )
        ],
      ),
    );
  }
}
