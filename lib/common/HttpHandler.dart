import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_chat/models/contacto_model.dart';

class HttpHandler{

    final String _baseURL = "192.168.204.1:45455";

    Future<dynamic> getJson(Uri uri) async{
      http.Response response = await http.get(uri);
      return json.decode(response.body);
    }

    Future<List<Contacto>> fetchContactos() {
      var uri = new Uri.http(_baseURL, "api/Contactos/traerContactos");

      return getJson(uri).then(((respuesta) => 
        respuesta['tablas'].map<Contacto>((item) => new Contacto(item)).toList()
      ));
    }


    Future<bool> eliminarContacto(int codigo) async{
      var uri = new Uri.http(_baseURL, "api/Contactos/eliminarContacto", {
        'codigo' : codigo.toString(),
      });

      http.Response response = await http.delete(uri);
      
      return json.decode(response.body)["respuesta"];
    }

}