import 'package:flutter/material.dart';
import 'package:kingsly_app/components/app_text_field.dart';
import 'package:kingsly_app/components/auth_button.dart';
import 'package:kingsly_app/pages/create_account.dart';
import 'package:kingsly_app/regex_and_icon_font.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _passwordController  = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: false,
        elevation: 0.0,
      ),

      backgroundColor: Theme.of(context).primaryColor,

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AppTextField(
                  textInputType: TextInputType.emailAddress,
                  controller: _emailController,
                  hintText: 'Email Address',
                  icon: Icons.mail_outline,
                  isPassword: false,
                  validator: (String val){
                    print(val);
                    if(val.isEmpty) return "field can not be empty";
                    if(!isEmailValid(val)) return "email is not valid";
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                AppTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  isPassword: true,
                  icon: Icons.lock_outline,
                  validator: (String val){
                    print(val);
                    if(val.isEmpty) return "field can not be empty";
                    if(!isPasswordValid(val)) return "password must of this format\nPassword must be 8 characters long\nAt least one capital letter\nAt least one small letter\nAt least a number";
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                AppAuthButton(
                  onPressed: (){
                    validateForm();
                  },
                  btnText: 'LOGIN',
                  btnTextColor: Colors.blue,
                ),
                SizedBox(
                  height: 15.0,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CreateAccountPage()));
                  },
                  child: Text('New User ? Create An Account',style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }

  void validateForm(){

  }
}
