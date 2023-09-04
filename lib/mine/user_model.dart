class UserModel {
  num? id;
  String? username;
  String? token;
  String? email;
  num? gender = 0;
  String? location;
  String? birthday;
  String? avatar;
  int? deviceType;
  String? phoneNumber;

  UserModel(
      {required this.email,
      required this.gender,
      required this.id,
      required this.location,
      required this.birthday,
      required this.avatar,
      required this.phoneNumber,
      required this.token,
      required this.deviceType,
      required this.username});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'] ?? "",
        id: map['id'],
        gender: map['gender'] ?? 0,
        location: map['location'] ?? "",
        birthday: map['birthday'] ?? "",
        avatar: map['avatar'] ?? "",
        phoneNumber: map['phone_number'] ?? "",
        token: map['token'] ?? "",
        deviceType: map['device_type'] ?? 0,
        username: map['username']);
  }

  @override
  String toString() {
    return 'UserModel{id: $id, username: $username, email: $email, gender: $gender, location: $location, birthday: $birthday, avatar: $avatar, phoneNumber: $phoneNumber}';
  }
}
