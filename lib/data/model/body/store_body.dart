class StoreBody {
  String storeName;
  String storeAddress;
  // String tax;
  String companyName;
  String minDeliveryTime;
  String maxDeliveryTime;
  String lat;
  String lng;
  String fName;
  String lName;
  String phone;
  String email;
  String isGstAvalable;
  // String password;
  String zoneId;
  String moduleId;
  String deliveryTimeType;
  // Extra Fields
  String gstNumber;
  String pharmacyLicense;
  String accountNumber;
  String accountHolderName;
  String bankName;
  String branchName;
  String ifscCode;
  String panCardNo;

  StoreBody({
    this.storeName,
    this.storeAddress,
    // this.tax,
    this.minDeliveryTime,
    this.maxDeliveryTime,
    this.lat,
    this.lng,
    this.fName,
    this.lName,
    this.phone,
    this.email,
    this.isGstAvalable,
    this.companyName,
    // this.password,
    this.zoneId,
    this.moduleId,
    this.deliveryTimeType,
    // extra fields
    this.gstNumber,
    this.pharmacyLicense,
    this.accountHolderName,
    this.accountNumber,
    this.bankName,
    this.branchName,
    this.ifscCode,
    this.panCardNo,
  });

  StoreBody.fromJson(Map<String, dynamic> json) {
    storeName = json['store_name'];
    storeAddress = json['store_address'];
    // tax = json['tax'];
    companyName = json['company_name'];
    isGstAvalable = json['is_gst_avalable'];
    minDeliveryTime = json['min_delivery_time'];
    maxDeliveryTime = json['max_delivery_time'];
    lat = json['lat'];
    lng = json['lng'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    // password = json['password'];
    zoneId = json['zone_id'];
    moduleId = json['module_id'];
    deliveryTimeType = json['delivery_time_type'];
    gstNumber = json['gstnumber'];
    pharmacyLicense = json['pharmacy_license_no'];
    accountNumber = json['account_number'];
    accountHolderName = json['account_holder_name'];
    bankName = json['bank_name'];
    branchName = json['baranch_name'];
    ifscCode = json['ifsc_code'];
    panCardNo = json['pan_card_no'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['name'] = this.storeName;
    data['address'] = this.storeAddress;
    data['is_gst_avalable'] = this.isGstAvalable;
    // data['tax'] = this.tax;
    data['company_name'] = this.companyName;
    data['minimum_delivery_time'] = this.minDeliveryTime;
    data['maximum_delivery_time'] = this.maxDeliveryTime;
    data['latitude'] = this.lat;
    data['longitude'] = this.lng;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    // data['password'] = this.password;
    data['zone_id'] = this.zoneId;
    data['module_id'] = this.moduleId;
    data['delivery_time_type'] = this.deliveryTimeType;
    data['gstnumber'] = this.gstNumber;
    data['pharmacy_license_no'] = this.pharmacyLicense;
    data['account_holder_name'] = this.accountHolderName;
    data['account_number'] = this.accountNumber;
    data['bank_name'] = this.bankName;
    data['baranch_name'] = this.branchName;
    data['ifsc_code'] = this.ifscCode;
    data['pan_card_no'] = this.panCardNo;
    return data;
  }
}
