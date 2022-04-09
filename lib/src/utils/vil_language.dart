import 'package:highlight/highlight.dart';
// ignore: implementation_imports
import 'package:highlight/src/common_modes.dart';

Mode get vil => Mode(
      case_insensitive: false,
      refs: {
        '~contains~0~variants~4~contains~2': Mode(
          className: 'subst',
          variants: [Mode(begin: r'\${', end: '}')],
          keywords: 'đúng sai rỗng self is cha',
          contains: [C_NUMBER_MODE, Mode(ref: '~contains~0')],
        ),
        '~contains~0~variants~4~contains~1': Mode(
          className: 'subst',
          variants: [Mode(begin: r'\$[A-Za-z0-9_]+')],
        ),
        '~contains~0': Mode(
          className: 'string',
          variants: [
            Mode(begin: "r'''", end: "'''"),
            Mode(begin: 'r"""', end: '"""'),
            Mode(begin: "r'", end: "'", illegal: r'\n'),
            Mode(begin: 'r"', end: '"', illegal: r'\n'),
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
              begin: '"""',
              end: '"""',
              contains: [
                BACKSLASH_ESCAPE,
                Mode(ref: '~contains~0~variants~4~contains~1'),
                Mode(ref: '~contains~0~variants~4~contains~2')
              ],
            ),
            Mode(
              begin: "'",
              end: "'",
              illegal: r'\n',
              contains: [
                BACKSLASH_ESCAPE,
                Mode(ref: '~contains~0~variants~4~contains~1'),
                Mode(ref: '~contains~0~variants~4~contains~2')
              ],
            ),
            Mode(
              begin: '"',
              end: '"',
              illegal: r'\n',
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
      lexemes: r'[a-zA-Z\u00C0-\u024F\u1E00-\u1EFF]+',
      contains: [
        Mode(ref: '~contains~0'),
        Mode(
          className: 'comment',
          begin: r'/\*\*',
          end: r'\*/',
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
          begin: r'///+\s*',
          end: r'$',
          contains: [
            Mode(subLanguage: ['markdown'], begin: '.', end: r'$'),
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
          beginKeywords: 'lớp',
          end: '{',
          excludeEnd: true,
          contains: [UNDERSCORE_TITLE_MODE],
        ),
        C_NUMBER_MODE,
        Mode(className: 'meta', begin: '@[A-Za-z]+'),
        Mode(begin: '=>')
      ],
    );
