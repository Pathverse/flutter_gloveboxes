// ignore_for_file: avoid_print

import 'lib/utils/serialize.dart';

void main() {
  print('Testing [1, 2, [3, 4]]:');
  var testList = [
    1,
    2,
    [3, 4],
  ];
  print('Result: ${simpleValue(testList)}');

  print('\nTesting individual items:');
  for (var i = 0; i < testList.length; i++) {
    print('Item $i (${testList[i]}): ${simpleValue(testList[i])}');
  }

  print('\nTesting null:');
  print('Result: ${simpleValue(null)}');
}
