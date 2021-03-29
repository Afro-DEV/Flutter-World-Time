import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String backgroundImage = data["isDayTime"] ? "day.png" : "night.png"; //gets day or night png based on wether is day time is true or false
    Color backgroundColour = data["isDayTime"] ? Colors.blue: Colors.indigo[700];

    return Scaffold(
      backgroundColor: backgroundColour,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$backgroundImage"),
              fit:BoxFit.cover, //allows image to cover the entire screen
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120,0 ,0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async {
                   dynamic result = await Navigator.pushNamed(context, "/location"); // on pressed open a new page on top of the old one
                    setState(() {
                      data = {
                        "time": result["time"],
                        "location": result["location"],
                        "isDayTime": result["isDayTime"],
                        "flag": result["flag"],
                      };
                    });
                  },
                  icon: Icon(
                      Icons.edit_location,
                    color: Colors.grey,
                  ),
                  label: Text(
                      "Edit Location",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.5,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        data["location"],
                      style: TextStyle(
                        fontSize: 34,
                        letterSpacing: 2,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data["time"],
                style: TextStyle(
                  fontSize: 70,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
