import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
const AuthForm(this.submitFn, bool isLoading, {Key? key}) : super(key: key);
  final void Function(
    String email,
    String userName,
    String password,
    bool isLogin,
      BuildContext ctx,
  ) submitFn;
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';
  void _trySubmit() {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid!) {
      _formKey.currentState?.save();
      widget.submitFn(_userEmail.trim().toLowerCase(), _userName.trim().toLowerCase(), _userPassword.trim(), _isLogin, context,);

      //use those value to send to our auth request ....
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(2),
        child: SingleChildScrollView(
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      key: const ValueKey('email'),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please Enter a Valid Email Address';
                        }
                        {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          const InputDecoration(labelText: 'Email Address'),
                      onSaved: (value) {
                        _userEmail = value!;
                      },
                    ),
                    if (!_isLogin)
                      TextFormField(
                        key: const ValueKey('userName'),
                        onSaved: (value) {
                          _userName = value!;
                        },
                        decoration:
                            const InputDecoration(labelText: 'Username'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 5) {
                            return 'Please, Enter a Username with Min. 5 Characters';
                          }
                          {
                            return null;
                          }
                        },
                      ),
                    TextFormField(
                      key: const ValueKey('password'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 7) {
                          return 'Try & Enter Password with min least 7 Characters';
                        }
                        {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _userPassword = value!;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
                    SizedBox(
                        child: ElevatedButton(
                      // style:ButtonStyle: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20, )),
                      child: Text(_isLogin
                          ? 'Login Now'
                          : 'Sign Up Instead, I am New here'),
                      onPressed: _trySubmit,
                    )),
                    TextButton(
                      child: Text(_isLogin
                          ? 'Sign Up Now'
                          : 'Login Instead, I am a User here'),
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
