/// Initialization Calendarmodel */

class CalendarModel {
  final int id;
  final int mood;
  final int muedigkeit;
  final int atemnot;
  final int sinne;
  final int herz;
  final int schlaf;
  final int nerven;
  final String? comment;
  final int createdDate;

  CalendarModel(this.id, this.mood, this.muedigkeit, this.atemnot, this.sinne,
      this.herz, this.schlaf, this.nerven, this.comment, this.createdDate);

  CalendarModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        mood = data['mood'],
        muedigkeit = data['muedgkeit'],
        atemnot = data['atemnot'],
        sinne = data['sinne'],
        herz = data['herz'],
        schlaf = data['schlaf'],
        nerven = data['nerven'],
        comment = data['comment'],
        createdDate = data['create_date'];

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
    };
  }
}
