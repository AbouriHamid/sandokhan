


class User_info {

  String email;
  String password;
  String name;
  String profilUrl;



  User_info(this.email,this.name,this.password,this.profilUrl);


  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "profilUrl": profilUrl

    };
  }


}


