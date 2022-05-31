import 'package:flutter/material.dart';
import 'package:login/home_page.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Login App"),
        ),
        body: _body(context));
  }

  _body(context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      
      key: _formKey,
      child: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _text("Login", "Digite o Login",
                controller: _tLogin,
                //validator: _validateLogin,
                keyboardType: TextInputType.emailAddress, validator: (String? value) { _validateLogin;
 return null; }),
            const SizedBox(
              height: 10,
            ),
            _text("Senha", "Digite a senha",
                password: true,
                controller: _tSenha,
                //validator: _validateSenha,
                keyboardType: TextInputType.number, validator: (String? value) { _validateSenha;
 return null; }),
            const SizedBox(
              height: 20,
            ),
            _button(context, "Entrar", _onClickLogin),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  _text(
    String label,
    String hint, {
    bool password = false,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
    required TextInputType keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 25, color: Colors.blue),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 25, color: Colors.blue),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 16),
      ),
    );
  }

  _button(context, String text, Function onPressed) {
    return SizedBox(
      height: 46,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.blue
          ),
          child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 22)),
          onPressed: () {
            _onClickLogin(context);
          }
      ),
    );
  }

  void _onClickLogin(context) {
    if (_formKey.currentState != null) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return HomePage();
    }));
  }

  String? _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String? _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }
    if (text.length < 6) {
      return "A Senha precisa ter pelo menos 6 caracteres";
    }
    return null;
  }
}
