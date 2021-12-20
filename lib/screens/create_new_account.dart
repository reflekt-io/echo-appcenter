// ignore_for_file: constant_identifier_names

import 'package:echo/common/background_image.dart';
import 'package:echo/screens/login_screen.dart';
import 'package:flutter/material.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/register';

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          const BackgroundImage(image: 'assets/login_register_bg.jpg'),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Stack(
                    children: const [
                      Center(
                        child: Text('Register Account',
                        style: TextStyle(fontSize: 60, color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "contoh: Dummy Bot",
                            labelText: "Nama Lengkap",
                            labelStyle: const TextStyle(color: Colors.white),
                            icon: const Icon(Icons.people),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            ),  
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nama tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "contoh: Dummy@gmail.com",
                            labelText: "Email",
                            labelStyle: const TextStyle(color: Colors.white),
                            icon: const Icon(Icons.attach_email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            ),  
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Masukkan Password",
                            labelText: "Password",
                            labelStyle: const TextStyle(color: Colors.white),
                            icon: const Icon(Icons.lock_outline,),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            ),  
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Konfirmasi Password",
                            labelText: "Konfirmasi Password",
                            labelStyle: const TextStyle(color: Colors.white),
                            icon: const Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),  
                            ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFF24262A),
                        ),
                        child: TextButton(
                          onPressed: () {if (_formKey.currentState!.validate()) {}},
                          child: const Text(
                            'Submit',
                            style: TextStyle(fontSize: 22, color: Colors.white, height: 1.5, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, LoginScreen.ROUTE_NAME);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 22, color: Colors.white, height: 1.5, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
