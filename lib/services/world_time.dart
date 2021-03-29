import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag; //url to an asset flag icon
  String url; // location url for api endpoint
  bool isDayTime; // tue or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {   //use future too let the the await function know when async is done
    try {
      Response response =
          await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties from data
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);
      int dayOfYear = data["day_of_year"];
      //print(datetime);
      //print(offset);
      //print(dayOfYear);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // if hour is between 6 and 20 then set it is dayTime to true if not it will set it to false
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      //set time property
      time = DateFormat.jm().format(now); // converts the time into a readable format
    } catch (e) {
      print("caught error");
      time ="could not get time data"; // if there is an error print couuld not get time data
    }


  }
}
