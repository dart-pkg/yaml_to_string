// ignore_for_file: prefer_single_quotes
import 'package:test/test.dart';
import 'package:output/output.dart';
import 'package:yaml_to_string/yaml_to_string.dart';

final testData = {
  'name': 'Joe',
  'url': null,
  'null string': 'null',
  'ids': [10, 20, 30],
  'desc': 'This is\na multiline\ntext',
  'enabled': true,
};

String toYaml(dynamic x) {
  final yamlWriter = YamlWriter(allowUnquotedStrings: true);
  final yamlDoc = yamlWriter.write(x);
  String yaml1 = yamlDoc.toString();
  return yaml1;
}

main() {
  group('Run', () {
    test('run1', () {
      String yaml = toYaml(testData);
      echo(yaml, r'yaml');
      expect(
        yaml ==
            '''
name: Joe
url:
null string: "null"
ids:
  - 10
  - 20
  - 30
desc: |-
  This is
  a multiline
  text
enabled: true
''',
        isTrue,
      );
    });
  });
}
