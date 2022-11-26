class Personaje{
  final String nombre;
  final String raza;
  final String genero;
  final String casa;
  final String fechaNacimiento;
  final int anioNacimiento;
  final String colorDeOjos;
  final String colorDeCabello;
  final String patronus;
  final String actorNombre;
  final String imagenurl;

  factory Personaje.constructor({required dynamic jsonElement}){
    String nombre = jsonElement["name"] ?? "";
    String raza = jsonElement["species"] ?? "";
    String genero = jsonElement["gender"] ?? "";
    String casa = jsonElement["house"] ?? "";
    String fechaNacimiento = jsonElement["dateOfBirth"] ?? "";
    int anioNacimiento = jsonElement["yearOfBirth"] ?? "";
    String colorDeOjos = jsonElement["eyeColour"] ?? "";
    String colorDeCabello = jsonElement["hairColour"] ?? "";
    String patronus = jsonElement["patronus"] ?? "";
    String actorNombre = jsonElement["actor"] ?? "";
    String imagenurl = jsonElement["image"] ?? "";
    
    return Personaje._(nombre,
    raza,
    genero,
    casa,
    fechaNacimiento,
    anioNacimiento,
    colorDeOjos,
    colorDeCabello,
    patronus,
    actorNombre,
    imagenurl);
  }
  Personaje._(this.nombre,
  this.raza,
  this.genero,
  this.casa,
  this.fechaNacimiento,
  this.anioNacimiento,
  this.colorDeOjos,
  this.colorDeCabello,
  this.patronus,
  this.actorNombre,
  this.imagenurl);
}