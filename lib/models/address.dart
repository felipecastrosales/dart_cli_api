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

  final String street;
  final int number;
  final String cep;
  final City city;
  final Phone phone;
}
