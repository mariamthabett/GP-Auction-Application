class UserModel {
  //id
  String? id;
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? confirmPassword;

  UserModel(
      {this.name,this.phoneNumber, this.email, this.password, this.confirmPassword, this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
