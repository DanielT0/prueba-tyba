

class User {
  
  final String mail;
  final String password;
  final String? cedula;
  final String? nombre;

  User({ 
    required this.mail, 
    required this.password, 
    this.cedula,
    this.nombre,
  });

  User copyWith({
    String? mail,
    String? password,
    List<User>? usuarios,
    String? cedula,
    String? nombre,
  }) => User(
    mail: mail ?? this.mail,
    password: password ?? this.password, 
    cedula: cedula ?? this.cedula,
    nombre: nombre ?? this.nombre
  );

}