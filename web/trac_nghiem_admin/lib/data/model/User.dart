class User {
  String username;
  String email;
  String fullName;
  String address;
  String phoneNumber;
  String birthday;
  String job;
  String linkavata;
  bool isAdmin;

  User(
      {this.username,
        this.email,
        this.fullName,
        this.address,
        this.phoneNumber,
        this.birthday,
        this.job,
        this.linkavata,
        this.isAdmin});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    fullName = json['fullName'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    birthday = json['birthday'];
    job = json['job'];
    linkavata = json['linkavata'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['birthday'] = this.birthday;
    data['job'] = this.job;
    data['linkavata'] = this.linkavata;
    data['isAdmin'] = this.isAdmin;
    return data;
  }

}