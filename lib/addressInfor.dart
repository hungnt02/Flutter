// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_app/province.dart';

class AddressInfo {
  Province? province;
  District? district;
  Ward? ward;
  String? street;
  AddressInfo({
    this.province,
    this.district,
    this.ward,
    this.street,
  });

  AddressInfo copyWith({
    Province? province,
    District? district,
    Ward? ward,
    String? street,
  }) {
    return AddressInfo(
      province: province ?? this.province,
      district: district ?? this.district,
      ward: ward ?? this.ward,
      street: street ?? this.street,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'province': province?.toMap(),
      'district': district?.toMap(),
      'ward': ward?.toMap(),
      'street': street,
    };
  }

  factory AddressInfo.fromMap(Map<String, dynamic> map) {
    return AddressInfo(
      province: map['province'] != null
          ? Province.fromMap(map['province'] as Map<String, dynamic>)
          : null,
      district: map['district'] != null
          ? District.fromMap(map['district'] as Map<String, dynamic>)
          : null,
      ward: map['ward'] != null
          ? Ward.fromMap(map['ward'] as Map<String, dynamic>)
          : null,
      street: map['street'] != null ? map['street'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressInfo.fromJson(String source) =>
      AddressInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressInfo(province: $province, district: $district, ward: $ward, street: $street)';
  }

  @override
  bool operator ==(covariant AddressInfo other) {
    if (identical(this, other)) return true;

    return other.province == province &&
        other.district == district &&
        other.ward == ward &&
        other.street == street;
  }

  @override
  int get hashCode {
    return province.hashCode ^
        district.hashCode ^
        ward.hashCode ^
        street.hashCode;
  }
}

class UserInfo {
  String? name;
  String? email;
  String? phoneNumber;
  DateTime? birthDate;
  AddressInfo? address;
  UserInfo({
    this.name,
    this.email,
    this.phoneNumber,
    this.birthDate,
    this.address,
  });

  UserInfo copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    DateTime? birthDate,
    AddressInfo? address,
  }) {
    return UserInfo(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthDate: birthDate ?? this.birthDate,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate?.millisecondsSinceEpoch,
      'address': address?.toMap(),
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      birthDate: map['birthDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['birthDate'] as int)
          : null,
      address: map['address'] != null
          ? AddressInfo.fromMap(map['address'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfo(name: $name, email: $email, phoneNumber: $phoneNumber, birthDate: $birthDate, address: $address)';
  }

  @override
  bool operator ==(covariant UserInfo other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.birthDate == birthDate &&
        other.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        birthDate.hashCode ^
        address.hashCode;
  }
}
