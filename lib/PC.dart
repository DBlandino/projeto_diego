class PC {
  //Atributos
  String _id;
  String _marca;
  String _modelo;

  //Construtor
  PC(this._id, this._marca, this._modelo);

  //Getters
  String get id => _id;
  String get marca => _marca;
  String get modelo => _modelo;

  PC.map(dynamic obj) {
    this._id = obj['id'];
    this._marca = obj['marca'];
    this._modelo = obj['modelo'];
  }

  // get modelo => null;

  //Converter os dados para um Mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map["id"] = _id;
    }
    map["marca"] = _marca;
    map["modelo"] = _modelo;
    return map;
  }

  //Converter um Mapa para o modelo de dados
  PC.fromMap(Map<String, dynamic> map, String id) {
    //Atribuir id ao this._id, somente se id não for
    //nulo, caso contrário atribui '' (vazio).
    this._id = id ?? '';
    this._marca = map["marca"];
    this._modelo = map["modelo"];
  }
}
