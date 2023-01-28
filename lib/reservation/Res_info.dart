


class Res_info {

  String day;
  String hour;
  String user;
  String email;
  String name;
  String password;



  Res_info(this.day,this.hour,this.user,this.email,this.name,this.password);


  Map<String, dynamic> toFirestore() {
    return {
      "day": day,
      "hour": hour,
      "user": user,
      "email": email,
      "name": name,
      "password": password,

    };
  }


}