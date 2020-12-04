import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'SideMenu.dart';
import 'PC.dart';

class PCCadastro extends StatefulWidget {
  @override
  _PCCadastroState createState() => _PCCadastroState();
}

class _PCCadastroState extends State<PCCadastro> {
  //controles para os campos de texto
  TextEditingController txtMarca = TextEditingController();
  TextEditingController txtModelo = TextEditingController();

  //instância do Firebase
  var db = Firestore.instance;

  //retornar dados do documento a partir do idDocument
  void getDocumento(String idDocumento) async {
    //Recuperar o documento no Firestore
    DocumentSnapshot doc =
        await db.collection("pc").document(idDocumento).get();

    setState(() {
      txtMarca.text = doc.data["marca"];
      txtModelo.text = doc.data["modelo"];
    });
  }

  @override
  Widget build(BuildContext context) {
//
    // RECUPERAR o ID do Documento
    //
    final String idDocumento = ModalRoute.of(context).settings.arguments;

    if (idDocumento != null) {
      if (txtMarca.text == "" && txtModelo.text == "") {
        getDocumento(idDocumento);
      }
    }

    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text("Gamers Gear"),
        centerTitle: true,
        backgroundColor: Color(0xFF007FFF),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            //CAMPO MARCA
            TextField(
              controller: txtMarca,
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Marca",
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //CAMPO MODELO
            TextField(
              controller: txtModelo,
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Modelo",
              ),
            ),
            SizedBox(
              height: 30,
            ),

            //BOTÕES
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: RaisedButton(
                    color: Colors.blue[500],
                    child: Text("Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {
                      //
                      // Inserir ou Atualizar
                      //
                      if (idDocumento == null) 
                      {     
                          inserir(context,
                              PC(idDocumento, txtMarca.text, txtModelo.text));
                        } else {
                          atualizar(context,
                              PC(idDocumento, txtMarca.text, txtModelo.text));
                        }
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 120,
                  child: RaisedButton(
                    color: Colors.blue[500],
                    child: Text("Cancelar",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }

  //
  // ATUALIZAR
  //
  void atualizar(BuildContext context, PC pc) async {
    await db
        .collection("pc")
        .document(pc.id)
        .updateData({"marca": pc.marca, "modelo": pc.modelo});
    Navigator.pop(context);
  }

  //
  // INSERIR
  //
  void inserir(BuildContext context, PC pc) async {
    await db.collection("pc").add({
      "marca": pc.marca,
      "modelo": pc.modelo,
    });
    Navigator.pop(context);
  }
}
