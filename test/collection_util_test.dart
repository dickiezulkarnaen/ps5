import 'package:flutter_test/flutter_test.dart';
import 'package:ps5/utils/collection_util.dart';

void main() {
  final collection = ['Car', 'Bus', 'Train', null];
  test('Test Collection Util', () {
    expect(collection.contains(null), true);
    final nonNulls = collection.removeNulls();
    expect(nonNulls.contains(null), false);
  });
}