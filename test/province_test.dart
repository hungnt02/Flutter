import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/province.dart';

void main() {
  group('Test province', () {
    test('Constructor', () {
      var province =
          Province(id: "01", name: "Hà nội", level: "Thành phố trung ương");

      expect(province?.id, equals("01"));
      expect(province?.name, equals("Hà nội"));
      expect(province?.level, equals("Thành phố trung ương"));
    });
  });
}
