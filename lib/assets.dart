import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:image/image.dart';

class Assets {
  final decoder = JpegDecoder();
  static List<List<List<int>>> imgArr = [];
  itialize() async {
    final Uint8List inputImg =
        (await rootBundle.load("assets/doctor.png")).buffer.asUint8List();

    final decodedImg = decoder.decode(inputImg);
    final decodedBytes = decodedImg!.getBytes(order: ChannelOrder.rgb);

    for (int y = 0; y < decodedImg.height; y++) {
      imgArr.add([]);
      for (int x = 0; x < decodedImg.width; x++) {
        int red = decodedBytes[y * decodedImg.width * 3 + x * 3];
        int green = decodedBytes[y * decodedImg.width * 3 + x * 3 + 1];
        int blue = decodedBytes[y * decodedImg.width * 3 + x * 3 + 2];
        imgArr[y].add([red, green, blue]);
      }
    }
  }
}
