import 'dart:html';
import 'dart:ui';

void configMeta(Locale locale) {
  MetaElement langMeta = MetaElement();
  langMeta.name = 'lang';
  langMeta.content = locale.languageCode.toString();
  document.head!.append(langMeta);
}
