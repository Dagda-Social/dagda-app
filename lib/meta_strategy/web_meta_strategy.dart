import 'dart:html';
import 'dart:ui';

void configMeta(Locale locale) {
  MetaElement langMeta = MetaElement();
  langMeta.content = locale.languageCode.toString();
  langMeta.name = 'lang';
  document.head!.append(langMeta);
}