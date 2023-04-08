import 'dart:convert';

import 'city.dart';
import 'phone.dart';

class Address {
  Address({
    required this.street,
    required this.number,
    required this.cep,
    required this.city,
    required this.phone,
  });

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] ?? '',
      number: map['number'] ?? 0,
      cep: map['CEP'] ?? '',
      city: City.fromMap(map['city'] ?? {}),
      phone: Phone.fromMap(map['phone'] ?? {}),
    );
  }

  factory Address.fromJson(String json) => Address.fromMap(jsonDecode(json));

  final String street;
  final int number;
  final String cep;
  final City city;
  final Phone phone;

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'number': number,
      'CEP': cep,
      'city': city.toMap(),
      'phone': phone.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());
}
