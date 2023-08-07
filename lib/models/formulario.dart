class Formulario {
  String? id;
  String? nome;
  String? email;
  String? whatsapp;
  String? instagram;
  String? motorizacao;
  String? ano;
  String? modeloKombi;
  String? cidade;
  String? estado;

  Formulario(
      {this.id,
      this.nome,
      this.email,
      this.whatsapp,
      this.instagram,
      this.motorizacao,
      this.ano,
      this.modeloKombi,
      this.cidade,
      this.estado});

  factory Formulario.fromMap(Map<String, dynamic> map) {
    return Formulario(
        id: map["id"],
        nome: map["nome"],
        email: map["email"],
        whatsapp: map["whatsapp"],
        instagram: map["instagram"],
        motorizacao: map["motorizacao"],
        ano: map["ano"],
        modeloKombi: map["modeloKombi"],
        cidade: map["cidade"],
        estado: map["estado"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "email": email,
      "whatsapp": whatsapp,
      "instagram": instagram,
      "motorizacao": motorizacao,
      "ano": ano,
      "modeloKombi": modeloKombi,
      "cidade": cidade,
      "estado": estado
    };
  }
}
