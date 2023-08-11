class DetailModel {
  bool? success;
  int? status;
  String? message;
  List<Data>? data;

  DetailModel({this.success, this.status, this.message, this.data});

  DetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? email;
  String? status;
  String? mobile;
  String? leadNumber;
  List<StatusHistory>? statusHistory;
  PolicyTypeDetails? policyTypeDetails;
  int? createdAt;
  String? complaintTypeName;
  String? leadCreatedBy;
  PartnerDetails? partnerDetails;

  Data(
      {this.sId,
        this.name,
        this.email,
        this.status,
        this.mobile,
        this.leadNumber,
        this.statusHistory,
        this.policyTypeDetails,
        this.createdAt,
        this.complaintTypeName,
        this.leadCreatedBy,
        this.partnerDetails});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    mobile = json['mobile'];
    leadNumber = json['leadNumber'];
    if (json['statusHistory'] != null) {
      statusHistory = <StatusHistory>[];
      json['statusHistory'].forEach((v) {
        statusHistory!.add(new StatusHistory.fromJson(v));
      });
    }
    policyTypeDetails = json['policyTypeDetails'] != null
        ? new PolicyTypeDetails.fromJson(json['policyTypeDetails'])
        : null;
    createdAt = json['createdAt'];
    complaintTypeName = json['complaintTypeName'];
    leadCreatedBy = json['leadCreatedBy'];
    partnerDetails = json['partnerDetails'] != null
        ? new PartnerDetails.fromJson(json['partnerDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    data['mobile'] = this.mobile;
    data['leadNumber'] = this.leadNumber;
    if (this.statusHistory != null) {
      data['statusHistory'] =
          this.statusHistory!.map((v) => v.toJson()).toList();
    }
    if (this.policyTypeDetails != null) {
      data['policyTypeDetails'] = this.policyTypeDetails!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['complaintTypeName'] = this.complaintTypeName;
    data['leadCreatedBy'] = this.leadCreatedBy;
    if (this.partnerDetails != null) {
      data['partnerDetails'] = this.partnerDetails!.toJson();
    }
    return data;
  }
}

class StatusHistory {
  String? currStatus;
  String? date;
  String? sId;

  StatusHistory({this.currStatus, this.date, this.sId});

  StatusHistory.fromJson(Map<String, dynamic> json) {
    currStatus = json['currStatus'];
    date = json['date'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currStatus'] = this.currStatus;
    data['date'] = this.date;
    data['_id'] = this.sId;
    return data;
  }
}

class PolicyTypeDetails {
  String? sId;
  bool? isActive;
  int? createdAt;
  int? updatedAt;
  String? name;
  // int? iV;
  String? hindiName;
  String? imageUrl;
  ImageUrlV1? imageUrlV1;

  PolicyTypeDetails(
      {this.sId,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.name,
        // this.iV,
        this.hindiName,
        this.imageUrl,
        this.imageUrlV1});

  PolicyTypeDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    // iV = json['__v'];
    hindiName = json['hindiName'];
    imageUrl = json['imageUrl'];
    imageUrlV1 = json['imageUrlV1'] != null
        ? new ImageUrlV1.fromJson(json['imageUrlV1'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['name'] = this.name;
    // data['__v'] = this.iV;
    data['hindiName'] = this.hindiName;
    data['imageUrl'] = this.imageUrl;
    if (this.imageUrlV1 != null) {
      data['imageUrlV1'] = this.imageUrlV1!.toJson();
    }
    return data;
  }
}

class ImageUrlV1 {
  String? selectedImageUrl;
  String? unselectedImageUrl;

  ImageUrlV1({this.selectedImageUrl, this.unselectedImageUrl});

  ImageUrlV1.fromJson(Map<String, dynamic> json) {
    selectedImageUrl = json['selectedImageUrl'];
    unselectedImageUrl = json['unselectedImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['selectedImageUrl'] = this.selectedImageUrl;
    data['unselectedImageUrl'] = this.unselectedImageUrl;
    return data;
  }
}

class PartnerDetails {
  String? companyName;
  String? name;

  PartnerDetails({this.companyName, this.name});

  PartnerDetails.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyName'] = this.companyName;
    data['name'] = this.name;
    return data;
  }
}