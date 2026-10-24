import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// NFR-19: the same set of text keys in all three languages, no empty value.
void main() {
  Map<String, dynamic> load(String lang) =>
      jsonDecode(File('lib/l10n/app_$lang.arb').readAsStringSync())
          as Map<String, dynamic>;

  Set<String> keys(Map<String, dynamic> arb) =>
      arb.keys.where((k) => !k.startsWith('@')).toSet();

  final en = load('en'), ru = load('ru'), kk = load('kk');

  test('Kazakh, Russian and English have the same keys', () {
    expect(keys(ru), keys(en));
    expect(keys(kk), keys(en));
  });

  test('no empty values', () {
    for (final arb in [en, ru, kk]) {
      for (final k in keys(arb)) {
        expect((arb[k] as String).trim(), isNotEmpty, reason: k);
      }
    }
  });
}
