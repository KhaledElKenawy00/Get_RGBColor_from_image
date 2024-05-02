class Colorr {
  final int alpha, blue, green, red;

  Colorr(int abgr)
      : alpha = abgr >> 24 & 0xFF,
        blue = abgr >> 16 & 0xFF,
        green = abgr >> 8 & 0xFF,
        red = abgr & 0xFF;

  @override
  String toString() {
    return 'R: $red, G: $green, B: $blue, A: $alpha';
  }
}
