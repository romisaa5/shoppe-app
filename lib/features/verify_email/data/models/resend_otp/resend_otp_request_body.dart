class ResendOtpRequestBody {
  final String email;

  ResendOtpRequestBody({required this.email});

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}
