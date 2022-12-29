import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textCtrl = TextEditingController();
  final _focusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Column(
          children: [
            CircleAvatar(
              maxRadius: 14,
              child: Text(
                'Te',
                style: TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.blue[100],
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Teodoro Rodriguez',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(children: [
          Flexible(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              reverse: true,
              itemBuilder: (_, i) => Text('$i'),
            ),
          ),
          Divider(height: 1),
          Container(
            color: Colors.white,
            child: InputChat(textController: _textCtrl, focusNode: _focusNode),
          )
        ]),
      ),
    );
  }
}

class InputChat extends StatefulWidget {
  final TextEditingController textController;
  final FocusNode focusNode;

  const InputChat({super.key, required this.textController, required this.focusNode});

  @override
  State<InputChat> createState() => _InputChatState(textController, focusNode);
}

class _InputChatState extends State<InputChat> {
  final TextEditingController textController;
  final FocusNode focusNode;
  bool _estaEscribiendo = false;

  _InputChatState(this.textController, this.focusNode);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: Row(children: [
          Flexible(
            child: TextField(
              controller: textController,
              onSubmitted: _handleSubmit,
              onChanged: (String texto) {
                //TODO cuando hay un valor, para poder postear
                setState(() {
                  _estaEscribiendo = texto.trim().length > 0;
                });
              },
              decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
              focusNode: focusNode,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Platform.isIOS
                ? CupertinoButton(child: Text('Enviar'), onPressed: () {})
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data: IconThemeData(color: _estaEscribiendo ? Colors.blue[400] : null),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(
                          Icons.send,
                        ),
                        onPressed: _estaEscribiendo ? () => _handleSubmit(textController.text.trim()) : null,
                      ),
                    ),
                  ),
          )
        ]),
      ),
    );
  }

  _handleSubmit(String texto) {
    if (texto.length > 0) {
      print(texto);
      textController.clear();
      focusNode.requestFocus();
      setState(() {
        _estaEscribiendo = false;
      });
    }
  }
}
