import 'dart:io';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:kuis_d_123190018/model/app_store.dart';


class DetailScreen extends StatelessWidget {
  final infoTextStyle = TextStyle(fontFamily: "Oxygen");
  final AppStore place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(children: [
                Image.asset(place.imageLogo,height: 150,width: 150,),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ]),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Staatliches'),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8.0),
                        Text(
                          place.genre,
                          style: infoTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.developer_board),
                        SizedBox(height: 8.0),
                        Text(
                          place.developer,
                          style: infoTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.star),
                        SizedBox(height: 8.0),
                        Text(
                          place.rating,
                          style: infoTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  place.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.imageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(url),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                width: 300.0,
                child: Center(
                  child: Column(
                    children: [
                      _downloadButton(),
                    ],


                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _downloadButton(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: 200.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
        ),
        onPressed:(){
          html.window.open(place.appLink, 'new tab');

        }, child: const Text('Download'),
      ),

    );
  }

}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}
