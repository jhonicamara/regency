class ValidationMixin {
  String validarString(String valor) {
    if (valor.length < 10) {
      return "A senha deve ter no mínimo 4 caracteres";
    }
    return null;
  }
}
