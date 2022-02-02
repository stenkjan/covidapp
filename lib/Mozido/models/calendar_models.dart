class CalendarModel {
  final String? id;
  final String? email;

  //

  CalendarModel(this.id, this.email);
  // CalendarModel({required this.id, required this.fullName, required this.email, required this.CalendarModelRole});
  CalendarModel.fromMap(Map data)
      : id = data['id'],
        //fullName = data['fullName'],
        email = data['email'];
  // CalendarModelRole = data['CalendarModelRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      //'fullName': fullName,
      'email': email,
      // 'CalendarModelRole': CalendarModelRole,
    };
  }
}

class Zustand {}
