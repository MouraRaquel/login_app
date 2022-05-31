import 'package:flutter/material.dart';
import 'package:login/pages/login.dart';
import 'package:login/pages/drawer_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("Home Login App", style: TextStyle(
        color: Colors.black,)),),
      body: _body(context),
      drawer: DrawerList(),
    );
  }

  _body(context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(top: 2),
      width: size.width,
      height: size.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

              Expanded(flex: 1, child: Text("Home Login App", style: TextStyle(
                  fontSize: 32,
                  color: Colors.blue[400],
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SigmarOne',))),
              Expanded(flex: 7, child: Text("Este é um modelo simples de página de Login")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(flex: 0, child: _buttonExit(context, "Sair")),

            ],
          ),
          const Expanded(flex: 1, child: Text(" ", style: TextStyle(color: Colors.black))),
        ],
      ),
    );
  }

  _buttonExit(context, String text) {
    return TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.blue, minimumSize: const Size(150, 50)),
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 30)),
        onPressed: () {
          _onClickExit(context);
        });
  }

  _onClickExit(context) {
    Navigator.pop(context, MaterialPageRoute(builder: (BuildContext context) {
      return DrawerList();
    }));
  }

  _img(String img) {
    return Image.asset(
      img,
      width: 300,
      height: 300,
    );
  }
}
