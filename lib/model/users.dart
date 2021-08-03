class User {
   String uid;
   String nickName;
   String phone;
   String userName;
   String profilePhoto;

  User({
     this.uid,
     this.nickName,
     this.phone,
     this.userName,
     this.profilePhoto,
  });

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['name'] = user.nickName;
    data['email'] = user.phone;
    data['username'] = user.userName;
    data["profile_photo"] = user.profilePhoto;
    return data;
  }

  User.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.nickName = mapData['name'];
    this.phone = mapData['email'];
    this.userName = mapData['username'];
    this.profilePhoto = mapData['profile_photo'];
  }
}