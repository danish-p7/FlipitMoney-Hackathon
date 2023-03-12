import 'dart:math';

String randomString(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random.secure();

  return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
}