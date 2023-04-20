# Dart CLI & API Example

This is a simple example of how to consume a REST API and how build a CLI using Dart.

## About 

API Consume and CLI Example using Dart. 

## API Consume

See the data modeling example with documentation (explaining the complete code). 

```
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
```

## CLI

See the CLI example commands:

- Help: 

  `dart ./bin/dart_cli.dart -h`

- Find all:

  `dart ./bin/dart_cli.dart students findAll`

- Find by id:

  `dart ./bin/dart_cli.dart students findById -i 1`

- Insert:

  `dart ./bin/dart_cli.dart students insert -f ./students.csv`

- Update:

  `dart ./bin/dart_cli.dart students update -f ./students_update.csv -i 3`

- Delete:

  `dart ./bin/dart_cli.dart students delete -i 3`

To debug the CLI, see the [launch.json](.vscode/launch.json).

## How to run

- Basic configuration

```
$ git clone https://github.com/felipecastrosales/dart_cli_api
$ cd dart_cli_api
$ code .
$ dart pub get
$ cd backend
```

- Run the backend

```
$ dart pub global activate json_rest_server
$ cd backend
$ json_rest_server run
```

- Run the frontend
```
$ cd ..
$ dart run lib/dart_cli_api.dart
```
