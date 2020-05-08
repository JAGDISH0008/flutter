import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitAuthForm);
  final void Function( String userName ) submitAuthForm;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _islogin = true;
  String _userName='';
  void _submit(){
    final _isvalid= _formkey.currentState.validate();
    FocusScope.of(context).unfocus();
    if(_isvalid){
      _formkey.currentState.save();
      widget.submitAuthForm(_userName);
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
                    decoration: InputDecoration(
                      labelText: 'User Name',
                    ),
                    onSaved: (value){
                      _userName=value;
                    },
                  ),
                  
                  SizedBox(height: 12),
                  RaisedButton(child: Text('Login'),onPressed:_submit,),
                ],)
              )
              ),
            ),
        ),);
  }
}