class GetTokenModel {
    String email;
    String password;
    bool returnSecureToken;

    GetTokenModel({
        required this.email,
        required this.password,
        required this.returnSecureToken,
    });

    factory GetTokenModel.fromJson(Map<String, dynamic> json) => GetTokenModel(
        email: json["email"],
        password: json["password"],
        returnSecureToken: json["returnSecureToken"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "returnSecureToken": returnSecureToken,
    };
}
