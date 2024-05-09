import 'dart:math';

final random = Random.secure();

int randomId() {
  int min = 1000000000;
  int max = 9999999999;
  return min + random.nextInt(max - min);
}
