import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en', 'es', 'pt', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? frText = '',
    String? enText = '',
    String? esText = '',
    String? ptText = '',
    String? arText = '',
  }) =>
      [frText, enText, esText, ptText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // homePage
  {
    'ajioo7g4': {
      'fr': 'QuizzMaster',
      'ar': 'ممتحن',
      'en': 'QuizMaster',
      'es': 'Presentador de un concurso',
      'pt': 'Mestre do Quiz',
    },
    'rflfw81k': {
      'fr': 'Testez vos connaissances !',
      'ar': 'اختبر معلوماتك!',
      'en': 'Test your knowledge!',
      'es': '¡Pon a prueba tus conocimientos!',
      'pt': 'Teste seus conhecimentos!',
    },
    'xtbqjuqw': {
      'fr': 'Avec des séries de 10 questions sur le domaine de votre choix',
      'ar': 'مع سلسلة من 10 أسئلة في مجال اختيارك',
      'en': 'With series of 10 questions on the field of your choice',
      'es': 'Con una serie de 10 preguntas sobre el campo de tu elección',
      'pt': 'Com uma série de 10 questões sobre o campo de sua escolha',
    },
    'tzictkf3': {
      'fr': 'Quiz du Jour',
      'ar': 'اختبار اليوم',
      'en': 'Quiz of the Day',
      'es': 'Cuestionario del día',
      'pt': 'Quiz do dia',
    },
    'ycgc89bw': {
      'fr': '10 questions, \n1 domaine aléatoire chaque jour !',
      'ar': '10 أسئلة\n1 مجال عشوائي كل يوم!',
      'en': '10 questions, \n1 random domain every day!',
      'es': '10 preguntas,\n¡Un dominio aleatorio cada día!',
      'pt': '10 perguntas,\n1 domínio aleatório todo dia!',
    },
    'ztmfytso': {
      'fr': 'Commencer',
      'ar': 'للبدء',
      'en': 'To start',
      'es': 'Para empezar',
      'pt': 'Para começar',
    },
    'ysn3vt31': {
      'fr': 'Catégories',
      'ar': 'فئات',
      'en': 'Categories',
      'es': 'Categorías',
      'pt': 'Categorias',
    },
  },
  // categoryPage
  {
    'koprlvem': {
      'fr': 'Sous-catégories',
      'ar': 'الفئات الفرعية',
      'en': 'Subcategories',
      'es': 'Subcategorías',
      'pt': 'Subcategorias',
    },
    '90iyjx19': {
      'fr': 'Antiquité',
      'ar': 'العصور القديمة',
      'en': 'Antiquity',
      'es': 'Antigüedad',
      'pt': 'Antiguidade',
    },
    '17469rmi': {
      'fr': '45 questions',
      'ar': '45 سؤال',
      'en': '45 questions',
      'es': '45 preguntas',
      'pt': '45 perguntas',
    },
    '4p6t98fg': {
      'fr': 'Guerres Mondiales',
      'ar': 'الحروب العالمية',
      'en': 'World Wars',
      'es': 'Guerras mundiales',
      'pt': 'Guerras Mundiais',
    },
    '0410wvhr': {
      'fr': '35 questions',
      'ar': '35 سؤال',
      'en': '35 questions',
      'es': '35 preguntas',
      'pt': '35 perguntas',
    },
    'nkmetubq': {
      'fr': 'Renaissance',
      'ar': 'نهضة',
      'en': 'Renaissance',
      'es': 'Renacimiento',
      'pt': 'Renascimento',
    },
    '5odz2oqb': {
      'fr': '25 questions',
      'ar': '25 سؤال',
      'en': '25 questions',
      'es': '25 preguntas',
      'pt': '25 perguntas',
    },
  },
  // dailyseriesPage
  {
    'u2pr21wo': {
      'fr': 'Question ',
      'ar': 'سؤال',
      'en': 'Question',
      'es': 'Pregunta',
      'pt': 'Pergunta',
    },
    'vo03gzhi': {
      'fr': ' / 10',
      'ar': '/ 10',
      'en': '/ 10',
      'es': '/ 10',
      'pt': '/ 10',
    },
    'g7uvitgf': {
      'fr': 'Choisissez la bonne réponse parmi les options suivantes :',
      'ar': 'اختر الإجابة الصحيحة من الخيارات التالية:',
      'en': 'Choose the correct answer from the following options:',
      'es': 'Elija la respuesta correcta entre las siguientes opciones:',
      'pt': 'Escolha a resposta correta entre as seguintes opções:',
    },
    '69cq75n1': {
      'fr': 'La bonne réponse est : ',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    's8oq5get': {
      'fr': 'Question suivante',
      'ar': 'السؤال التالي',
      'en': 'Next question',
      'es': 'Siguiente pregunta',
      'pt': 'Próxima pergunta',
    },
    'f0tizuyw': {
      'fr': 'Passer aux résultats',
      'ar': 'الانتقال إلى النتائج',
      'en': 'Jump to results',
      'es': 'Saltar a los resultados',
      'pt': 'Ir para os resultados',
    },
  },
  // seriesPage
  {
    'i511mo31': {
      'fr': 'Question ',
      'ar': 'سؤال',
      'en': 'Question',
      'es': 'Pregunta',
      'pt': 'Pergunta',
    },
    '4febzx6j': {
      'fr': ' / 10',
      'ar': '/ 10',
      'en': '/ 10',
      'es': '/ 10',
      'pt': '/ 10',
    },
    'x7ke80ts': {
      'fr': 'Choisissez la bonne réponse parmi les options suivantes :',
      'ar': 'اختر الإجابة الصحيحة من الخيارات التالية:',
      'en': 'Choose the correct answer from the following options:',
      'es': 'Elija la respuesta correcta entre las siguientes opciones:',
      'pt': 'Escolha a resposta correta entre as seguintes opções:',
    },
    'sd96hje7': {
      'fr': 'Melbourne',
      'ar': 'ملبورن',
      'en': 'Melbourne',
      'es': 'Melbourne',
      'pt': 'Melbourne',
    },
    '9tqkeug3': {
      'fr': 'Canberra',
      'ar': 'كانبيرا',
      'en': 'Canberra',
      'es': 'Canberra',
      'pt': 'Canberra',
    },
    'an5xe9la': {
      'fr': 'Brisbane',
      'ar': 'بريسبان',
      'en': 'Brisbane',
      'es': 'Brisbane',
      'pt': 'Brisbane',
    },
    'xrp5wp2l': {
      'fr': 'La bonne réponse est : ',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'onnqky0o': {
      'fr': 'Question suivante',
      'ar': 'السؤال التالي',
      'en': 'Next question',
      'es': 'Siguiente pregunta',
      'pt': 'Próxima pergunta',
    },
    'efc8ld29': {
      'fr': 'Passer aux résultats',
      'ar': 'الانتقال إلى النتائج',
      'en': 'Jump to results',
      'es': 'Saltar a los resultados',
      'pt': 'Ir para os resultados',
    },
  },
  // resultsPage
  {
    'ay3v5907': {
      'fr': 'Quizz terminé',
      'ar': 'تم الانتهاء من الاختبار',
      'en': 'Quiz finished',
      'es': 'Cuestionario terminado',
      'pt': 'Quiz concluído',
    },
    '78zrzji5': {
      'fr': 'Score',
      'ar': 'نتيجة',
      'en': 'Score',
      'es': 'Puntaje',
      'pt': 'Pontuação',
    },
    'fty1ereh': {
      'fr': ' / 10',
      'ar': '/ 10',
      'en': '/ 10',
      'es': '/ 10',
      'pt': '/ 10',
    },
    'urpbi982': {
      'fr':
          'Vous avez terminé le quizz ! Vous pouvez découvrir de nouvelles catégories ou tester vos connaissances dans ce domaine avec une nouvelle série.',
      'ar':
          'لقد أكملت الاختبار! يمكنك اكتشاف فئات جديدة أو اختبار معرفتك في هذا المجال مع سلسلة جديدة.',
      'en':
          'You have completed the quiz! You can discover new categories or test your knowledge in this area with a new series.',
      'es':
          '¡Has completado el cuestionario! Podrás descubrir nuevas categorías o poner a prueba tus conocimientos en este ámbito con una nueva serie.',
      'pt':
          'Você concluiu o teste! Você pode descobrir novas categorias ou testar seus conhecimentos nesta área com uma nova série.',
    },
    'cjkqubff': {
      'fr': 'Retour à l\'accueil',
      'ar': 'العودة إلى المنزل',
      'en': 'Back to home',
      'es': 'De vuelta a casa',
      'pt': 'De volta para casa',
    },
    '39407z05': {
      'fr': 'Partager mon score',
      'ar': 'شارك نتيجتي',
      'en': 'Share my score',
      'es': 'Comparte mi puntuación',
      'pt': 'Compartilhe minha pontuação',
    },
  },
  // notationPage
  {
    '1sog10ae': {
      'fr': 'Notez QuizMaster+ !',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'sw0kj6eh': {
      'fr': 'Votre avis compte',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '7kh8v3fl': {
      'fr': 'Vous aimez jouer ?',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'lkfobh5e': {
      'fr':
          'Votre avis nous aide à améliorer l\'application et permet à d\'autres utilisateurs de la découvrir. Prenez un instant pour lui attribuer une note et écrire un commentaire.',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'q05udo7e': {
      'fr': 'Noter sur l\'App Store',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
  },
  // Miscellaneous
  {
    'y9ve5yq8': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'po81lmvm': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '7vgwhe3p': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'f16lo9ng': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    's3qqddm2': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'z6smfe6n': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'q78uvgwj': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '0rxtrf91': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'mqose7vj': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'znnltzal': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'kfjsryz8': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'e1srb5rb': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'ae9r7fd0': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'rofdhxcm': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'wp3quuh6': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'gmqj2coj': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '1m31rwdh': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'ib5jcol1': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'd85sh84i': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'bgpiybrt': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'fgtasx79': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'ewv2jomb': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'rlpdw9wd': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'ldlswq0i': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'xeqn5bw7': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
