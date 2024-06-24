import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:hstapp/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    late String mail, password;
    final formKey = GlobalKey<FormState>();
    final firebaseAuth=FirebaseAuth.instance;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Icon(Icons.lock, size: 100),
                  Text(
                    "Hoşgeldiniz",
                    style: TextStyle(color: Colors.grey[700], fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 30),
                    child: SizedBox(
                      child: TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: "mail",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "bilgileri eksiksiz doldurun";
                          } else {

                          }
                        },
                        onSaved: (value) {
                          mail = value!;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 30),
                    child: SizedBox(
                      child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "şifre",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),


                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "bilgileri eksiksiz doldurun";
                            } else {

                            }
                          },
                          onSaved: (value) {
                            password = value!;
                          },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    child: Text(
                      "Giriş Yap Firebase",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async{
                      if(formKey.currentState!.validate()){
                        try {
                          formKey.currentState!.save();
                          final userResult =await firebaseAuth.signInWithEmailAndPassword(email: mail, password: password);
                          print(userResult.user!.uid);
                          Navigator.pushReplacementNamed(context, "/homePage");
                        }  catch (e) {
                          print(e.toString());
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                        }

                      }else{

                      }
                    },
                    // giriş yap işlemleri burdan başlıyoru
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent),
                  ),

                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hesabiniz yok mu? "),
                      SizedBox(width: 1),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, "/singUp"),
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(color: Colors.orangeAccent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

