import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final HomeController homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => homeC.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: homeC.openseaModel?.nfts.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      homeC.openseaModel?.nfts[index].name ?? 'no name',
                    ),
                    subtitle: Text(
                      homeC.openseaModel?.nfts[index].description ??
                          'no description',
                    ),
                    leading: homeC.openseaModel?.nfts[index].imageUrl == null
                        ? const Icon(Icons.image)
                        : Image.network(
                            homeC.openseaModel!.nfts[index].imageUrl!,
                          ),
                  );
                }),
      ),
    );
  }
}
