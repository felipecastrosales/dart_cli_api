import 'dart:convert';

/// Dart class named Phone with a constructor,
/// two factory methods ([fromMap] and [fromJson]),
/// and two methods ([toMap] and [toJson]),
/// that handle the serialization and deserialization of [JSON] data.

/// Serialization (convert Dart objects to JSON) related methods: [toMap] and [toJson].
/// Deserialization (converting JSON to Dart objects) related methods: [fromMap] and [fromJson].

class Phone {
  Phone({
    required this.ddd,
    required this.phone,
  });

  /// [fromMap] factory method that creates a [Phone] from a [Map].
  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      ddd: map['ddd'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  /// [fromJson] factory method that creates a [Phone] from a JSON [String].
  factory Phone.fromJson(String json) => Phone.fromMap(jsonDecode(json));

  /// ddd is a [int] that represents the phone's ddd.
  final String ddd;

  /// phone is a [String] that represents the phone's number.
  final String phone;

  /// [toMap] method that converts a [Phone] to a [Map].
  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'phone': phone,
    };
  }

  /// [toJson] method that converts a [Phone] to a JSON [String].
  String toJson() => jsonEncode(toMap());

  /// [toString] method that returns a [String] representation of a [Phone].
  @override
  String toString() => 'Phone(ddd: $ddd, phone: $phone)';
}
