import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main () => runApp(
  MaterialApp(
    title: "WEATHER",
    home: Page1(),
  )
);
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Align (
        alignment: Alignment.topRight,
        child: FlatButton(
        onPressed: () {
          Navigator.of(context)
              .push(
              MaterialPageRoute(
                builder: (context) => Home()

          )
          );
        },
          child:Icon (
            Icons.wb_sunny,
            color: Colors.amberAccent,
            size: 50.0
          ),
        )),
    );

  }
}
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var feelsLike;
  var visibility;
  var high;
  var low;

  
  Future getWeather () async {
    http.Response response = await http.get("http://api.openweathermap.org/data/2.5/weather?q=Wichita&units=imperial&appid=b019ccfb8dc5321a73fdd9c6396105d8");
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'].round();
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'].round();
      this.feelsLike = results['main']['feels_like'].round();
      this.visibility = results['visibility'];
      this.high = results['main']['temp_max'];
      this.low = results['main']['temp_min'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget> [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/img/weather.jpg"),
                    fit : BoxFit.cover,
                alignment: Alignment.center,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child:Text(
                    "Currently in Wichita, KS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                ),

                Text(
                  temp != null ? temp.toString() + " °F" : "Loading",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child:Text(
                    description != null ? description.toString() : "Loading",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700
                    ),
                  ),

                ),
              ],
            )
          ),
          Expanded (
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    title: Text("Feels Like"),
                    trailing: Text(feelsLike != null ? feelsLike.toString() + " °F" : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.eye),
                    title: Text("Visibility"),
                    trailing: Text(visibility != null ? visibility.toString() : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.water),
                    title: Text("Humidity"),
                    trailing: Text(humidity != null ? humidity.toString() + " %" : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("Wind Speed"),
                    trailing: Text(windSpeed != null ? windSpeed.toString() : "Loading"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}