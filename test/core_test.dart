
import 'package:code_writer/code_writer.dart';
import 'package:test/test.dart';

void main() {
     test('Text Element', () {
      final genCode = Context(
        buffer: StringBuffer(),
        code: Text('Hello, World!'),
      ).generate();

      expect(genCode, "Hello, World!");
    });

    test('Group Element', () {
      final genCode = Context(
        buffer: StringBuffer(),
        code: Group([
          Text('Hello, '),
          Text('World!'),
        ]),
      ).generate();

      expect(genCode, "Hello, World!");
    });

    test('Inherited Element', () {
      Context(
        buffer: StringBuffer(),
        code: Group([
          Text('Hello, World!'),
          CodeBuilder((Context context) {
            expect(context.parent!.code is Group, true);
            final group = context.parent!.code as Group;
            expect(context.parent!.parent == null, true);
            expect(group.elements.length, 2);
            expect(group.elements[0] is Text, true);
            final textElement = group.elements[0] as Text;
            expect(textElement.text, 'Hello, World!');
            return Blank();
          })
        ]),
      ).generate();
    });
}