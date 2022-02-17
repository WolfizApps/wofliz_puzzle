class Person {
  String? name;
  String? age;
  String? gender;

  Person({this.name, this.age, this.gender});

  factory Person.fromJson(Map<String, dynamic> parsedJson) {
    return Person(
        name: parsedJson['name'] ?? "",
        age: parsedJson['age'] ?? "",
        gender: parsedJson['gender'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "age": this.age,
      "gender": this.gender,
    };
  }
}
