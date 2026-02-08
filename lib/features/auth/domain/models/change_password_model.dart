class ChangePasswordModel {
  final String oldPassword;
  final String newPassword;
  final String newPasswordConfirmation;

  ChangePasswordModel({
    required this.oldPassword,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'old_password': oldPassword,
      'new_password': newPassword,
      'new_password_confirmation': newPasswordConfirmation,
    };
  }

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      oldPassword: json['old_password'] ?? '',
      newPassword: json['new_password'] ?? '',
      newPasswordConfirmation: json['new_password_confirmation'] ?? '',
    );
  }
}
