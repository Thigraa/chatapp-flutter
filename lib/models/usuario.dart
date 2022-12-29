import 'package:flutter/cupertino.dart';

class Usuario with ChangeNotifier {
  bool online;
  String email;
  String nombre;
  String uuid;

  Usuario({
    required this.nombre,
    required this.email,
    required this.online,
    required this.uuid,
  });
}
