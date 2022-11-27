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
  final bool student;
  final bool staff;
  final bool wizard;
  final bool tavivo;
  final dynamic wand;
  final String actorNombre;
  final String imagenurl;

  factory Personaje.constructor({required dynamic jsonElement}){
    String nombre = jsonElement["name"] ?? "";
    String raza = jsonElement["species"] ?? "";
    String genero = jsonElement["gender"] ?? "";
    String casa = jsonElement["house"] ?? "";
    String fechaNacimiento = jsonElement["dateOfBirth"] ?? "";
    int anioNacimiento = jsonElement["yearOfBirth"] ?? 0;
    String colorDeOjos = jsonElement["eyeColour"] ?? "";
    String colorDeCabello = jsonElement["hairColour"] ?? "";
    String patronus = jsonElement["patronus"] ?? "";
    bool student = jsonElement["hogwartsStudent"] ?? false;
    bool staff = jsonElement["hogwartsStaff"] ?? false;
    bool wizard = jsonElement["wizard"] ?? false;
    bool tavivo = jsonElement["alive"] ?? false;
    dynamic wand = jsonElement["wand"] ?? "";
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
    student,
    staff,
    wizard,
    tavivo,
    wand,
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
  this.student,
  this.staff,
  this.wizard,
  this.tavivo,
  this.wand,
  this.actorNombre,
  this.imagenurl);
}