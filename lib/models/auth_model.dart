class Auth{
  late int id;
  late String muassasa;
  late String password;


  Auth(this.id, this.muassasa, this.password);

  Auth.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    muassasa = json["muassasa"];
    password = json["password"];

  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "muassasa": muassasa,
    "password": password,

  };

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  bool operator == (Object other) {
    return other is Auth && other.id == id;
  }

  @override
  int get hashCode => Object.hash(id, muassasa);
}