import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Reset.dart';
import 'Inicial.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    int verificado;
    return Scaffold(
      appBar: AppBar(
        title: Text("Gamers Gear"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                limparCampos();
              })
        ],
      ),
      body: Container(
          padding: EdgeInsets.only(
            top: 40,
            left: 40,
            right: 40,
          ),
          color: Colors.white,
          child: ListView(
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset("assets/ener.jpg"),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: username,
                  decoration: InputDecoration(
                    labelText: "Usuário",
                    icon: Icon(Icons.person),
                    hintText: 'Digite o seu E-mail',
                  )),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    icon: Icon(Icons.android),
                    hintText: 'Digite a sua Senha',
                  )),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text(
                    "Recuperar Senha",
                    textAlign: TextAlign.right,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Reset(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0xFF007FFF),
                      Color(0xFF40EDD0),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Logar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          child: SizedBox(
                            height: 35,
                            width: 35,
                            child: Image.asset("assets/login.png"),
                          ),
                        )
                      ],
                    ),
                    onPressed: () => {
                      if ((username.text != "") &&
                          (username.text.contains("@")) &&
                          (username.text.contains(".")) &&
                          (password.text != ""))
                        {
                          logar(),
                          verificado = validarUser(),
                          if (verificado == 2)
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TelaPrincipal(),
                                ),
                              ),
                            }
                          else if (verificado == 3)
                            {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text("Gamers Gear"),
                                  content: Text("Usuário ou Senha incorretos!"),
                                ),
                              ),
                            }
                          else if (verificado == 4)
                            {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text("Gamers Gear"),
                                  content: Text("Usuário ou Senha incorretos!"),
                                ),
                              ),
                            }
                        }
                      else
                        {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Gamers Gear"),
                              content: Text("Digite um E-mail e Senha!"),
                            ),
                          ),
                        }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0xFF007FFF),
                      Color(0xFF40EDD0),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Registrar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          child: SizedBox(
                            height: 35,
                            width: 35,
                            child: Image.asset("assets/login.png"),
                          ),
                        )
                      ],
                    ),
                    onPressed: () => {
                      if ((username.text != "") &&
                          (username.text.contains("@")) &&
                          (username.text.contains(".")) &&
                          (password.text != "") &&
                          (username.text.length > 6))
                        {
                          registrar(),
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Gamers Gear"),
                              content: Text("Usuário Registrado!"),
                            ),
                          ),
                        }
                      else
                        {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Gamers Gear"),
                              content: Text("Digite um E-mail e Senha!"),
                            ),
                          ),
                        }
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void limparCampos() {
    setState(() {
      username.text = "";
      password.text = "";
    });
  }

  void registrar() async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: username.text, password: password.text);
      user = result.user;
      if (user != null) {
        print("\USUÁRIO: " + user.uid + " REGISTRADO!\n");
      }
    } catch (excessao) {
      print("\nUSUÁRIO NÃO FOI REGISTRADO!\nEXCESSÃO: " + excessao + "\n");
    }
  }

  void logar() async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: username.text, password: password.text);
      user = result.user;
    } catch (excessao) {
      print("\nUSUÁRIO NÃO FOI LOGADO!\nEXCESSÃO: " + excessao + "\n");
    }
  }

  int validarUser() {
    int check = 0;
    if (user != null) {
      // Usuario foi consultado no FireAut, então check = 1
      print("O USUÁRIO: " + user.uid + " LOGOU!\n");
      check = 1;
      if (user.email == username.text) {
        // Usuario foi consultado no FireAut e foi validado, então check = 2
        print("USUÁRIO: " + username.text + " Logado\n");
        print("FIREAUTH: " + user.email + " Logado\n");
        print("USUÁRIO ID: " + user.uid + " Logado\n");
        check = 2;
      } else {
        // Usuario foi consultado no FireAut e não passou na validacao,
        // então check = 3
        print("USUÁRIO: " + username.text + " NÃO LOGADO\n");
        check = 3;
      }
    } else {
      // Usuario não existe no FireAut, então check = 4
      print("\nUSUÁRIO INEXISTENTE\n");
      check = 4;
    }
    return check;
  }
}
