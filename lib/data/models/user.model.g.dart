// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      address: json['address'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      birthDay: json['birthDay'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      userId: json['userId'] as String,
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
      lastUpdate: json['lastUpdate'] == null
          ? null
          : DateTime.parse(json['lastUpdate'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'birthDay': instance.birthDay,
      'address': instance.address,
      'avatarUrl': instance.avatarUrl,
      'createAt': instance.createAt?.toIso8601String(),
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'lastUpdate': instance.lastUpdate?.toIso8601String(),
    };
