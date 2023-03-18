import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/home/home_provider.dart';
import '../../domain/chat_model/models/model_data.dart';
import '../../utils/utils.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  static const route = '/home-screen';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final selectedModel = useState('gpt-3.5-turbo-0301');
    final sendMessageController = useTextEditingController();
    // List<String> messages = ["My Name is", "I am from", "I am a"];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 20,
              width: 20,
              color: context.color.onPrimary,
            ),
            gap10,
            Text(
              KStrings.appName,
              style: CustomStyle.customStyleInstance.appbarTitleTextStyle,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                builder: (context) => StatefulBuilder(
                  builder: (BuildContext context,
                      void Function(void Function()) setState) {
                    return Container(
                      margin: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: padding20,
                          child: Column(
                            children: [
                              Text(
                                KStrings.selectModel,
                                style: CustomStyle
                                    .customStyleInstance.selectModelTextStyle,
                              ),
                              gap10,
                              OutlinedButton(
                                onPressed: () {},
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: selectedModel.value,
                                    iconSize: 20,
                                    iconEnabledColor: context.color.shadow,
                                    onChanged: (String? newValue) {
                                      setState(() {});
                                      selectedModel.value = newValue!;
                                    },
                                    items: state.modelResponse.data
                                        .map<DropdownMenuItem<String>>(
                                            (ModelData model) {
                                      return DropdownMenuItem<String>(
                                        value: model.id,
                                        child: Text(model.id),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [],
      ),
    );
  }
}
