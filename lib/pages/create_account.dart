import 'package:flutter/material.dart';
import 'package:kingsly_app/components/app_text_field.dart';
import 'package:kingsly_app/components/auth_button.dart';
import 'package:kingsly_app/regex_and_icon_font.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {

  TextEditingController _emailController,_passwordController,_confirmPasswordController,
      _usernameController,_mobileNumberController;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext context;

  @override
  void initState() {
    super.initState();
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
    _confirmPasswordController = new TextEditingController();
    _usernameController = new TextEditingController();
    _mobileNumberController = new TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _mobileNumberController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Create Account'),
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
                    controller: _usernameController,
                    hintText: 'Username',
                    icon: Icons.person_outline,
                    isPassword: false,
                    validator: (String val){
                      print(val);
                      if(val.isEmpty) return "field can not be empty";
                      if(!isValidFullName(val)) return  "Enter a valid";
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  AppTextField(
                    controller: _mobileNumberController,
                    hintText: 'Mobile Number',
                    icon: Icons.phone_iphone,
                    isPassword: false,
                    validator: (String val){
                      print(val);
                      if(val.isEmpty) return "field can not be empty";
                      if(val.length < 8) return "enter a valid phone number";
                    },
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  AppTextField(
                    textInputType: TextInputType.emailAddress,
                    controller: _emailController,
                    hintText: 'Email Address',
                    icon: Icons.mail_outline,
                    isPassword: false,
                    validator: (String val){
                      print(val);
                      if(val.isEmpty) return "field can not be empty";
                      if(!isEmailValid(val)) return "enter valid email address";
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
                  AppTextField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    isPassword: true,
                    icon: Icons.lock_outline,
                    validator: (String val){
                      print(val);
                      if(val.isEmpty) return "field can not be empty";
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  AppAuthButton(
                    onPressed: (){
                      validateForm();

                    },
                    btnText: 'CREATE ACCOUNT',
                    btnTextColor: Colors.blue,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }

  void validateForm(){

  }
}

