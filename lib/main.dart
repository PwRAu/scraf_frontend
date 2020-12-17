import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF90A4AE),
      ),
      home: Login(),
    );
  }
}

class User{
  String name;
  String surname;
  String email;
  String password;
}

class RegUser{
  String rePassword;
}

class Login extends StatefulWidget{
  Login({Key key, title}): super(key:key);
  final String title = "SCRAF";
  final String presentazione= "";
  
  String username="francolino";
  String password="triplosette";
  
  
  @override
  State<StatefulWidget> createState()=> _Login(); 
  }
  
  //singIn(String email, String password) async{
   // Map data ={
      //'email':email,
      //'password':password,
    //};
   // var response = await http.post

 // }

class _Login extends State<Login>{

  var _controllerUser = TextEditingController();
  var _controllerPass = TextEditingController();
 // bool _isLoading = false;
  
  final RegUser user = RegUser();

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF26A69A),
        body: Row(
        children:<Widget>[
          Expanded( 
            child:Container(
            color: Color(0xFFB0BEC5),
            height: MediaQuery.of(context).size.height,
            width: 500,
            child: Container(
              margin: EdgeInsets.only(top: 425),
              child: Text("SCRAF",style: TextStyle(fontSize:80,), textAlign: TextAlign.center,)
              ),
            ), 
          ),
          Expanded(
            child:Container(
            color: Color(0xFFB0BEC5),
            height: MediaQuery.of(context).size.height,
            width: 500,
            child: Container(
              margin: EdgeInsets.only(top: 285),
              child: Column(
                children: <Widget> [
                  Row(
                    children:<Widget> [
                      Text("Benvenuto su SCRAF !", style: TextStyle(fontSize: 42), textAlign: TextAlign.right,),
                    ],
                  ),
                  Row(
                    children:<Widget> [
                      Text("Controlla il tuo andamento scolastico",style: TextStyle(fontSize: 32), textAlign: TextAlign.left,),
                    ],
                  ),
                  Row(
                    children:<Widget> [
                      Text("oppure quello dei tuoi alunni!",style: TextStyle(fontSize: 32), textAlign: TextAlign.left,)
                    ],
                  ),
                  Row(
                    children:<Widget> [
                      Container(
                        width: 200,
                        margin: EdgeInsets.fromLTRB(125,100,0,0),
                        child: Text("Username/Email",style: TextStyle(fontSize: 26),)
                      ),
                    ],
                  ),
                  Row(
                    children:<Widget> [
                      Flexible(
                        child:Container(
                          margin: EdgeInsets.only(left: 87),
                          width: 235,
                          //color: Color(0xFF90A4AE),
                          child: TextFormField(
                            controller: _controllerUser,
                            cursorColor: Colors.black,
                            scrollPadding: EdgeInsets.only(top: 200),
                            cursorWidth: 1,
                            decoration: InputDecoration(
                            labelText: "username/email",
                            suffixIcon: IconButton(
                            onPressed: () => _controllerUser.clear(),
                            icon: Icon(Icons.clear),
                            ),
                            icon: Icon(Icons.account_circle_outlined)
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children:<Widget> [
                      Container(
                        width: 200,
                        margin: EdgeInsets.fromLTRB(125,30,0,0),
                        child: Text("Password",style: TextStyle(fontSize: 26),)
                      ),
                    ],
                  ),
                  Row(
                    children:<Widget> [
                      Center(
                      child: Flexible(
                        child:Container(
                          width: 235,
                          margin: EdgeInsets.only(left: 87),
                          child: TextFormField(
                            controller: _controllerPass,
                            cursorColor: Colors.black,
                            obscureText: true,
                            scrollPadding: EdgeInsets.only(top: 200),
                            cursorWidth: 1,
                            decoration: InputDecoration(
                            labelText: "password",
                            suffixIcon: IconButton(
                            onPressed: () => _controllerPass.clear(),
                            icon: Icon(Icons.clear),
                            ),
                            icon: Icon(Icons.security_outlined)
                          ),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                  Row(
                    children:<Widget>[
                      Container(
                        width: 200,
                        margin: EdgeInsets.fromLTRB(125,50,0,0),
                        child: RaisedButton(
                          color: Color(0xFF90A4AE),
                          onPressed: () { 
                            //_isLoading = true;
                            //singIn(_controllerUser.text, _controllerPass.text);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),)); //premi il bottone per cambiare pagina
                           },
                          textColor: Colors.black,
                          child: Text("Accedi"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ),
            ), 
          ),  
        ],
      ), 
    );  
   }
  }


class HomePage extends StatefulWidget{
  HomePage({Key key, title}): super(key:key);
  @override
  State<StatefulWidget> createState() => _HomePage();
  
  
}


class _HomePage extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDDFFF),
      body: Container(
        margin: EdgeInsets.fromLTRB(600,425,0,0),
        child: Text("BENVENUTO", style: TextStyle(fontSize: 120),),
      ),

    );
  }
  
}