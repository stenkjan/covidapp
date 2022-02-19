class GrafikModel {
  late int? mood;
  late int? muedigkeit;
  late int? atemnot;
  late int? sinne;
  late int? herz;
  late int? schlaf;
  late String? nerven;
  late String? comment;
  late String? createdDate;
  late final List<List> docList;
  GrafikModel(this.docList);

  GrafikModel.fromList(List<List> docList)
      // : id = docList[0].toString(),
      //fullName = data['fullName'],
      : mood = int.parse(docList[0].toString()),
        muedigkeit = int.parse(docList[1].toString()),
        atemnot = int.parse(docList[2].toString()),
        sinne = int.parse(docList[3].toString()),
        herz = int.parse(docList[4].toString()),
        schlaf = int.parse(docList[5].toString()),
        nerven = docList[6].toString(),
        comment = docList[7].toString(),
        createdDate = docList[8].toString();

  int? moodReturn() {
    if (mood != null) {
      return mood;
    }
  }
}
