

import 'package:flutter_test/flutter_test.dart';
import 'package:ps5_dicky_iskandar_z/core/network/http.dart';

class MockGithubApi extends Http {
  @override
  Map<String, dynamic> get baseHeaders => {};

  @override
  String get baseUrl => 'https://api.github.com/';
}

Future<void> main() async {
  final http = MockGithubApi();
  test('Test HTTP Class by mocking Github API', () async {
    final res = await http.get(path: 'users/dickiezulkarnaen');
    final name = res.result['name'];
    expect(name, 'dickiez');
  });
}