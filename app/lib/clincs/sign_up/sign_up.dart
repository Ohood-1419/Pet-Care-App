import 'package:flutter/material.dart';
import 'package:app/widgets/hero_title.dart';
import 'package:app/widgets/rounded_text_formfield.dart';

import '../../config.dart';
import 'localWidgets/sign_up_buttons.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TimeOfDay selectedStartTime = TimeOfDay.now();
  _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedStartTime,
    );
    if (picked != null && picked != selectedStartTime) {
      setState(() {
        selectedStartTime = picked;

        _timeController.text = selectedStartTime.format(context);
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _loctionController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        color: kBackgroundColor,
        child: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Config.screenWidth! * 0.04),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  HeroTitle(
                    title: 'Sign Up',
                    subtitle: 'Create an account...',
                  ),
                  buildTextFormFields(),
                  SignUpButtons(
                    formKey: _formKey,
                    nameController: _nameController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    loctionController: _loctionController,
                    timeController: _timeController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildTextFormFields() {
    return Expanded(
      flex: 8,
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: SizedBox(height: Config.screenHeight! * 0.08),
          ),
          RoundedTextFormField(
            controller: _nameController,
            hintText: ' Clinc Name',
            validator: (value) {
              if (value.toString().length <= 2) {
                return 'Enter valid name.';
              }
              return null;
            },
          ),
          SizedBox(height: Config.screenHeight! * 0.02),
          RoundedTextFormField(
            controller: _emailController,
            hintText: 'Email',
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
          SizedBox(height: Config.screenHeight! * 0.02),
          RoundedTextFormField(
            controller: _passwordController,
            obsecureText: true,
            hintText: 'Password',
            validator: (value) {
              if (value.toString().length < 6) {
                return 'Password should be longer or equal to 6 characters.';
              }
              return null;
            },
          ),
          SizedBox(height: Config.screenHeight! * 0.02),
          RoundedTextFormField(
            controller: _loctionController,
            hintText: 'Location',
            validator: (value) {
              if (value.toString().length <= 5) {
                return 'Enter valid name.';
              }
              return null;
            },
          ),
          SizedBox(height: Config.screenHeight! * 0.02),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: TextField(
              cursorColor: Colors.black,
              // controller: saveData,
              textCapitalization: TextCapitalization.characters,
              onTap: () => _selectStartTime(context),
              readOnly: true,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
              decoration: new InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                contentPadding: EdgeInsets.only(
                  left: 16,
                  bottom: 16,
                  top: 16,
                  right: 16,
                ),
                hintText: ' Working Time  ',
                hintStyle: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
