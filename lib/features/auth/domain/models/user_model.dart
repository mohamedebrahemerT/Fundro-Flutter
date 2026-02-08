// import 'package:fundro_app/features/address/domain/models/address_model.dart';

// class UserModel {
//   int? id;
//   String? firstName;
//   String? name;
//   String? lastName;
//   String? email;
//   String? phone;
//   String? role;
//   String? createdAt;
//   String? image;
//   String? password;
//   String? token;
//   List<AddressModel>? addresses;

//   UserModel({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.name,
//     this.phone,
//     this.role,
//     this.createdAt,
//     this.image,
//     this.password,
//     this.token,
//     this.addresses,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
//       firstName: json['first_name'],
//       lastName: json['last_name'],
//       email: json['email'],
//       name: '${json['first_name']} ${json['last_name']}',
//       phone: json['phone'],
//       // role: json['role'],
//       createdAt: json['created_at'],
//       image: json['image'],
//       password: json['password'],
//       token: json['token'],
//       addresses: json['addresses'] != null
//           ? (json['addresses'] as List)
//               .map((e) => AddressModel.fromJson(e))
//               .toList()
//           : [],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'first_name': firstName,
//       'last_name': lastName,
//       'email': email,
//       'name':'$firstName $lastName',
//       'phone': phone,
//       'role': role,
//       'created_at': createdAt,
//       'image': image,
//       'password': password,
//       'token': token,
//       'addresses': addresses?.map((e) => e.toJson()).toList(),
//     };
//   }
// }
