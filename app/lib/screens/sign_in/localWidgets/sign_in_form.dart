import 'package:flutter/material.dart';
import 'package:app/config.dart';
import 'package:app/screens/sign_in/localWidgets/sign_in_buttons.dart';
import 'package:app/widgets/rounded_text_formfield.dart';

class SignInForm extends StatefulWidget {
  SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Form(
        key: _formKey,
        child: Stack(children: [
          Column(
            children: [
              buildTextFormFields(),
              SignInButtons(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController),
            ],
          ),
        ]),
      ),
    );
  }

  Widget buildTextFormFields() {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 200,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hoverColor: Colors.purpleAccent[200],
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.black38,
                      width: 2.0,
                    ),
                  ),
                  icon: Icon(Icons.email,
                      size: IconTheme.of(context).size, color: Colors.black38),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus
                          ? Colors.black38
                          : Colors.black38),
                  counterText: '',
                  hintText: "test@gmail.com",
                  hintStyle: TextStyle(color: Colors.black12),
                  fillColor: Colors.white70),
              keyboardType: TextInputType.emailAddress,
              maxLength: 70,
              controller: _emailController,
              validator: (value) {
                bool _isEmailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!);
                if (!_isEmailValid) {
                  return 'Invalid email.';
                }
                return null;
              },
            ),
            SizedBox(height: Config.screenHeight! * 0.01),
            TextFormField(
              // | for text  to write any thing
              cursorColor: Colors.white70,
              focusNode: myFocusNode,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.black38,
                    width: 2.0,
                  ),
                ),
                icon: Icon(Icons.password,
                    size: IconTheme.of(context).size, color: Colors.black38),
                labelText: 'Password',
                labelStyle: TextStyle(
                    color:
                        myFocusNode.hasFocus ? Colors.black38 : Colors.black38),
                hintText: "********",
                hintStyle: TextStyle(color: Colors.black12),
                counterText: '',
              ),
              obscureText: true,
              controller: _passwordController,
              validator: (value) {
                if (value.toString().length < 6) {
                  return 'Password should be longer or equal to 6 characters.';
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }
}
