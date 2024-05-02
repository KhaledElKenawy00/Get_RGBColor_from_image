import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image/image.dart';

Future<void> main() async {
  final url =
      'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNWR1enpyNTBjaXhkZmV6MXZlanhhcXRkMjFuaHM2ZjMyNDZldjA2ayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/bGgsc5mWoryfgKBx1u/giphy.gif';
  final resp = await get(Uri.parse(url)); //Download the image data from the url
  final img = resp.bodyBytes;

  final decodedImg = decodeImage(img); //Decode the received image data
  if (decodedImg == null) {
    throw 'Invalid image';
  }
  final bytesList = decodedImg.data;
  List<Color> colorList =
      bytesList!.map<Color>((e) => e).toList(); //Map the decoded data to colors

  //Change format to a 2d list of colors so that they can be accessed as colorGrid[x][y]
  final List<List<Color>> colorGrid = [];
  for (int x = 0; x < decodedImg.width; x++) {
    colorGrid.add([]);
    for (int y = 0; y < decodedImg.height; y++) {
      colorGrid[x].add(colorList[x + y * decodedImg.width]);
    }
  }

  print(colorGrid);
}
