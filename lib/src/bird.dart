class Bird {
  final int id;
  String name;
  Bird(this.id, this.name);
  factory Bird.fromJson(Map<String, dynamic> bird) =>
      new Bird(_toInt(bird['id']), bird['name']);
  Map toJson() => {'id': id, 'name': name};
}

int _toInt(id) => id is int ? id : int.parse(id);
