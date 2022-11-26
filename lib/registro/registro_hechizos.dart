class Hechizos{
  final String nombre;
  final String desc;

  factory Hechizos.constructor({required dynamic jsonElement}){
    String nombre = jsonElement["name"] ?? "";
    String desc = jsonElement["description"] ?? "";
    return Hechizos._(nombre, desc);
  }
  
  Hechizos._(this.nombre, this.desc);
}