import 'package:flutter/material.dart';
import 'package:testapp/apiUtils/photo.dart';
import 'package:testapp/screens/image_screen.dart';

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
        GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
          child: Image.network(
              photos[index].photo,
            width: 150,
            height: 150,
          ),
        ),
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return ImageScreen(img: photos[index].photo);
            }));
          },
        ),
            Text(
              photos[index].photoName,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              photos[index].userName,
            )
          ],
        );
      },
    );
  }
}