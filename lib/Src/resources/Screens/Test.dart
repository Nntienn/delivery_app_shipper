import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HorizontalAndVerticalListView extends StatefulWidget {
  @override
  _HorizontalAndVerticalListViewState createState() => _HorizontalAndVerticalListViewState();
}

class _HorizontalAndVerticalListViewState extends State<HorizontalAndVerticalListView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("MovieList"),
          backgroundColor: Color(0xFF5CA0D3),
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://images.unsplash.com/photo-1517404215738-15263e9f9178?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                fit: BoxFit.fill,
              )),
        ),
        SliverFixedExtentList(
          itemExtent: 200,
          delegate: SliverChildListDelegate([
            _listItem(),
            _listItem(),
            _listItem(),
            _listItem(),
            ///add more as you wish
          ]),
        )
      ],
    );
  }

  _listItem() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          MovieCard(),
          MovieCard(),
          MovieCard(),
          MovieCard()

          ///add more as you wish
        ],
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  String path="images/svgs/yts_logo.svg";
  int ratings=2;
  //MovieCard({@required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 3),
      width: 200,
      height: 300,
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 12,
            child: SvgPicture.asset(path,fit: BoxFit.fill,width: 100,height: 100,),
          ),
          //title
          SizedBox(
            height: 5,
          ),
          Text("title",
              style: TextStyle(fontFamily: 'open_sans',color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal)
          ),
          IconTheme(
            data: IconThemeData(
              color: Colors.amber,
              size: 20,
            ),
            child:  _provideRatingBar(3),
          )
          //ratings
        ],
      ),
    );
  }


  _provideRatingBar(int rating){
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Icon(
            index < rating ? Icons.star : Icons.star_border,
          );
        })
    );
  }
}