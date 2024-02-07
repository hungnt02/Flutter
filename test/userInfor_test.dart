import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/addressInfor.dart';
import 'package:my_app/province.dart';

void main() {
  group('Test addressInfor', () {
    test('Constructor', () {
      var UserInfor = UserInfo(
          name: 'Nguyễn Tuấn Hưng',
          email: 'hung@gamil.com',
          phoneNumber: '04566544556',
          birthDate: DateTime.now(),
          address: AddressInfo(
              province: Province(
                  id: '01', name: 'Hà Nội', level: 'Thành phố trung ương'),
              district: District(id: '01', name: 'Nam Từ Liêm', level: 'Quận'),
              ward: Ward(
                  districtId: '01',
                  name: 'Phú đô',
                  level: 'Phường',
                  id: '01',
                  provinceId: '01'),
              street: 'Lê Quang Đạo'));

      expect(UserInfor?.name, equals(UserInfor.name));
      expect(UserInfor?.email, equals(UserInfor.email));
      expect(UserInfor?.phoneNumber, equals(UserInfor.phoneNumber));
      expect(UserInfor?.birthDate, equals(UserInfor.birthDate));
      expect(UserInfor?.address, equals(UserInfor.address));
    });
  });
}
