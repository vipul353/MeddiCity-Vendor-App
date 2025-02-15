import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart_store/controller/auth_controller.dart';
import 'package:sixam_mart_store/data/model/body/store_body.dart';
import 'package:sixam_mart_store/util/dimensions.dart';
import 'package:sixam_mart_store/util/images.dart';
import 'package:sixam_mart_store/util/styles.dart';
import 'package:sixam_mart_store/view/base/custom_app_bar.dart';
import 'package:sixam_mart_store/view/base/custom_button.dart';
import 'package:sixam_mart_store/view/base/custom_snackbar.dart';
import 'package:sixam_mart_store/view/base/custom_text_field.dart';
import 'package:sixam_mart_store/view/screens/auth/widget/module_view.dart';
import 'package:sixam_mart_store/view/screens/auth/widget/select_location_view.dart';

class StoreRegistrationScreen extends StatefulWidget {
  const StoreRegistrationScreen({Key key}) : super(key: key);
  @override
  State<StoreRegistrationScreen> createState() =>
      _StoreRegistrationScreenState();
}

bool _isShow = false;

class _StoreRegistrationScreenState extends State<StoreRegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  // final TextEditingController _vatController = TextEditingController();
  final TextEditingController _minTimeController = TextEditingController();
  final TextEditingController _maxTimeController = TextEditingController();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
    final TextEditingController _companyName = TextEditingController();
  // Extra Details
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _pharmacyLicenseController =
      TextEditingController();
  final TextEditingController _gstNumberController = TextEditingController();
  final TextEditingController _panNumberController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _accountHolderNameController =
      TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();
  final TextEditingController _panCardNoController = TextEditingController();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  // final FocusNode _vatFocus = FocusNode();
  final FocusNode _minTimeFocus = FocusNode();
  final FocusNode _maxTimeFocus = FocusNode();
  final FocusNode _fNameFocus = FocusNode();
  final FocusNode _lNameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  // Extra Fields
  final FocusNode _gstFocus = FocusNode();
  final FocusNode _licenseFocus = FocusNode();
  final FocusNode _accountNumberFocus = FocusNode();
  final FocusNode _accountHolderNameFocus = FocusNode();
  final FocusNode _bankNameFocus = FocusNode();
  final FocusNode _branchNameFocus = FocusNode();
  final FocusNode _ifscCodeFocus = FocusNode();
  final FocusNode _panCardNoFocus = FocusNode();

  // final FocusNode _passwordFocus = FocusNode();
  // final FocusNode _confirmPasswordFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    // Get.find<SplashController>().getModules();
    Get.find<AuthController>().getZoneList();
    Get.find<AuthController>().setDeliveryTimeTypeIndex(
        Get.find<AuthController>().deliveryTimeTypeList[0], false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'store_registration'.tr),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.PADDING_SIZE_SMALL,
            horizontal: Dimensions.PADDING_SIZE_DEFAULT),
        child: GetBuilder<AuthController>(builder: (authController) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  hintText: 'store_name'.tr,
                  // errorText: 'Store name already taken',
                  controller: _nameController,
                  focusNode: _nameFocus,
                  nextFocus: _addressFocus,
                  inputType: TextInputType.name,
                  capitalization: TextCapitalization.words,
                  showTitle: true,
                ),

                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                CustomTextField(
                  hintText: 'store_address'.tr,
                  controller: _addressController,
                  focusNode: _addressFocus,
                  nextFocus: _gstFocus,
                  inputType: TextInputType.text,
                  capitalization: TextCapitalization.sentences,
                  maxLines: 3,
                  showTitle: true,
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Text(
                  'GST Number Available'.tr,
                  style: robotoRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_DEFAULT),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                          width: 10,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).secondaryHeaderColor,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  _isShow = !_isShow;
                                },
                              );
                            },
                            child: Text(
                              _isShow ? 'No' : 'Yes',
                              style: TextStyle(fontSize: 20),
                            ),
                          )),
                    ),
                  ],
                ),

                SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                Visibility(
                  visible: _isShow,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: CustomTextField(
                    hintText: 'GST Number'.tr,
                    controller: _gstNumberController,
                    focusNode: _gstFocus,
                    nextFocus: _panCardNoFocus,
                    inputType: TextInputType.text,
                    capitalization: TextCapitalization.words,
                    showTitle: true,
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                CustomTextField(
                  hintText: 'PAN Number'.tr,
                  controller: _panCardNoController,
                  focusNode: _panCardNoFocus,
                  nextFocus: _accountNumberFocus,
                  inputType: TextInputType.text,
                  capitalization: TextCapitalization.words,
                  showTitle: true,
                ),

                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Text(
                  'Financial Details'.tr,
                  style: robotoRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_DEFAULT),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                CustomTextField(
                  hintText: 'Bank Account Number'.tr,
                  controller: _accountNumberController,
                  focusNode: _accountNumberFocus,
                  nextFocus: _accountHolderNameFocus,
                  inputType: TextInputType.number,
                  capitalization: TextCapitalization.words,
                  showTitle: true,
                ),

                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                CustomTextField(
                  hintText: 'Account Holder Name'.tr,
                  controller: _accountHolderNameController,
                  focusNode: _accountHolderNameFocus,
                  nextFocus: _bankNameFocus,
                  inputType: TextInputType.text,
                  capitalization: TextCapitalization.words,
                  showTitle: true,
                ),

                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                CustomTextField(
                  hintText: 'Bank Name'.tr,
                  controller: _bankNameController,
                  focusNode: _bankNameFocus,
                  nextFocus: _branchNameFocus,
                  inputType: TextInputType.text,
                  capitalization: TextCapitalization.words,
                  showTitle: true,
                ),

                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                CustomTextField(
                  hintText: 'Branch Name'.tr,
                  controller: _branchNameController,
                  focusNode: _branchNameFocus,
                  nextFocus: _ifscCodeFocus,
                  inputType: TextInputType.text,
                  capitalization: TextCapitalization.words,
                  showTitle: true,
                ),

                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                CustomTextField(
                  hintText: 'IFSC Code'.tr,
                  controller: _ifscCodeController,
                  focusNode: _ifscCodeFocus,
                  nextFocus: _minTimeFocus,
                  inputType: TextInputType.text,
                  capitalization: TextCapitalization.words,
                  showTitle: true,
                ),

                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Text(
                  'Minimum & Maximum Delivery Timing'.tr,
                  style: robotoRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_DEFAULT),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                // CustomTextField(
                //   hintText: 'vat_tax'.tr,
                //   controller: _vatController,
                //   focusNode: _vatFocus,
                //   nextFocus: _minTimeFocus,
                //   inputType: TextInputType.number,
                //   isAmount: true,
                //   showTitle: true,
                // ),
                // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                Row(children: [
                  Expanded(
                      child: CustomTextField(
                    hintText: 'minimum_delivery_time'.tr,
                    controller: _minTimeController,
                    focusNode: _minTimeFocus,
                    nextFocus: _maxTimeFocus,
                    inputType: TextInputType.number,
                    isNumber: true,
                    showTitle: true,
                  )),
                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                  Expanded(
                      child: CustomTextField(
                    hintText: 'maximum_delivery_time'.tr,
                    controller: _maxTimeController,
                    focusNode: _maxTimeFocus,
                    inputType: TextInputType.number,
                    isNumber: true,
                    inputAction: TextInputAction.done,
                    showTitle: true,
                  )),
                ]),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'delivery_time_type'.tr,
                              style: robotoRegular.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.PADDING_SIZE_SMALL),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.RADIUS_SMALL),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors
                                          .grey[Get.isDarkMode ? 800 : 200],
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 5))
                                ],
                              ),
                              child: DropdownButton<String>(
                                value: authController.deliveryTimeTypeList[
                                    authController.deliveryTimeTypeIndex],
                                items: authController.deliveryTimeTypeList
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value.tr),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  authController.setDeliveryTimeTypeIndex(
                                      value, true);
                                },
                                isExpanded: true,
                                underline: SizedBox(),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                Text(
                  'logo'.tr,
                  style: robotoRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_DEFAULT),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                Align(
                    alignment: Alignment.center,
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.RADIUS_SMALL),
                        child: authController.pickedLogo != null
                            ? GetPlatform.isWeb
                                ? Image.network(
                                    authController.pickedLogo.path,
                                    width: 150,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(authController.pickedLogo.path),
                                    width: 150,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  )
                            : Image.asset(
                                Images.placeholder,
                                width: 150,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        top: 0,
                        left: 0,
                        child: InkWell(
                          onTap: () => authController.pickImageForReg(
                              true, false, false),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(
                                  Dimensions.RADIUS_SMALL),
                              border: Border.all(
                                  width: 1,
                                  color: Theme.of(context).primaryColor),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                shape: BoxShape.circle,
                              ),
                              child:
                                  Icon(Icons.camera_alt, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ])),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                Text(
                  'cover_photo'.tr,
                  style: robotoRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_DEFAULT),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                Stack(children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_SMALL),
                    child: authController.pickedCover != null
                        ? GetPlatform.isWeb
                            ? Image.network(
                                authController.pickedCover.path,
                                width: context.width,
                                height: 170,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(authController.pickedCover.path),
                                width: context.width,
                                height: 170,
                                fit: BoxFit.cover,
                              )
                        : Image.asset(
                            Images.placeholder,
                            width: context.width,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    top: 0,
                    left: 0,
                    child: InkWell(
                      onTap: () =>
                          authController.pickImageForReg(false, true, false),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.circular(Dimensions.RADIUS_SMALL),
                          border: Border.all(
                              width: 1, color: Theme.of(context).primaryColor),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.white),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.camera_alt,
                              color: Colors.white, size: 50),
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                authController.zoneList != null
                    ? SelectLocationView(fromView: true)
                    : Center(child: CircularProgressIndicator()),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                authController.moduleList != null
                    ? ModuleViewWidget()
                    : SizedBox(),
                SizedBox(
                    height: authController.moduleList != null
                        ? Dimensions.PADDING_SIZE_LARGE
                        : 0),
                Visibility(
                  visible: authController.selectedModuleIndex == 2,
                  child: CustomTextField(
                    hintText: 'Pharmacy License Number'.tr,
                    controller: _pharmacyLicenseController,
                    focusNode: _licenseFocus,
                    nextFocus: _fNameFocus,
                    inputType: TextInputType.text,
                    capitalization: TextCapitalization.words,
                    showTitle: true,
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Center(
                    child: Text(
                  'owner_information'.tr,
                  style: robotoMedium.copyWith(
                      fontSize: Dimensions.FONT_SIZE_DEFAULT),
                )),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                Row(children: [
                  Expanded(
                      child: CustomTextField(
                    hintText: 'first_name'.tr,
                    controller: _fNameController,
                    focusNode: _fNameFocus,
                    nextFocus: _lNameFocus,
                    inputType: TextInputType.name,
                    capitalization: TextCapitalization.words,
                    showTitle: true,
                  )),
                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                  Expanded(
                      child: CustomTextField(
                    hintText: 'last_name'.tr,
                    controller: _lNameController,
                    focusNode: _lNameFocus,
                    nextFocus: _phoneFocus,
                    inputType: TextInputType.name,
                    capitalization: TextCapitalization.words,
                    showTitle: true,
                  )),
                ]),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                CustomTextField(
                  hintText: 'phone'.tr,
                  controller: _phoneController,
                  focusNode: _phoneFocus,
                  nextFocus: _emailFocus,
                  inputType: TextInputType.phone,
                  showTitle: true,
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                     CustomTextField(
                  hintText: 'Company Name'.tr,
                  controller: _companyName,
                  focusNode: _phoneFocus,
                  nextFocus: _emailFocus,
                  inputType: TextInputType.text,
                  showTitle: true,
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                Center(
                    child: Text(
                  'login_information'.tr,
                  style: robotoMedium.copyWith(
                      fontSize: Dimensions.FONT_SIZE_DEFAULT),
                )),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                CustomTextField(
                  hintText: 'email'.tr,
                  controller: _emailController,
                  focusNode: _emailFocus,
                  // nextFocus: _passwordFocus,
                  inputType: TextInputType.emailAddress,
                  showTitle: true,
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                // Row(children: [
                //   Expanded(child: CustomTextField(
                //     hintText: 'password'.tr,
                //     controller: _passwordController,
                //     focusNode: _passwordFocus,
                //     nextFocus: _confirmPasswordFocus,
                //     inputType: TextInputType.visiblePassword,
                //     isPassword: true,
                //     showTitle: true,
                //   )),
                //   SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                //   Expanded(child: CustomTextField(
                //     hintText: 'confirm_password'.tr,
                //     controller: _confirmPasswordController,
                //     focusNode: _confirmPasswordFocus,
                //     inputType: TextInputType.visiblePassword,
                //     isPassword: true,
                //     showTitle: true,
                //   )),
                // ]),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                Text(
                  'Signature'.tr,
                  style: robotoRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_DEFAULT),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                Stack(children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_SMALL),
                    child: authController.pickedSignature != null
                        ? GetPlatform.isWeb
                            ? Image.network(
                                authController.pickedSignature.path,
                                width: context.width,
                                height: 170,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(authController.pickedSignature.path),
                                width: context.width,
                                height: 170,
                                fit: BoxFit.cover,
                              )
                        : Image.asset(
                            Images.placeholder,
                            width: context.width,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    top: 0,
                    left: 0,
                    child: InkWell(
                      onTap: () =>
                          authController.pickImageForReg(false, false, false),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.circular(Dimensions.RADIUS_SMALL),
                          border: Border.all(
                              width: 1, color: Theme.of(context).primaryColor),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.white),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.camera_alt,
                              color: Colors.white, size: 50),
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                !authController.isLoading
                    ? CustomButton(
                        buttonText: 'submit'.tr,
                        onPressed: () {
                          String _name = _nameController.text.trim();
                          String _address = _addressController.text.trim();
                          // String _vat = _vatController.text.trim();
                          String _minTime = _minTimeController.text.trim();
                          String _maxTime = _maxTimeController.text.trim();
                          String _fName = _fNameController.text.trim();
                          String companyName = _companyName.text.trim();
                          String _lName = _lNameController.text.trim();
                          String _phone = _phoneController.text.trim();
                          String _email = _emailController.text.trim();
                          // String _password = _passwordController.text.trim();
                          // String _confirmPassword = _confirmPasswordController.text.trim();
                          // Extra fields
                          String _gstNumber = _gstNumberController.text.trim();
                          String _pharmacyLicense =
                              _pharmacyLicenseController.text.trim();
                          String _accountNumber =
                              _accountNumberController.text.trim();
                          String _accountHolderName =
                              _accountHolderNameController.text.trim();
                          String _bankName = _bankNameController.text.trim();
                          String _branchName = _bankNameController.text.trim();
                          String _ifscCode = _ifscCodeController.text.trim();
                          String _panCardNo = _panCardNoController.text.trim();
                          if (_name.isEmpty) {
                            showCustomSnackBar('enter_store_name'.tr);
                          } else if (_address.isEmpty) {
                            showCustomSnackBar('enter_store_address'.tr);
                            // }else if(_vat.isEmpty) {
                            //   showCustomSnackBar('enter_vat_amount'.tr);
                          } else if (_minTime.isEmpty) {
                            showCustomSnackBar(
                                'enter_minimum_delivery_time'.tr);
                          } else if (_maxTime.isEmpty) {
                            showCustomSnackBar(
                                'enter_maximum_delivery_time'.tr);
                          } else if (double.parse(_minTime) >
                              double.parse(_maxTime)) {
                            showCustomSnackBar(
                                'maximum_delivery_time_can_not_be_smaller_then_minimum_delivery_time'
                                    .tr);
                          } else if (authController.pickedLogo == null) {
                            showCustomSnackBar('select_store_logo'.tr);
                            // }else if(authController.pickedCover == null) {
                            //   showCustomSnackBar('select_store_cover_photo'.tr);
                          } else if (authController.restaurantLocation ==
                              null) {
                            showCustomSnackBar('set_store_location'.tr);
                          } else if (_fName.isEmpty) {
                            showCustomSnackBar('enter_your_first_name'.tr);
                          } else if (_lName.isEmpty) {
                            showCustomSnackBar('enter_your_last_name'.tr);
                          } else if (_phone.isEmpty) {
                            showCustomSnackBar('enter_phone_number'.tr);
                            // }else if(_email.isEmpty) {
                            //   showCustomSnackBar('enter_email_address'.tr);
                            // }else if(!GetUtils.isEmail(_email)) {
                            //   showCustomSnackBar('enter_a_valid_email_address'.tr);
                            // }else if(_password.isEmpty) {
                            //   showCustomSnackBar('enter_password'.tr);
                            // }else if(_password.length < 6) {
                            //   showCustomSnackBar('password_should_be'.tr);
                            // }else if(_password != _confirmPassword) {
                            //   showCustomSnackBar('confirm_password_does_not_matched'.tr);
                          } else {
                            authController.registerStore(StoreBody(
                                storeName: _name,
                                storeAddress: _address,
                                // tax: _vat,
                                companyName: companyName,
                                isGstAvalable:  _isShow?'yes':'no',
                                minDeliveryTime: _minTime,
                                maxDeliveryTime: _maxTime,
                                lat: authController.restaurantLocation.latitude
                                    .toString(),
                                email: _email,
                                lng: authController.restaurantLocation.longitude
                                    .toString(),
                                fName: _fName,
                                lName: _lName,
                                phone: _phone,

                                // password: _password,
                                zoneId: authController
                                    .zoneList[authController.selectedZoneIndex]
                                    .id
                                    .toString(),
                                moduleId: authController
                                    .moduleList[
                                        authController.selectedModuleIndex]
                                    .id
                                    .toString(),
                                deliveryTimeType:
                                    authController.deliveryTimeTypeList[
                                        authController.deliveryTimeTypeIndex],
                                // Extra fields
                                gstNumber: _gstNumber,
                                pharmacyLicense: _pharmacyLicense,
                                accountNumber: _accountNumber,
                                accountHolderName: _accountHolderName,
                                bankName: _bankName,
                                branchName: _branchName,
                                ifscCode: _ifscCode,
                                panCardNo: _panCardNo));
                          }
                        },
                      )
                    : Center(child: CircularProgressIndicator()),
              ]);
        }),
      ),
    );
  }
}
