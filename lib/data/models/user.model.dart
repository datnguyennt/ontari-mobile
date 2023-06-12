import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.model.g.dart';

@JsonSerializable()
class UserModel {
  final String userId;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? birthDay;
  final String? address;
  final String? avatarUrl;
  final DateTime? createAt;
  final DateTime? lastLogin;
  final DateTime? lastUpdate;
  UserModel({
    this.address,
    this.avatarUrl,
    this.birthDay,
    this.email,
    this.fullName,
    this.phoneNumber,
    required this.userId,
    this.createAt,
    this.lastLogin,
    this.lastUpdate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static UserModel toUserModel(User user) {
    return UserModel(
      userId: user.uid,
      email: user.email,
      fullName: user.displayName,
      avatarUrl: user.photoURL,
      createAt: user.metadata.creationTime,
      lastLogin: user.metadata.lastSignInTime,
    );
  }
}
