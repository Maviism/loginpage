import 'package:belajarlogin/Components/TextForm.dart';
import 'package:belajarlogin/Components/sliverRemain.dart';
import 'package:flutter/material.dart';
import 'package:belajarlogin/auth_services.dart';

final GlobalKey<FormState> _form = GlobalKey<FormState>();
final TextEditingController _email = TextEditingController();
final TextEditingController _pass = TextEditingController();
final TextEditingController _confirmPass = TextEditingController();

class RegistrationPage extends StatelessWidget {
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
                    'Register',
                    style: TextStyle(fontSize: 50, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email'),
                        SizedBox(height: 5),
                        TextFormCustom(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          label: 'email',
                          obsecureText: false,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Password'),
                        SizedBox(height: 5),
                        TextFormCustom(
                          label: 'enter password',
                          keyboardType: TextInputType.visiblePassword,
                          obsecureText: true,
                          controller: _pass,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'enter text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        Text('Confirm password'),
                        SizedBox(height: 5),
                        TextFormCustom(
                          controller: _confirmPass,
                          keyboardType: TextInputType.visiblePassword,
                          label: 'Re-type password',
                          obsecureText: true,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Empty';
                            }
                            if (val != _pass.text) {
                              return 'not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  RaisedButton(
                    child: Text('Register'),
                    onPressed: () {
                      print(_pass.text);
                      if (_form.currentState.validate()) {
                        AuthServices.signUp(_email.text, _pass.text);
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            actions: [
                              TextButton(
                                child: Text('ok'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                            title: Text('Information'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [Text('Berhasil SignUp')],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  )
                ]),
              ),
              SliverRemain(
                label: 'Already have account?',
                touchableText: 'Login here',
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // SliverFillRemaining(
              //   hasScrollBody: false,
              //   child: Container(
              //     alignment: Alignment.bottomCenter,
              //     margin: EdgeInsets.only(bottom: 15),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text('Already have account?'),
              //         GestureDetector(
              //           child: Text(
              //             'Login here',
              //             style: TextStyle(color: Colors.blue),
              //           ),
              //           onTap: () {
              //             Navigator.pop(context);
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
