import 'package:chatgpt/domain/chat/chat_body.dart';
import 'package:chatgpt/domain/chat/model/message.dart';
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
        mainAxisAlignment: mainEnd,
        children: [
          Expanded(
            child: ListView.builder(
              //reverse: true,
              itemCount: state.messages.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: mainEnd,
                  children: [
                    Padding(
                      padding: padding20,
                      child: Row(
                        mainAxisAlignment: state.messages[index].role == 'user'
                            ? mainEnd
                            : mainStart,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: state.messages[index].role == 'user'
                                  ? context.color.primary.withOpacity(0.8)
                                  : context.color.onPrimary,
                              borderRadius: radius10,
                            ),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 0.7.sw),
                              child: SelectableText(
                                state.messages[index].content.trim(),
                                style: state.messages[index].role == 'user'
                                    ? CustomStyle
                                        .customStyleInstance.senderTextStyle
                                    : CustomStyle
                                        .customStyleInstance.gptTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // Padding(
          //   padding: paddingH20,
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: TextField(
          //           controller: sendMessageController,
          //           decoration: const InputDecoration(
          //             hintText: 'Enter a message',
          //           ),
          //         ),
          //       ),
          //       IconButton(
          //         onPressed: () {
          //           ref.read(homeProvider.notifier).addToList(
          //                 'assistant',
          //                 sendMessageController.text,
          //               );
          //           sendMessageController.clear();
          //         },
          //         icon: const Icon(Icons.send),
          //       ),
          //     ],
          //   ),
          // ),

          Material(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: sendMessageController,
                      onSubmitted: (value) async {},
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: KStrings.howCanIHelp,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(homeProvider.notifier).addToList(
                            'user',
                            sendMessageController.text,
                          );
                      ref.read(homeProvider.notifier).getChatResponse(
                            ChatBody(
                              model: selectedModel.value,
                              messages: [
                                Message(
                                  role: KStrings.user,
                                  content: sendMessageController.text,
                                ),
                              ],
                              temperature: 0.7,
                            ),
                          );

                      sendMessageController.clear();
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
