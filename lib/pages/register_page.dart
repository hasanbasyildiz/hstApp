import 'package:apphst/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    late String mail, password;
    final formKey = GlobalKey<FormState>();
    final firebaseAuth = FirebaseAuth.instance;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("kayıt Ol"),
      ),
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
                  Icon(Icons.accessibility_new_outlined, size: 100),
                  Text(textAlign: TextAlign.center ,
                    "Kayıt Olmak İçin istenilen Verileri Doldurun",
                    style: TextStyle(color: Colors.grey[700], fontSize: 25 ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
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
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                      child: ElevatedButton(
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: ()async {
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            try {
                              var userResult=await firebaseAuth.createUserWithEmailAndPassword(
                                  email: mail, password: password);
                              formKey.currentState!.reset();//from elemanları resetleme
                             // print("111111111111111");
                              print(userResult.user!.uid);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("kayıt tamamlandı ana sayfadan giriş yapabilirsiniz"))
                              );
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                                    (Route<dynamic> route) => false,
                              );

                            }  catch (e) {
                             // print("222222 catch");"
                              print(e.toString());
                            }
                          }else{

                          }
                        }, // giriş yap işlemleri burdan başlıyor
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange),
                      ),
                    ),
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

/*
class TextFiledH extends StatelessWidget {
  late String HintText;
  late bool obscureText;

  TextFiledH(this.HintText, this.obscureText);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: HintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
      ),
    );
  }
}
*/








