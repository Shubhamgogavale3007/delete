class SupportResponseModel {
  bool? isSuccess;
  String? message;
  SupportResponseData? data;

  SupportResponseModel({this.isSuccess, this.message, this.data});

  SupportResponseModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    data = json['data'] != null
        ? SupportResponseData.fromJson(json['data'])
        : null;
  }
}

class SupportResponseData {
  Filters? filters;
  int? pageSize;
  int? pageNumber;
  int? totalRecords;
  int? totalPages;
  List<Records>? records;

  SupportResponseData(
      {this.filters,
      this.pageSize,
      this.pageNumber,
      this.totalRecords,
      this.totalPages,
      this.records});

  SupportResponseData.fromJson(Map<String, dynamic> json) {
    filters =
        json['filters'] != null ? Filters.fromJson(json['filters']) : null;
    pageSize = json['pageSize'];
    pageNumber = json['pageNumber'];
    totalRecords = json['totalRecords'];
    totalPages = json['totalPages'];
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(Records.fromJson(v));
      });
    }
  }
}

class Filters {
  String? requestType;
  String? message;
  String? ticketId;
  String? status;

  Filters({this.requestType, this.message, this.ticketId, this.status});

  Filters.fromJson(Map<String, dynamic> json) {
    requestType = json['requestType'];
    message = json['message'];
    ticketId = json['ticketId'];
    status = json['status'];
  }
}

class Records {
  String? sId;
  String? ticketId;
  bool? isOpen;
  String? requestType;
  List<Reply>? reply;
  String? createdAt;

  Records(
      {this.sId,
      this.ticketId,
      this.isOpen,
      this.requestType,
      this.reply,
      this.createdAt});

  Records.fromJson(Map<String, dynamic> json) {
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
