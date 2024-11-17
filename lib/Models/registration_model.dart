class RegistrationModel{
  final bool status;
  RegistrationModel({required this.status});
  factory RegistrationModel.fromJson(Map<String,dynamic>json){
    return RegistrationModel(status: json['status']);
  }
}