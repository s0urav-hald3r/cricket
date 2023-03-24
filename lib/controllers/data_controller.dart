import 'package:cricket/config/app_constants.dart';
import 'package:cricket/models/match_details.dart';
import 'package:cricket/models/pick_players.dart';
import 'package:get/get.dart';

import '../service/exception.dart';
import '../service/services.dart';

class DataController extends GetxController {
  final RxBool _isLoading = false.obs;
  final ApiProvider _apiProvider = ApiProvider();
  Rx<MatchDetails?> matchDetails = MatchDetails().obs;
  Rx<PickPlayers?> pickPlayers = PickPlayers().obs;

  fetchMatchDetails() async {
    _isLoading.value = true;
    try {
      dynamic response =
          await _apiProvider.get(AppConstants.fetchMatchDetailsAPI);
      if (response != null) {
        matchDetails.value = MatchDetails.fromJson(response);
      }
    } catch (e) {
      if (e is CustomException) {
        Get.snackbar(
          "Error",
          e.getMessage(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
    _isLoading.value = false;
  }

  fetchPickPlayersDetails(String matchKey) async {
    _isLoading.value = true;
    try {
      dynamic response = await _apiProvider.get(
          'https://rest.cricketapi.com/rest/v3/fantasy-match-credits/$matchKey/?access_token=${AppConstants.accessToken}');
      if (response != null) {
        print(response);
        pickPlayers.value = PickPlayers.fromJson(response);
      }
    } catch (e) {
      if (e is CustomException) {
        Get.snackbar(
          "Error",
          e.getMessage(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
    _isLoading.value = false;
  }

  bool get isLoading => _isLoading.value;
}
