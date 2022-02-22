class User {
  final String? id;
  final String? email;
  //

  User(this.id, this.email);
  // User({required this.id, required this.fullName, required this.email, required this.userRole});
  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        //fullName = data['fullName'],
        email = data['email'];
  // userRole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      //'fullName': fullName,
      'email': email,
      // 'userRole': userRole,
    };
  }
  String? getid() {
    return id;
  }
}
