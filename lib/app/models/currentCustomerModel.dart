class CustomerModel {
  final User user;
  final List<Apartment> apartments;

  CustomerModel({required this.user, required this.apartments});

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      user: User.fromJson(json['user']),
      apartments: (json['apartments'] as List)
          .map((apartment) => Apartment.fromJson(apartment))
          .toList(),
    );
  }
}

class User {
  final int id;
  final String name;
  final String mobileNumber;
  final List<String> roles;

  User({
    required this.id,
    required this.name,
    required this.mobileNumber,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      mobileNumber: json['mobileNumber'],
      roles: List<String>.from(json['roles']),
    );
  }
}

class Apartment {
  final int id;
  final String name;
  final List<Flat> flats;

  Apartment({
    required this.id,
    required this.name,
    required this.flats,
  });

  factory Apartment.fromJson(Map<String, dynamic> json) {
    return Apartment(
      id: json['id'],
      name: json['name'],
      flats: (json['flats'] as List)
          .map((flat) => Flat.fromJson(flat))
          .toList(),
    );
  }
}

class Flat {
  final int id;
  final String flatNo;
  final String accessType;
  final bool approved;

  Flat({
    required this.id,
    required this.flatNo,
    required this.accessType,
    required this.approved,
  });

  factory Flat.fromJson(Map<String, dynamic> json) {
    return Flat(
      id: json['id'],
      flatNo: json['flatNo'],
      accessType: json['accessType'],
      approved: json['approved'],
    );
  }
}
