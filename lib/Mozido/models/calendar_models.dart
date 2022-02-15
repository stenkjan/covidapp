class CalendarModel {
  final String? id;
  final String? mood;
  final String? muedigkeit;
  final String? atemnot;
  final String? sinne;
  final String? herz;
  final String? schlaf;
  final String? nerven;

  //

  CalendarModel(this.id, this.mood, this.muedigkeit, this.atemnot, this.sinne,
      this.herz, this.schlaf, this.nerven);
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
        nerven = data['nerven'];
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
      //'fullName': fullName,

      // 'CalendarModelRole': CalendarModelRole,
    };
  }
}
