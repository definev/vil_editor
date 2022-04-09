import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:gap/gap.dart';
import 'package:highlight/languages/dart.dart';
import 'package:simple_rich_text/simple_rich_text.dart';
import 'package:vil_editor/resources/resources.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(300, 200)),
              child: Image.asset(VilIcons.icon),
            ),
          ),
          Text(
            'VIL Editor',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SimpleRichText(
              '''
_*{color:primary}VIL Editor*_ là một công cụ để chỉnh sửa các tệp _{color:primary}ViL_.
Với _*{color:primary}ViL (Vietlang)*_, bạn tư duy lập trình và code bằng chính cú pháp tiếng Việt.
Phù hợp với người muốn khám phá lập trình mà không cần phải làm quen quá nhiều. 

Cú pháp của _{color:primary}ViL_ tương tự như ngôn ngữ lập trình họ C. Ví dụ: Dart, C++, Java, ...
Vì thế sau khi bạn làm quen lập trình với ViL bạn đã có nền tảng để học các ngôn ngữ lập trình khác.


Được hoàn thiện bằng 💙 Flutter & Dart 🎯


_*/{color:primary;backgroundColor:white}Chương trình "Hello World" trong ViL:/*_
          ''',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(width: 600, height: 58),
              child: CodeField(
                enabled: false,
                controller: CodeController(
                  language: dart,
                  text: 'tạo xin_chào = "Xin chào Việt Nam!!";\nin xin_chào;',
                  theme: monokaiSublimeTheme,
                ),
              ),
            ),
          ),
          const Gap(40),
        ],
      ),
    );
  }
}
