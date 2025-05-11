import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:bizzntek_assignment/core/utils/assets/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.logo).existsSync(), isTrue);
  });
}
