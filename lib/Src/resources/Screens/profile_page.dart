import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileState();
  }
  
}

class ProfileState extends State<ProfilePage>{
  final String _fullName = "Thuan Hoang";
  final String _status = "Software Developer";
  final String _bio =
      "\"Hi, I am a Freelance developer working for hourly basis. If you wants to contact me to build your product leave a message.\"";
  final String _followers = "173";
  final String _posts = "24";
  final String _scores = "450";

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/cover.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/thuan.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Text(
        _fullName,
        style: _nameTextStyle,
      ),
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        _status,
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label) {
    TextStyle _statLabelTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
    );
    return Container(
      width: MediaQuery.of(context).size.width*0.4,
      child:
        Text(
          label,
          style: _statLabelTextStyle,
        ),
    );
  }
  Widget _buildStatItem1(String label) {
    TextStyle _statLabelTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
    );
    return Container(
      width: MediaQuery.of(context).size.width*0.4,
      child:
      Text(
        label,
        style: _statLabelTextStyle,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildStatContainer(String title,String data) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 40.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        children: <Widget>[
          _buildStatItem("$title"),
          Spacer(),
          _buildStatItem1("$data"),
        ],
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  Widget _buildGetInTouch(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "Get in Touch with ${_fullName.split(" ")[0]},",
        style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => print("followed"),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(width: 10.0),
          // Expanded(
          //   child: InkWell(
          //     onTap: () => print("Message"),
          //     child: Container(
          //       height: 40.0,
          //       decoration: BoxDecoration(
          //         border: Border.all(),
          //       ),
          //       child: Center(
          //         child: Padding(
          //           padding: EdgeInsets.all(10.0),
          //           child: Text(
          //             "MESSAGE",
          //             style: TextStyle(fontWeight: FontWeight.w600),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6.3),
                  _buildProfileImage(),
                  _buildFullName(),
                  _buildStatus(context),
                  _buildStatContainer("Phone", "0961515949"),
                  _buildStatContainer("Address", "47B Vườn Lài quận 12"),
                  _buildStatContainer("Wallet", "700.000Vnđ"),
                  _buildStatContainer("Office Address", "13A Hoàng Diệu Quận 2"),
                  _buildSeparator(screenSize),
                  SizedBox(height: 10.0),
                  // _buildGetInTouch(context),
                  SizedBox(height: 8.0),
                  _buildButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}