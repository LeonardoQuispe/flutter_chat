class Contacto {
  int codigo;
  String nombres;
  String apellidos;
  int telefono;



  factory Contacto(Map jsonMap) {
    return new Contacto.deserialize(jsonMap);
  }


  Contacto.deserialize(Map json) : 
    codigo = json["codigo"].toInt(),
    nombres = json["nombres"].toString(),
    apellidos = json["apellidos"].toString(),
    telefono = json["telefono"].toInt();

}