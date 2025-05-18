import 'package:flutter/material.dart';
import 'package:boutique/services/auth_api_service.dart';


class LoginSreen extends StatefulWidget {
  const LoginSreen({super.key});

  @override
  State<LoginSreen> createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {

  final _formKey = GlobalKey<FormState>();
  final Map<String, String?> _type = {"email": null, "password": null};

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 20,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                icon: Icon(Icons.mail),
              ),
              validator: (String? value){
                return value!.isEmpty ? "Email is incorrect" : null;
              },
              onChanged:(value){
                _type["email"] = value;
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                icon: Icon(Icons.password),
              ),
              validator: (String? value){
                return value!.isEmpty ? "Password is incorrect" : null;
              },
              onChanged:(value){
                _type["password"] = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()){
                  _formKey.currentState!.save();

                  dynamic auth = AuthApiService().getAuth(_type).onError((
                    error, 
                    stackTrace,
                  ) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Credentials error")),
                    );
                    return {};
                    }
                  );
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
