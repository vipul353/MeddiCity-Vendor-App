import 'package:phone_number/phone_number.dart';
import 'package:sixam_mart_store/controller/auth_controller.dart';
import 'package:sixam_mart_store/controller/localization_controller.dart';
import 'package:sixam_mart_store/controller/splash_controller.dart';
import 'package:sixam_mart_store/helper/route_helper.dart';
import 'package:sixam_mart_store/util/app_constants.dart';
import 'package:sixam_mart_store/util/dimensions.dart';
import 'package:sixam_mart_store/util/images.dart';
import 'package:sixam_mart_store/util/styles.dart';
import 'package:sixam_mart_store/view/base/custom_button.dart';
import 'package:sixam_mart_store/view/base/custom_snackbar.dart';
import 'package:sixam_mart_store/view/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:sixam_mart_store/view/screens/deliveryman/widget/code_picker_widget.dart';
import 'package:sixam_mart_store/view/screens/forget/verification_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _countryDialCode;

  @override
  void initState() {
    super.initState();
    // _emailController.text = Get.find<AuthController>().getUserNumber() ?? '';
    // _passwordController.text = Get.find<AuthController>().getUserPassword() ?? '';


    _countryDialCode =
    Get.find<AuthController>().getUserCountryCode().isNotEmpty
        ? Get.find<AuthController>().getUserCountryCode()
        : CountryCode.fromCountryCode(
        Get.find<SplashController>().configModel.country)
        .dialCode;
    _phoneController.text = Get.find<AuthController>().getUserNumber() ?? '';


    if (Get.find<AuthController>().getUserType() == 'employee') {
      Get.find<AuthController>().changeVendorType(1, isUpdate: false);
    } else {
      Get.find<AuthController>().changeVendorType(0, isUpdate: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: Center(
              child: SizedBox(
                width: 1170,
                child: GetBuilder<AuthController>(builder: (authController) {
                  return Column(children: [
                    Image.asset(Images.logo, width: 200),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Center(
                        child: Text(AppConstants.APP_NAME,
                            style: robotoMedium.copyWith(
                                fontSize: 30, color: Color(0xFF2bc1a4),))),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                    Text('sign_in'.tr.toUpperCase(),
                        style: robotoBold.copyWith(
                            fontSize: Dimensions.FONT_SIZE_OVER_LARGE)),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                    // Text(
                    //   Get.find<SplashController>().configModel.moduleConfig.module.showRestaurantText
                    //       ? 'only_for_restaurant_owner'.tr : 'only_for_store_owner'.tr,
                    //   textAlign: TextAlign.center,
                    //   style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL, color: Theme.of(context).primaryColor),
                    // ),
                    SizedBox(height: 30),

                    Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Row(children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => authController.changeVendorType(0),
                            child: Column(children: [
                              Expanded(
                                child: Center(
                                    child: Text(
                                  'store_owner'.tr,
                                  style: robotoMedium.copyWith(
                                      color: authController.vendorTypeIndex == 0
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .color
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .color
                                              .withOpacity(0.3)),
                                )),
                              ),
                              Container(
                                height: 2,
                                color: authController.vendorTypeIndex == 0
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ]),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => authController.changeVendorType(1),
                            child: Column(children: [
                              Expanded(
                                child: Center(
                                    child: Text(
                                  'store_employee'.tr,
                                  style: robotoMedium.copyWith(
                                      color: authController.vendorTypeIndex == 1
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .color
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .color
                                              .withOpacity(0.3)),
                                )),
                              ),
                              Container(
                                height: 2,
                                color: authController.vendorTypeIndex == 1
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ]),
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(height: 30),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_SMALL),
                        color: Theme.of(context).cardColor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[Get.isDarkMode ? 800 : 200],
                              spreadRadius: 1,
                              blurRadius: 5)
                        ],
                      ),
                      child: Column(children: [
                        Row(children: [
                          CodePickerWidget(
                            onChanged: (CountryCode countryCode) {
                              _countryDialCode = countryCode.dialCode;
                            },
                            initialSelection: _countryDialCode != null
                                ? CountryCode.fromCountryCode(
                                Get.find<SplashController>()
                                    .configModel
                                    .country)
                                .code
                                : Get.find<LocalizationController>()
                                .locale
                                .countryCode,
                            favorite: [
                              CountryCode.fromCountryCode(
                                  Get.find<SplashController>()
                                      .configModel
                                      .country)
                                  .code
                            ],
                            showDropDownButton: true,
                            padding: EdgeInsets.zero,
                            showFlagMain: true,
                            flagWidth: 30,
                            dialogBackgroundColor:
                            Theme.of(context).cardColor,
                            textStyle: robotoRegular.copyWith(
                              fontSize: Dimensions.fontSizeLarge,
                              color:
                              Theme.of(context).textTheme.bodyText1.color,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: CustomTextField(
                                hintText: 'phone'.tr,
                                controller: _phoneController,
                                focusNode: _phoneFocus,
                                nextFocus: _passwordFocus,
                                inputType: TextInputType.phone,
                                divider: false,
                              )),
                        ]),
                        // Padding(
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: Dimensions.PADDING_SIZE_LARGE),
                        //     child: Divider(height: 1)),

                      ]),
                    ),
                    SizedBox(height: 10),

                    Row(children: [
                      Expanded(
                        child: ListTile(
                          onTap: () => authController.toggleRememberMe(),
                          leading: Checkbox(
                            activeColor: Theme.of(context).primaryColor,
                            value: authController.isActiveRememberMe,
                            onChanged: (bool isChecked) =>
                                authController.toggleRememberMe(),
                          ),
                          title: Text('remember_me'.tr),
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          horizontalTitleGap: 0,
                        ),
                      ),
                      authController.vendorTypeIndex == 1
                          ? SizedBox()
                          : TextButton(
                              onPressed: () =>
                                  Get.toNamed(RouteHelper.getForgotPassRoute()),
                              child: Text('${'forgot_password'.tr}?'),
                            ),
                    ]),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                    // Row(children: [
                    //
                    //   Expanded(
                    //     child: RadioListTile(
                    //       value: authController.vendorTypeIndex,
                    //       groupValue: authController.vendorTypeIndex,
                    //       title: Text('Store Owner'),
                    //       onChanged: (value){
                    //         authController.changeVendorType(0);
                    //       },
                    //     ),
                    //   ),
                    //
                    //   Expanded(
                    //     child: RadioListTile(
                    //       value: authController.vendorTypeIndex,
                    //       groupValue: authController.vendorTypeIndex,
                    //       title: Text('Store Employee'),
                    //       onChanged: (value){
                    //         authController.changeVendorType(1);
                    //       },
                    //     ),
                    //   ),
                    //   // Expanded(
                    //   //   child: ListTile(
                    //   //     onTap: () => authController.toggleRememberMe(),
                    //   //     leading: ToggleButtons(children: , isSelected: (){})
                    //   //     title: Text('remember_me'.tr),
                    //   //     contentPadding: EdgeInsets.zero,
                    //   //     dense: true,
                    //   //     horizontalTitleGap: 0,
                    //   //   ),
                    //   // ),
                    //   // TextButton(
                    //   //   onPressed: () => Get.toNamed(RouteHelper.getForgotPassRoute()),
                    //   //   child: Text('${'forgot_password'.tr}?'),
                    //   // ),
                    // ]),
                    // SizedBox(height: 50),

                    !authController.isLoading
                        ? CustomButton(
                            buttonText: 'sign_in'.tr,
                            onPressed: () => _login(authController,_countryDialCode),
                          )
                        : Center(child: CircularProgressIndicator()),
                    SizedBox(
                        height: Get.find<SplashController>()
                                .configModel
                                .toggleStoreRegistration
                            ? Dimensions.PADDING_SIZE_SMALL
                            : 0),

                    Get.find<SplashController>()
                            .configModel
                            .toggleStoreRegistration
                        ? TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size(1, 40),
                            ),
                            onPressed: () async {
                              // if(await canLaunchUrlString('${AppConstants.BASE_URL}/store/apply')) {
                              //   launchUrlString('${AppConstants.BASE_URL}/store/apply', mode: LaunchMode.externalApplication);
                              // }
                              Get.toNamed(
                                  RouteHelper.getRestaurantRegistrationRoute());
                            },
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: '${'join_as'.tr} ',
                                  style: robotoRegular.copyWith(
                                      color: Theme.of(context).disabledColor)),
                              TextSpan(
                                text: Get.find<SplashController>()
                                        .configModel
                                        .moduleConfig
                                        .module
                                        .showRestaurantText
                                    ? 'restaurant'.tr
                                    : 'store'.tr,
                                style: robotoMedium.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color),
                              ),
                            ])),
                          )
                        : SizedBox(),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Text('Made in 🇮🇳 With ❤',
                    //       style: robotoBold.copyWith(fontSize: 18)),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Text('Powered by : ASCITHUB - LKO',
                    //       style: robotoBold.copyWith(
                    //         fontSize: 18,
                    //         color: Color(0xFF2bc1a4),
                    //       )),
                    // )
                  ]);
                }),
              ),
            ),
          ),
        ),
      )),
    );
  }

  void _login(AuthController authController,String countryDialCode) async {
    String _phone = _phoneController.text.trim();
    String _numberWithCountryCode = countryDialCode + _phone;
    String _email = _emailController.text.trim();
    String _password = _passwordController.text.trim();
    String _type = authController.vendorTypeIndex == 0 ? 'owner' : 'employee';
    bool _isValid = GetPlatform.isWeb ? true : false;

    if (!GetPlatform.isWeb) {
      try {
        PhoneNumber phoneNumber =
        await PhoneNumberUtil().parse(_numberWithCountryCode);
        _numberWithCountryCode =
            '+' + phoneNumber.countryCode + phoneNumber.nationalNumber;
        _isValid = true;
      } catch (e) {}
    }


    if (_phone.isEmpty) {
      showCustomSnackBar('enter_phone_number'.tr);
    } else if (!_isValid) {
      showCustomSnackBar('invalid_phone_number'.tr);

    } else {
      authController.login1(_numberWithCountryCode, _type).then((status) async {
        if (status.isSuccess) {
          if (authController.isActiveRememberMe) {
            authController.saveUserNumberAndPassword(_email, _password, _type);
          } else {
            authController.clearUserNumberAndPassword();
          }


         Get.toNamed(RouteHelper.getVerificationRoute(_numberWithCountryCode,RouteHelper.signIn,_type));
        //  Get.toNamed(RouteHelper.getVerificationRoute(_email,""));

        } else {
          showCustomSnackBar(status.message);
        }
      });
    }


  }
}
