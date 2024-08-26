import 'package:image_picker/image_picker.dart';

/// Login Request
class LoginRequest {
  String? username;
  String? password;

  LoginRequest({this.username, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}

/// Support Request
class SupportRequest {
  FilterRequest? filters;
  int? pageSize;
  int? pageNumber;

  SupportRequest({this.filters, this.pageSize, this.pageNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (filters != null) {
      data['filters'] = filters!.toJson();
    }
    data['pageSize'] = pageSize;
    data['pageNumber'] = pageNumber;
    return data;
  }
}

class FilterRequest {
  String? requestType;
  String? message;
  String? ticketId;
  String? status;

  FilterRequest({this.requestType, this.message, this.ticketId, this.status});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requestType'] = requestType;
    data['message'] = message;
    data['ticketId'] = ticketId;
    data['status'] = status;
    return data;
  }
}

/// Ticket Details Request
class TicketDetailsRequest {
  String? id;

  TicketDetailsRequest({this.id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

/// Reply Request
class ReplyRequest {
  String? id;
  String? message;
  List<XFile>? attachments;

  ReplyRequest({this.id, this.message, this.attachments});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    if (attachments != null) {
      data['attachments'] = attachments!.toList();
    }
    return data;
  }
}

class Attachments {
  String? sId;
  String? srcUrl;

  Attachments({this.sId, this.srcUrl});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['srcUrl'] = srcUrl;
    return data;
  }
}
