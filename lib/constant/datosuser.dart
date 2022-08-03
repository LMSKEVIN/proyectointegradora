class DatosUsuario {
  static var datos = 'null';
  static ingresarDatos(String user) {
    datos = user;
  }

  static devolverDatos() {
    return datos;
  }
}
