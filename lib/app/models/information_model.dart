class Information {
  late final int id;
  late final String information;

  Information(this.id, this.information);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'information': information,
    };
  }

  Map<String, dynamic> toMapExceptId() {
    return {
      'information': information,
    };
  }

  factory Information.fromMap(Map<String, dynamic> map) {
    return Information(map['id'], map['information']);
  }

  @override
  String toString() {
    return 'Information{id: $id, information: $information}';
  }
}
