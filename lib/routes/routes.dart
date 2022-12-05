import 'package:flutter/widgets.dart';
import 'package:flutter_chatapp/pages/chat_page.dart';
import 'package:flutter_chatapp/pages/loading_page.dart';
import 'package:flutter_chatapp/pages/login_page.dart';
import 'package:flutter_chatapp/pages/register_page.dart';
import 'package:flutter_chatapp/pages/usuarios_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  'usuarios': (_) => UsuariosPage(),
  'chat': (_) => ChatPage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage(),
};
