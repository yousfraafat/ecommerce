extension HttpExtension on int {
  bool isSuccessCall() {
    return this >= 200 && this < 300;
  }
}
