import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:gap/gap.dart';
import 'package:highlight/languages/dart.dart';
import 'package:simple_rich_text/simple_rich_text.dart';

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
              child: Image.network(
                'https://user-images.githubusercontent.com/62325868/138510986-cdfb34b2-12c4-4b83-947c-32735c6a7478.png',
              ),
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
_*VIL Editor*_ là một công cụ để chỉnh sửa các tệp _ViL_.
Với _ViL_(Vietlang), bạn tư duy lập trình và thực hiện code bằng chính _*tiếng Việt*_.

Cú pháp của _ViL_ tương tự như ngôn ngữ lập trình Dart, C++, Java, ...


Được hoàn thiện bằng Flutter & Dart.


_*/Chương trình "Hello World" trong ViL:/*_
          ''',
              textAlign: TextAlign.center,
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
