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

  @override
  String toString() {
    return 'Information{id: $id, information: $information}';
  }
}
