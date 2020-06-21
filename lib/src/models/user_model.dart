class UserModel {
  const UserModel({
    this.id,
    this.name,
    this.cellphone,
    this.lastname,
    this.email,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return json != null
    ? UserModel(
      id: int.parse(json['id'].toString()),
      name: json['name'],
      lastname: json['lastname'],
      email: json['email'],
      cellphone: json['cellphone'],
      avatar: json['avatar'],
    )
    : null;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id.toString(),
    'name': name,
    'lastname': lastname,
    'email': email,
    'cellphone': cellphone,
    'avatar': avatar,
  };

  final int id;
  final String name;
  final String lastname;
  final String email;
  final String cellphone;
  final String avatar;
}