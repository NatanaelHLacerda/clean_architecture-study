class ContactModel {
  final String name;
  final String email;
  final String phone;
  final String id;

  ContactModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.id,

  });

  factory ContactModel.fromMap(dynamic map) {
    return ContactModel(name: map['name'], email: map['email'], phone: map['phone'], id: map['id']);
  }


}

toMap(ContactModel model){
  return {
    'name': model.name,
    'email': model.email,
    'phone': model.phone,
    'id': model.id,
  };
}
