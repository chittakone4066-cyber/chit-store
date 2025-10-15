class User {
  final String city;
  final String street;
  final String fname;
  final String lname;
  final String email;
  final String username;
  final String password;
  final int id;

  const User({
    required this.city,
    required this.street,
    required this.fname,
    required this.lname,
    required this.email,
    required this.username,
    required this.password,
    required this.id,
  });

  factory User.formJson(Map<String, dynamic> json) {
    final address = json['address'];
    final name = json['name'];
    return User(
      city: address['city'],
      street: address['street'],
      fname: name['firstname'],
      lname: name['lastname'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      id: json['id'],
    );
  }
}
