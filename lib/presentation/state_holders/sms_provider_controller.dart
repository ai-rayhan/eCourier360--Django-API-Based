import 'package:e_courier_360/core/network_caller/request_methods/dynamic_put_request.dart';
import 'package:e_courier_360/core/network_caller/request_methods/get_request.dart';
import 'package:e_courier_360/core/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/models/sms_provider_model.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/global_loading.dart';
import 'package:get/get.dart';

class SmsProviderController extends GetxController {
  final SmsProviderRepository _repository = SmsProviderRepository();

  List<SmsProvider> _smsProviders = [];
  List<SmsProvider> get smsProviders => _smsProviders;
 getSMSProvider() async {
    showloading('Loading..');
    try {
      _smsProviders = await _repository.fetchSmsProviders();
      update();
      showSuccess("Success");
      return true;
    } catch (error) {
      showError(error.toString());
      return false;
    }
  }

  Future<bool> updateSMSProvider(Map<String,String> data, int id) async {
    showloading('Loading..');
    final success = await _repository.updateSmsProvider(data, id);
    if (success) {
      await getSMSProvider();
      showSuccess("Done");
      return true;
    } else {
      showError("Failed to update SMS provider");
      return false;
    }
  }
}


class SmsProviderRepository {
  Future<List<SmsProvider>> fetchSmsProviders() async {
    final NetworkCallerReturnObject response = await GetRequest.execute(Urls.smsProvider);
    if (response.success) {
      return (response.returnValue as List<dynamic>)
          .map((json) => SmsProvider.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load SMS providers: ${response.errorMessage}');
    }
  }

  Future<bool> updateSmsProvider(Map<String, dynamic> data, int id) async {
    final NetworkCallerReturnObject response = await DynamicPutRequest.execute(
      "${Urls.smsProvider}/$id/",
      token: AuthController.token,
      data,
    );
    return response.success;
  }
}
