import 'package:flutter/material.dart';
import 'package:flutter_chatapp/models/usuario.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(uuid: '1', nombre: 'Maria', email: 'maria@gmail.com', online: true),
    Usuario(uuid: '2', nombre: 'Jose', email: 'jose@gmail.com', online: true),
    Usuario(uuid: '3', nombre: 'Daniel', email: 'daniel@gmail.com', online: true),
    Usuario(uuid: '4', nombre: 'Laura', email: 'laura@gmail.com', online: false),
  ];

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mi nombre',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue),
            // Icon(Icons.offline_bolt, color: Colors.red),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        child: _ListViewUsuarios(usuarios: usuarios),
        enablePullDown: true,
        onRefresh: () => _cargarUsuarios(),
        header: WaterDropHeader(
            complete: Icon(
          Icons.check,
          color: Colors.blue[400],
        )),
      ),
    );
  }

  _cargarUsuarios() async {
    await Future.delayed(Duration(seconds: 1));

    _refreshController.refreshCompleted();
  }
}

class _ListViewUsuarios extends StatelessWidget {
  const _ListViewUsuarios({
    Key? key,
    required this.usuarios,
  }) : super(key: key);

  final List<Usuario> usuarios;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, i) => _UsuarioListTile(usuario: usuarios[i]),
      separatorBuilder: (context, index) => Divider(),
      itemCount: usuarios.length,
    );
  }
}

class _UsuarioListTile extends StatelessWidget {
  const _UsuarioListTile({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        backgroundColor: Colors.blue.shade100,
        child: Text(usuario.nombre.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: usuario.online ? Colors.green.shade300 : Colors.red.shade300,
        ),
      ),
    );
  }
}
