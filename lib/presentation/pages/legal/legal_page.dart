import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/presentation/pages/global_views/app_bar.dart';

class LegalPage extends GetView {
  final String title;
  final String content;

  const LegalPage({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      body: SafeArea(
        minimum: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Text(title, style: AppTextStyles.bigTitle,),
            const SizedBox(height: 10,),
            Text(content, style: AppTextStyles.body,),
          ],
        )
      )
    );
  }
}


