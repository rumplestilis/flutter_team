import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wab_signin_signup/WabClasses/Users.dart';
import 'package:wab_signin_signup/custom.dart';
import 'package:wab_signin_signup/signIn.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String passwordController = "";
  bool passwordIsvisible = false;
  bool _agreeTermsValue = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(() => setState(() {}));
    emailController.addListener(() => setState(() {}));
    phoneController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: "", context: context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Creer un Compte",
                style: TextStyle(
                    fontFamily: "Cacadia Code",
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(47, 108, 147, 1)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.5),
                      )
                    ]),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Nom",
                    labelText: "Nom",
                    prefixIcon: const Icon(Icons.title),
                    border: InputBorder.none,
                    suffixIcon: nameController.text.isEmpty
                        ? Container(width: 0)
                        : IconButton(
                            icon: const Icon(
                              Icons.close,
                            ),
                            onPressed: () => nameController.clear(),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.5),
                      )
                    ]),
                child: TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    hintText: "Prenom",
                    labelText: "Prenom",
                    prefixIcon: const Icon(Icons.title),
                    border: InputBorder.none,
                    suffixIcon: firstNameController.text.isEmpty
                        ? Container(width: 0)
                        : IconButton(
                            icon: const Icon(
                              Icons.close,
                            ),
                            onPressed: () => firstNameController.clear(),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.5),
                      )
                    ]),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.mail),
                    border: InputBorder.none,
                    suffixIcon: emailController.text.isEmpty
                        ? Container(width: 0)
                        : IconButton(
                            icon: const Icon(
                              Icons.close,
                            ),
                            onPressed: () => emailController.clear(),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.5),
                      )
                    ]),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: "Téléphone",
                    prefixIcon: const Icon(Icons.phone),
                    suffixIcon: phoneController.text.isEmpty
                        ? Container(width: 0)
                        : IconButton(
                            icon: const Icon(
                              Icons.close,
                            ),
                            onPressed: () => phoneController.clear(),
                          ),
                    prefixText: '+235: ',
                    border: InputBorder.none,
                    hintText: "Téléphone :",
                    hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.7),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.5),
                      )
                    ]),
                child: TextField(
                  onChanged: (value) =>
                      setState(() => this.passwordController = value),
                  onSubmitted: (value) =>
                      setState(() => this.passwordController = value),
                  obscureText: passwordIsvisible,
                  decoration: InputDecoration(
                    hintText: "Mot de passe",
                    labelText: "Mot de passe",
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                        //Methode for Hide and show password
                        icon: passwordIsvisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: () => setState(
                              () => passwordIsvisible = !passwordIsvisible,
                            )),
                    hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Users users = Users(
                      nom: nameController.text,
                      prenom: firstNameController.text,
                      telephone: phoneController.text,
                      email: emailController.text,
                      mot_de_passe: passwordController,adresse: "kara");
                      users.addUser();
                },
                icon: const Icon(Icons.arrow_right_alt_rounded),
                label: const Text("Create account"),
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(47, 108, 147, 1),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
