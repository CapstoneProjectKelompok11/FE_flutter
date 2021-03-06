import 'package:app_booking_office/screen/auth/login_screen.dart';
import 'package:app_booking_office/screen/auth/model/auth_model.dart';

import 'package:app_booking_office/screen/auth/view_model/auth_view_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late AuthViewModel authProvider;
  final formKey = GlobalKey<FormState>();
  bool _isVisible = true;

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buttonBack(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'Getting started',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                      child: Text('Create account to continue',
                          style: TextStyle(fontSize: 12))),
                  const SizedBox(
                    height: 20,
                  ),
                  buttonGoogleSignIn(),
                  const SizedBox(
                    height: 15,
                  ),
                  //ini adalah form untuk pengisian firstName
                  textFormFieldFirstName(),
                  const SizedBox(
                    height: 10,
                  ),
                  //ini adalah form untuk pengisian lastName
                  textFormFieldLastName(),
                  const SizedBox(
                    height: 10,
                  ),
                  //ini adalah form untuk pengisian phone
                  textFormFieldPhone(),
                  const SizedBox(
                    height: 10,
                  ),
                  //ini adalah form pengisian untuk email
                  textFormFieldEmail(),
                  const SizedBox(
                    height: 10,
                  ),
                  //ini adalah form untuk pengisian password
                  textFormFieldPassword(),
                  const SizedBox(
                    height: 25,
                  ),
                  //ini adalah tombol untuk menekan register
                  elevatedButtonRegister(),
                  const SizedBox(
                    height: 10,
                  ),
                  textButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textFormFieldFirstName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Firstname',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: firstNameController,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8))),
          validator: (firstName) {
            if (firstName != null && firstName.isEmpty) {
              return "This field cannot be empty";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  Widget textFormFieldLastName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lastname',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: lastNameNameController,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8))),
          validator: (lastName) {
            if (lastName != null && lastName.isEmpty) {
              return "This field cannot be empty";
            } else {
              return null;
            }
          },
        )
      ],
    );
  }

  Widget textFormFieldPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: phoneController,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8))),
          validator: (phone) {
            if (phone != null && phone.isEmpty) {
              return "This field cannot be empty";
            } else {
              return null;
            }
          },
        )
      ],
    );
  }

  Widget textFormFieldEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8))),
          validator: (email) {
            if (email != null && !EmailValidator.validate(email)) {
              return "Enter valid email!";
            }
            if (email != null && email.isEmpty) {
              return "This field cannot be empty";
            } else {
              return null;
            }
          },
        )
      ],
    );
  }

  Widget textFormFieldPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
            controller: passwordController,
            obscureText: _isVisible,
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    child: _isVisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8))),
            validator: (password) {
              if (password != null && password.length < 8) {
                return "Enter at least 8 characters";
              }
              if (password != null && password.isEmpty) {
                return "This field cannot be empty";
              } else {
                return null;
              }
            })
      ],
    );
  }

  Widget elevatedButtonRegister() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(77, 137, 255, 18.5),
            Colors.blueAccent,
            Color(0xFF4D89FF)
          ])),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              primary: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: () {
            if (!formKey.currentState!.validate()) return;
            formKey.currentState!.save();
            //ini untuk menjalankan fungsi register dan mengirimkan data kepada model yang telah dibuat pada folder model
            authProvider.register(
                Auth(
                    firstName: firstNameController.text,
                    lastName: lastNameNameController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                    password: passwordController.text),
                context);
          },
          child: const Text('Sign up')),
    );
  }

  Widget textButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Have an account?'),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()));
            },
            child: const Text('Sign in'))
      ],
    );
  }

  Widget buttonBack() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      },
      child: const Icon(
        CupertinoIcons.arrow_left,
        size: 30,
      ),
    );
  }

  Widget buttonGoogleSignIn() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Colors.black, width: 2)),
          color: Colors.white),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              primary: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset('assets/image/icon_google.png')),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Google',
                style: TextStyle(color: Colors.black),
              )
            ],
          )),
    );
  }
}
