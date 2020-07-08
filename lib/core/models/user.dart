import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String uid;
  final String firstName;
  final String lastName;
  final String name;
  final String phoneNo;
  final String photoUrl;
  final String photoPlaceholder;
  final DateTime dob;
  final String role;
  final String email;

  User(
     {@required this.uid,
      this.firstName,
      this.lastName,
      this.name,
      this.phoneNo,
      this.photoUrl,
      this.photoPlaceholder,
      this.dob,
      this.role,
      this.email});


  User.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        name = json['name'],
        phoneNo = json['phoneNo'],
        photoUrl = json['photoUrl'],
        photoPlaceholder = json['photoPlaceholder'],
        dob = json['dob'].toDate(),
        role = json['role'],
        email = json['email'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['uid'] = this.uid;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['name'] = this.name;
    data['phoneNo'] = this.phoneNo;
    data['photoUrl'] = this.photoUrl;
    data['photoPlaceholder'] = this.photoPlaceholder;
    data['dob'] = this.dob.toUtc();
    data['role'] = this.role;
    data['email'] = this.email;
    return data;
  }

  @override
  List<Object> get props => [uid];
}
