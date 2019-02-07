import 'package:flutter/material.dart';
import 'package:flutter_chat/common/HttpHandler.dart';
import 'package:flutter_chat/models/contacto_model.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';



class Camera extends StatefulWidget {  
  @override
  _CameraState createState() => new _CameraState();
 }




class _CameraState extends State<Camera> {

  List<Contacto> _contactos = new List<Contacto>();
  bool banderaCargando = true;




  @override
  void initState() {
    super.initState();

    loadContactos();


  }


  void loadContactos() async{
    List<Contacto> contactos= await HttpHandler().fetchContactos();

    setState(() {
      if (contactos.length > 0) {
        _contactos.addAll(contactos);
        banderaCargando = false;
      }
      
    });

  }

  Future<void> refrescarContactos() async{
    var contactos= await HttpHandler().fetchContactos();

    setState(() {
      _contactos.clear();
      _contactos.addAll(contactos);

      Scaffold.of(context).showSnackBar(
          new SnackBar(
            content: Text('Contactos Actualizados'),   
            duration: Duration(seconds: 1, milliseconds: 800),
          )
      );

    });
  }

  void eliminarContacto(int codigo) async{
    bool bandera = await HttpHandler().eliminarContacto(codigo);
    _contactos.removeWhere((contacto) => contacto.codigo == codigo);

    setState(() {

      if (bandera) {
        Scaffold.of(context).showSnackBar(
          new SnackBar(
            content: Text('Contacto Eliminado'),   
            duration: Duration(seconds: 1, milliseconds: 800),
          )
        );
      } else {
        Scaffold.of(context).showSnackBar(
          new SnackBar(
            content: Text('No se pudo Eliminar el Contacto, intente mas tarde'),   
            duration: Duration(seconds: 2),
          )
        );
      }
      


    });
  }







  Widget dibujarContactos() {
    return new Container(
     child: new LiquidPullToRefresh(
        springAnimationDurationInMilliseconds: 350,
        showChildOpacityTransition: true,
        height: 80,
        color: Theme.of(context).primaryColor,
        onRefresh: refrescarContactos,
        child:  new ListView.builder(
          itemCount: _contactos.length,
          itemBuilder: (BuildContext context, int index) {

            return Dismissible(
              key: Key(_contactos[index].codigo.toString()),
              onDismissed: (direccion) {

                eliminarContacto(_contactos[index].codigo);
                // Scaffold.of(context).showSnackBar(
                //   new SnackBar(
                //     content: Text('Contacto Eliminado'),   
                //     duration: Duration(seconds: 1, milliseconds: 800),
                //   )
                // );
              },
              background: Container(
                padding: EdgeInsets.only(left: 20),
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text("Eliminar", style: new TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold,),),
                    new Icon(Icons.delete,size: 30,color: Colors.white),
                  ],
                )
              ),
              secondaryBackground: Container(
                padding: EdgeInsets.only(right: 20),
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Text("Eliminar", style: new TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold,),),
                    new Icon(Icons.delete,size: 30,color: Colors.white),
                  ],
                )
              ),
              child: new Column(
                children: <Widget>[         
                  new Divider(
                    height: 10.0,
                  ),
                  new ListTile(
                    leading: new CircleAvatar(
                      child: new Text(_contactos[index].nombres[0]),                
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      new Text(
                        _contactos[index].nombres,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        _contactos[index].telefono.toString(),
                        style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                      )
                    ], 
                  ),
                  subtitle: new Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: new Text(
                      _contactos[index].apellidos,
                      style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                  ),
                  // onTap: (){
                  //   var route = new MaterialPageRoute(
                  //     builder: (BuildContext context) => new ChatScreen(name: _contactos[index].name,)
                  //   );
                  //   Navigator.of(context).push(route);
                  // },
                ),   

                ],
              ),
              

            );



          },
        ),
     ),
   );
  }




  @override
  Widget build(BuildContext context) {
    return banderaCargando == true 
    ? Container(
      padding: EdgeInsets.only(bottom: 455),
      child: LinearProgressIndicator(backgroundColor: Colors.white,) ,
      ) 
    
    : dibujarContactos();
  }
}

