class Language {
  final int id;
  final String name;
  // final String flag;
  final languageCode;

  Language(this.id, this.name, this.languageCode);

  static List<Language> languageList () {
    return <Language>[
      Language(1,   'English', 'en'),
      Language(2,  'فارسى', 'fa'),
      Language(3,  'العربيه', 'ar'),
      Language(4,  '	Hindi', 'hi'),
    ];
  }
}