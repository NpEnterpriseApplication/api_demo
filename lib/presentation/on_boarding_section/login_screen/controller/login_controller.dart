import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilz/utils.dart';
import '../../../data/index.dart';
import '../../../main_section/bottom_navigation/bottom_navigation_screen.dart';
import '../../../model/response_model/index.dart';
import '../../otp/otp_screen.dart';

class LoginController extends GetxController {
//==============================================================================
// * Properties *
//==============================================================================
  var isLoading = false.obs;
  var isVerify = false.obs;
  RxString selectedValue = 'Login'.obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();
  Rx<LoginWithMobileResponse> loginWithMobilRes = LoginWithMobileResponse().obs;
  Rx<VerifyOtpResponse> verifyOtpRes = VerifyOtpResponse().obs;

//==============================================================================
// * Get Life cycle *
//==============================================================================
  @override
  void onInit() {
    super.onInit();
  }

//==============================================================================
// *Helper *
//==============================================================================

  Future<void> loginWithMobil({required String mobile}) async {
    try {
      isLoading(true);
      var data = {"mobile": mobile};
      await Repo.getInstance().mobileLogIn(data: data).then((res) async {
        appPrint("res${res.toJson()}");
        loginWithMobilRes.value = res;
        Get.to(() => OtpScreen(
              mobile: mobile,
              otp: res.data?.otp,
            ));
        Get.snackbar(
          "Otp",
          res.data?.otp ?? "",
            duration: const Duration(milliseconds:5000)
        );
      }, onError: (error) {
        isLoading(false);
        Get.snackbar("error", error.toString(),);
      });
    } catch (error) {
      isLoading(false);
      Get.snackbar("error", error.toString());
    }
  }

  Future<void> verifyOtp({
    required String mobile,
    required String otp,
  }) async {
    try {
      isLoading(true);
      var data = {"mobile": mobile, "otp": otp};
      await Repo.getInstance().verifyOtp(data: data).then((res) async {
        Get.to(() => const BottomNavigation());
        appPrint("res${res.toJson()}");
        verifyOtpRes.value = res;
      }, onError: (error) {
        isLoading(false);
        Get.snackbar("error", error.toString());
      });
    } catch (error) {
      isLoading(false);
      Get.snackbar("error", error.toString());
    }
  }

  changingSelectedOption(String login) {
    selectedValue.value = login;
  }
}
