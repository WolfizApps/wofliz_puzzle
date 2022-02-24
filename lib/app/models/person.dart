class Person {
  String name;
  String age;
  String gender;

  Person({required this.name, required this.age, required this.gender});

  factory Person.fromJson(Map<String, dynamic> parsedJson) {
    return Person(
        name: parsedJson['name'] ?? "",
        age: parsedJson['age'] ?? "",
        gender: parsedJson['gender'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "age": age,
      "gender": gender,
    };
  }
}
