import 'package:belajarlogin/Components/TextForm.dart';
import 'package:belajarlogin/Components/sliverRemain.dart';
import 'package:belajarlogin/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:belajarlogin/Screen/registration_page.dart';

final GlobalKey<FormState> _form = GlobalKey<FormState>();
final TextEditingController _email = TextEditingController();
final TextEditingController _pass = TextEditingController();

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 50, color: Colors.amberAccent),
                  ),
                  Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email'),
                        TextFormCustom(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          label: 'email',
                          obsecureText: false,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Password'),
                        TextFormCustom(
                            controller: _pass,
                            label: 'Password',
                            obsecureText: true,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'empty';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            child: Text('LOGIN'),
                            color: Colors.blue,
                            onPressed: () {
                              if (_form.currentState.validate()) {
                                AuthServices.signIn(_email.text, _pass.text);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 2,
                        color: Colors.black,
                      ),
                      Text('   OR   '),
                      Container(
                        width: 50,
                        height: 2,
                        color: Colors.black,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    child: Text('Login with Google'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onPressed: () {
                      print('Login with Google');
                    },
                  ),
                  RaisedButton(
                    child: Text('Login with Facebook'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onPressed: () {
                      print('Login with Facebook');
                    },
                  )
                ]),
              ),
              SliverRemain(
                label: 'Don\'t have account yet?',
                touchableText: 'Register here',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
