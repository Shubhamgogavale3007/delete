class LoginResponseModel {
  bool? isSuccess;
  String? message;
  LoginResponseData? data;

  LoginResponseModel({this.isSuccess, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    data =
        json['data'] != null ? LoginResponseData.fromJson(json['data']) : null;
  }
}

class LoginResponseData {
  String? sId;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? phoneCode;
  String? countryCode;
  String? countryName;
  String? flagEmoji;
  SponsorDetails? sponsorDetails;
  String? walletAddress;
  String? stakeWallet;
  String? lockWallet;
  String? rewardWallet;
  String? gameWallet;
  String? superCoin;
  bool? is2faEnable;
  bool? isVerified;
  String? profileImage;
  bool? isAcceptConditions;
  bool? isActiveToday;
  String? lastActiveDate;
  String? accessToken;

  LoginResponseData(
      {this.sId,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.phoneCode,
      this.countryCode,
      this.countryName,
      this.flagEmoji,
      this.sponsorDetails,
      this.walletAddress,
      this.stakeWallet,
      this.lockWallet,
      this.rewardWallet,
      this.gameWallet,
      this.superCoin,
      this.is2faEnable,
      this.isVerified,
      this.profileImage,
      this.isAcceptConditions,
      this.isActiveToday,
      this.lastActiveDate,
      this.accessToken});

  LoginResponseData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    phoneCode = json['phoneCode'];
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    flagEmoji = json['flagEmoji'];
    sponsorDetails = json['sponsorDetails'] != null
        ? SponsorDetails.fromJson(json['sponsorDetails'])
        : null;
    walletAddress = json['walletAddress'];
    stakeWallet = json['stakeWallet'];
    lockWallet = json['lockWallet'];
    rewardWallet = json['rewardWallet'];
    gameWallet = json['gameWallet'];
    superCoin = json['superCoin'];
    is2faEnable = json['is2faEnable'];
    isVerified = json['isVerified'];
    profileImage = json['profileImage'];
    isAcceptConditions = json['isAcceptConditions'];
    isActiveToday = json['isActiveToday'];
    lastActiveDate = json['lastActiveDate'];
    accessToken = json['accessToken'];
  }
}

class SponsorDetails {
  String? sId;
  String? name;
  String? username;
  String? email;
  bool? isActive;
  String? profileImage;
  String? phone;
  String? phoneCode;
  String? countryCode;
  String? createdAt;

  SponsorDetails(
      {this.sId,
      this.name,
      this.username,
      this.email,
      this.isActive,
      this.profileImage,
      this.phone,
      this.phoneCode,
      this.countryCode,
      this.createdAt});

  SponsorDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    isActive = json['isActive'];
    profileImage = json['profileImage'];
    phone = json['phone'];
    phoneCode = json['phoneCode'];
    countryCode = json['countryCode'];
    createdAt = json['createdAt'];
  }
}
