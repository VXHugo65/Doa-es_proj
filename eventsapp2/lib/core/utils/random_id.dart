import 'dart:math';

final random = Random.secure();

int randomId() {
  int min = 1000000000;
  int max = 4294967296;
  return min + random.nextInt(max - min);
}
