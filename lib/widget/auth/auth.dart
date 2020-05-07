import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _islogin = true;
  String _userEmail='';
  String _userName='';
  String _userPassword='';
  void _submit(){
    final _isvalid= _formkey.currentState.validate();
    FocusScope.of(context).unfocus();
    if(_isvalid){
      _formkey.currentState.save();
      print(_userPassword);
      print(_userName);
      print(_userEmail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child:Form(
                key: _formkey,
                child:Column(mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    validator: (value){
                      if(value.isEmpty || !value.contains('@')){
                        return 'Please Enter Valid email Address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                    ),
                    onSaved: (value){
                      _userEmail=value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'User Name',
                    ),
                    onSaved: (value){
                      _userName=value;
                    },
                  ),
                  TextFormField(
                    validator: (value){
                      if(value.length<7 || value.isEmpty){
                        return 'Password length should be greater than 7';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password'  
                    ),
                    onSaved: (value){
                      _userPassword=value;
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 12),
                  RaisedButton(child: Text(_islogin ? 'Login':'SignUp'),onPressed:_submit,),
                  FlatButton(child: Text(_islogin ? 'Create New Acc':'I already have account'),onPressed: (){setState(() {
                    _islogin=!_islogin;
                  });},),

                ],)
              )
              ),
            ),
        ),);
  }
}