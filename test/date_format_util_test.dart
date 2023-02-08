

import 'package:flutter_test/flutter_test.dart';
import 'package:ps5/utils/date_util.dart';

void main() {
  final date = DateTime(2022, 08, 21, 0, 0, 0, 0, 0);
  test('Convert DateTime to another formatted String', () {
    final formatted1 = date.toFormattedString(format: 'dd/MM/yyyy');
    expect(formatted1, '21/08/2022');
    final formatted2 = date.toFormattedString(format: 'dd MMM yyyy');
    expect(formatted2, '21 Aug 2022');
    final formatted3 = date.toFormattedString(format: 'dd-MM-yyyy');
    expect(formatted3, '21-08-2022');
    final formatted4 = date.toFormattedString(format: 'dd MMMM yyyy');
    expect(formatted4, '21 August 2022');
  });
}