// ignore_for_file: lines_longer_than_80_chars, use_raw_strings, unnecessary_string_escapes
// ignore_for_file: implementation_imports
import 'package:highlight/highlight.dart';
import 'package:highlight/src/common_modes.dart';

final vil = Mode(
  refs: {
    '~contains~0~variants~4~contains~2': Mode(
      className: 'subst',
      variants: [Mode(begin: '\\\${', end: '}')],
      keywords: 'true false null this is new super',
      contains: [C_NUMBER_MODE, Mode(ref: '~contains~0')],
    ),
    '~contains~0~variants~4~contains~1':
        Mode(className: 'subst', variants: [Mode(begin: '\\\$[A-Za-z0-9_]+')]),
    '~contains~0': Mode(
      className: 'string',
      variants: [
        Mode(begin: "r'''", end: "'''"),
        Mode(begin: 'r\"\"\"', end: '\"\"\"'),
        Mode(begin: "r'", end: "'", illegal: '\\n'),
        Mode(begin: 'r\"', end: '\"', illegal: '\\n'),
        Mode(
          begin: "'''",
          end: "'''",
          contains: [
            BACKSLASH_ESCAPE,
            Mode(ref: '~contains~0~variants~4~contains~1'),
            Mode(ref: '~contains~0~variants~4~contains~2')
          ],
        ),
        Mode(
          begin: '\"\"\"',
          end: '\"\"\"',
          contains: [
            BACKSLASH_ESCAPE,
            Mode(ref: '~contains~0~variants~4~contains~1'),
            Mode(ref: '~contains~0~variants~4~contains~2')
          ],
        ),
        Mode(
          begin: "'",
          end: "'",
          illegal: '\\n',
          contains: [
            BACKSLASH_ESCAPE,
            Mode(ref: '~contains~0~variants~4~contains~1'),
            Mode(ref: '~contains~0~variants~4~contains~2')
          ],
        ),
        Mode(
          begin: '\"',
          end: '\"',
          illegal: '\\n',
          contains: [
            BACKSLASH_ESCAPE,
            Mode(ref: '~contains~0~variants~4~contains~1'),
            Mode(ref: '~contains~0~variants~4~contains~2')
          ],
        )
      ],
    ),
  },
  keywords: {
    'keyword':
        'in lớp hàm khi lặp tạo nếu hoặc thoát cho self trả đúng sai rỗng cha',
    'built_in': 'clock exit',
  },
  lexemes:
      r'[ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\w]+',
  contains: [
    Mode(ref: '~contains~0'),
    Mode(
      className: 'comment',
      begin: '/\\*\\*',
      end: '\\*/',
      contains: [
        PHRASAL_WORDS_MODE,
        Mode(
          className: 'doctag',
          begin: '(?:TODO|FIXME|NOTE|BUG|XXX):',
          relevance: 0,
        )
      ],
      subLanguage: ['markdown'],
    ),
    Mode(
      className: 'comment',
      begin: '///+\\s*',
      end: '\$',
      contains: [
        Mode(subLanguage: ['markdown'], begin: '.', end: '\$'),
        PHRASAL_WORDS_MODE,
        Mode(
          className: 'doctag',
          begin: '(?:TODO|FIXME|NOTE|BUG|XXX):',
          relevance: 0,
        )
      ],
    ),
    C_LINE_COMMENT_MODE,
    C_BLOCK_COMMENT_MODE,
    Mode(
      className: 'class',
      beginKeywords: 'class interface',
      end: '{',
      excludeEnd: true,
      contains: [
        Mode(beginKeywords: 'extends implements'),
        UNDERSCORE_TITLE_MODE
      ],
    ),
    C_NUMBER_MODE,
    Mode(className: 'meta', begin: '@[A-Za-z]+'),
    Mode(begin: '=>')
  ],
);
