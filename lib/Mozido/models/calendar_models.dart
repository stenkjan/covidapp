class CalendarModel {
  final String? id;
  final String? mood;
  final String? muedigkeit;
  final String? atemnot;
  final String? sinne;
  final String? herz;
  final String? schlaf;
  final String? nerven;
  final String? comment;
  final String? createdDate;
  //

  CalendarModel(this.id, this.mood, this.muedigkeit, this.atemnot, this.sinne,
      this.herz, this.schlaf, this.nerven, this.comment, this.createdDate);
  // CalendarModel({required this.id, required this.fullName, required this.email, required this.CalendarModelRole});
  CalendarModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        //fullName = data['fullName'],
        mood = data['mood'],
        muedigkeit = data['muedgkeit'],
        atemnot = data['atemnot'],
        sinne = data['sinne'],
        herz = data['herz'],
        schlaf = data['schlaf'],
        nerven = data['nerven'],
        comment = data['comment'],
        createdDate = data['create_date'];
  // CalendarModelRole = data['CalendarModelRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mood': mood,
      'muedigkeit': muedigkeit,
      'atemnot': atemnot,
      'sinne': sinne,
      'herz': herz,
      'schlaf': schlaf,
      'nerven': nerven,
      'cerate_date': createdDate,
      //'fullName': fullName,

      // 'CalendarModelRole': CalendarModelRole,
    };
  }
}
