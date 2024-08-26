class TicketDetailsResponseModel {
  bool? isSuccess;
  String? message;
  TicketDetailsResponseData? data;

  TicketDetailsResponseModel({this.isSuccess, this.message, this.data});

  TicketDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    data = json['data'] != null
        ? TicketDetailsResponseData.fromJson(json['data'])
        : null;
  }
}

class TicketDetailsResponseData {
  String? sId;
  String? ticketId;
  bool? isOpen;
  String? requestType;
  List<Reply>? reply;
  String? createdAt;

  TicketDetailsResponseData(
      {this.sId,
      this.ticketId,
      this.isOpen,
      this.requestType,
      this.reply,
      this.createdAt});

  TicketDetailsResponseData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ticketId = json['ticketId'];
    isOpen = json['isOpen'];
    requestType = json['requestType'];
    if (json['reply'] != null) {
      reply = <Reply>[];
      json['reply'].forEach((v) {
        reply!.add(Reply.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
  }
}

class Reply {
  String? sId;
  String? replyBy;
  String? profileImage;
  String? message;
  List<Attachments>? attachments;
  String? replyAt;

  Reply(
      {this.sId,
      this.replyBy,
      this.profileImage,
      this.message,
      this.attachments,
      this.replyAt});

  Reply.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    replyBy = json['replyBy'];
    profileImage = json['profileImage'];
    message = json['message'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(Attachments.fromJson(v));
      });
    }
    replyAt = json['replyAt'];
  }
}

class Attachments {
  String? sId;
  String? srcUrl;

  Attachments({this.sId, this.srcUrl});

  Attachments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    srcUrl = json['srcUrl'];
  }
}
