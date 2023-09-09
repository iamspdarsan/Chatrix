double getresponsivesize(int val, {double? height, double? width}) {
  late double res;
  if (width != null) {
    res = ((val / width * 100) * width) / 100;
  } else if (height != null) {
    res = ((val / height * 100) * height) / 100;
  }
  return res;
}
