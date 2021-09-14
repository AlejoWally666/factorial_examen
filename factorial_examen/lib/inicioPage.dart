import 'package:flutter/material.dart';

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  int numero=0;
  String resultado="";
  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/img/fondoNumeros.jpg"),
            fit: BoxFit.cover
        ),
      ),
      child: Row(children: [
        Expanded(child:Container()),
        SizedBox(width: 500,child: Scaffold(
            appBar: AppBar(
              title: Text("FACTORIAL"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(child: Column(children: [
              SizedBox(height: 20,),
              Row(children: [
                SizedBox(width: 20,),
                Text("Ingrese un número para calcular el factorial: ", style: TextStyle(fontWeight: FontWeight.bold),),
                Expanded(child: Container())],),
              SizedBox(height: 20,),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: TextField(
                  onChanged: (value){
                    numero=int.tryParse(value) ?? 0;
                    if(numero==0){
                      setState(() {
                        resultado="Error porfavor Ingrese un número válido";
                      });
                    }else{
                      setState(() {
                        resultado="";
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Número",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: (){
                  _factorial(numero);
                },
                child: Text("Calcular"),
              ),
              SizedBox(height: 20,),
              Divider(),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(width: 20,),
                    Text(resultado,textAlign: TextAlign.start,),
                  ],)
              )
            ],),)
        ),),
        Expanded(child:Container()),
      ],),
    );
  }
  void _factorial(int numero){
    if(numero==0){
      setState(() {
        resultado="RESULTADO\n\n"
            "ERROR verifique el número ingresado";
      });
      return;
    }
    int factorial=1;
    String desglose="${numero}! = ";
    for(int i=1;i<=numero;i++){
      if(i!=1){
        desglose+=" * ";
      }
      desglose+="$i";
      factorial*=i;
    }
    setState(() {
      resultado="RESULTADO\n\n"
          "$desglose"
          "\n\n$factorial";
    });
  }
}
