import 'package:flutter/material.dart';
import 'package:login/home_page.dart';
import 'package:login/pages/login.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("User Name"),
              accountEmail: Text("usermail@mail.br"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(""),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_to_home_screen),
              title: const Text("Página Inicial"),
              subtitle: const Text("Mais informações"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt),
              title: const Text("Tela de Login"),
              subtitle: const Text("Visualizar tela de Login"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Logout"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => onClickLogout(context),
            )
          ],
        ),
      ),);
  }
}
  onClickLogout(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Login();
    }));
  }



