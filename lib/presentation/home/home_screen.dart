import 'package:chatgpt/domain/chat_model/models/model_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/home/home_provider.dart';
import '../../utils/utils.dart';
import '../../widgets/k_app_bar.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  static const route = '/home-screen';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const KAppBar(
        titleText: 'Home',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Home Screen',
              style: context.titleLarge,
            ),
          ),
          DropdownButton<String>(
            value: state.modelResponse.data.first.id,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {},
            items: state.modelResponse.data
                .map<DropdownMenuItem<String>>((ModelData model) {
              return DropdownMenuItem<String>(
                value: model.id,
                child: Text(model.id),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: state.modelResponse.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.modelResponse.data[index].id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
