// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopop/app/data/models/opensea_model.dart';
import 'package:http/http.dart' as api;

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  OpenseaModel? openseaModel;
  final apiKey = 'feee4a0ae3d54b1eac190f0807878316';

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    const apiUrl = 'https://api.opensea.io/v2/collection/slug/nfts?limit=50';

    try {
      isLoading(true);

      final response =
          await api.get(Uri.parse(apiUrl), headers: {'X-API-KEY': apiKey});

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        openseaModel = OpenseaModel.fromJson(result);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print("Error while getting data");
    } finally {
      isLoading(false);
    }
  }
}
