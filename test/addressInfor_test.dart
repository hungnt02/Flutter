import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/models/addressInfor.dart';
import 'package:my_app/models/province.dart';
import 'package:my_app/models/ward.dart';

void main() {
  group('Test addressInfor', () {
    test('Constructor', () {
      var AddressInfor = AddressInfo(
          province:
              Province(id: '01', name: 'Hà Nội', level: 'Thành phố trung ương'),
          district: District(id: '01', name: 'Nam Từ Liêm', level: 'Quận'),
          ward: Ward(
              districtId: '01',
              name: 'Phú đô',
              level: 'Phường',
              id: '01',
              provinceId: '01'),
          street: 'Lê Quang Đạo');

      expect(AddressInfor?.province, equals(AddressInfor.province));
      expect(AddressInfor?.district, equals(AddressInfor.district));
      expect(AddressInfor?.ward, equals(AddressInfor.ward));
      expect(AddressInfor?.street, equals(AddressInfor.street));
    });
  });
}
