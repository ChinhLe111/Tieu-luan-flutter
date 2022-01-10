
class Employees{
  int id;
  String name;
  int age;
  String position;
  String phone;
  String address;
  int isRetired = 0;
  String createdAt;
  String dateRetired;

  Employees({this.id, this.name, this.age, this.position, this.phone,
      this.address, this.isRetired, this.createdAt, this.dateRetired});

  factory Employees.fromMap(Map<String, dynamic> json) {
    return Employees(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      position: json['position'],
      phone: json['phone'],
      address: json['address'],
      isRetired: json['isRetired'],
      createdAt: json['createdAt'],
      dateRetired: json['dateRetired']
    );
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if(id != null) {
      map['id'] = id;
    }

    map['name'] = name;
    map['age'] = age;
    map['position'] = position;
    map['phone'] = phone;
    map['address'] = address;
    map['isRetired'] = isRetired;
    map['createdAt'] = createdAt;
    map['dateRetired'] = dateRetired;
    return map;
  }
}