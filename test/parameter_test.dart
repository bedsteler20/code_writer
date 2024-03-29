import 'package:code_writer/code_writer.dart';
import 'package:test/test.dart';

void main() {
  test('Parameter Element', () {
    final genCode = Context(
      buffer: StringBuffer(),
      code: Parameter(
        type: TypeOf(
          typeName: 'int',
          nullable: false,
          kind: TypeKind.int,
        ),
        identifier: Identifier('value'),
      ),
    ).generate();

    expect(genCode, "int value");
  });

  test('Parameter List Element', () {
    final genCode = Context(
      buffer: StringBuffer(),
      code: ParameterList(
        parameters: [
          Parameter(
            type: TypeOf(
              typeName: 'int',
              nullable: false,
              kind: TypeKind.int,
            ),
            identifier: Identifier('value'),
          ),
          Parameter(
            type: TypeOf(
              typeName: 'String',
              nullable: true,
              kind: TypeKind.string,
            ),
            identifier: Identifier('name'),
          ),
        ],
      ),
    ).generate();

    expect(genCode, "(int value, String? name)");
  });

  test('Optional Parameter Element', () {
    final genCode = Context(
      buffer: StringBuffer(),
      code: OptionalParameter(
        type: TypeOf(
          typeName: 'int',
          nullable: false,
          kind: TypeKind.int,
        ),
        identifier: Identifier('value'),
        defaultValue: Text('0'),
      ),
    ).generate();

    expect(genCode, "int value = 0");
  });

  test('Named Parameter Element', () {
    final genCode = Context(
      buffer: StringBuffer(),
      code: NamedParameter(
        type: TypeOf(
          typeName: 'int',
          nullable: false,
          kind: TypeKind.int,
        ),
        identifier: Identifier('value'),
        defaultValue: Text('0'),
        isRequired: true,
      ),
    ).generate();

    expect(genCode, "required int value = 0");
  });

  test("All Named Parameter List Element", () {
    final genCode = Context(
      buffer: StringBuffer(),
      code: ParameterList(
        namedParameters: NamedParameterList([
          NamedParameter(
            type: TypeOf(
              typeName: 'int',
              nullable: false,
              kind: TypeKind.int,
            ),
            identifier: Identifier('value'),
            defaultValue: Text('0'),
            isRequired: true,
          ),
        ]),
      ),
    ).generate();

    expect(genCode, "({required int value = 0})");
  });

  test("All Optional Parameter List Element", () {
    final genCode = Context(
      buffer: StringBuffer(),
      code: ParameterList(
        optionalParameters: OptionalParameterList([
          OptionalParameter(
            type: TypeOf(
              typeName: 'int',
              nullable: false,
              kind: TypeKind.int,
            ),
            identifier: Identifier('value'),
            defaultValue: Text('0'),
          ),
        ]),
      ),
    ).generate();

    expect(genCode, "([int value = 0])");
  });

  test('Mixed Parameter List Element', () {
    final genCode = Context(
      buffer: StringBuffer(),
      code: ParameterList(
        parameters: [
          Parameter(
            type: TypeOf(
              typeName: 'int',
              nullable: false,
              kind: TypeKind.int,
            ),
            identifier: Identifier('value'),
          ),
        ],
        namedParameters: NamedParameterList([
          NamedParameter(
            type: TypeOf(
              typeName: 'int',
              nullable: false,
              kind: TypeKind.int,
            ),
            identifier: Identifier('named'),
            defaultValue: Text('0'),
            isRequired: true,
          ),
        ]),
        optionalParameters: OptionalParameterList([
          OptionalParameter(
            type: TypeOf(
              typeName: 'int',
              nullable: false,
              kind: TypeKind.int,
            ),
            identifier: Identifier('optional'),
            defaultValue: Text('0'),
          ),
        ]),
      ),
    ).generate();

    expect(
        genCode, "(int value, [int optional = 0], {required int named = 0})");
  });
}
