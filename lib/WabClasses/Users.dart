import 'package:http/http.dart' as http;
class Users{
  String nom;
  String prenom;
  String email;
  String telephone;
  String mot_de_passe;
  String? adresse = "";

   Users({
     required this.nom,
     required this.prenom,
     required this.telephone,
     required this.email,
     required this.mot_de_passe,
     this.adresse
   }){
     print("\n"+this.nom+"\n"+this.prenom+"\n"+this.telephone+"\n"+this.email+"\n"+this.mot_de_passe);
   }

   Future<bool> addUser() async{
      final requete =  await http.post(Uri.parse("http://localhost/Wab/php/client/insert.php"),body: {
        "nom" : this.nom,
        "prenom" : this.prenom,
        "email" : this.email,
        "tel" : this.telephone,
        "mdp" : this.mot_de_passe,
        "adresse" : this.adresse
      });
      if(requete.statusCode == 200){
        return true;
      }
      else return false;
   }
}