import 'package:code_writer/code_writer.dart';
import 'package:test/test.dart';

void main() {
  test('TypeOf Element Nullable', () {
    final genCode = Context(
      buffer: StringBuffer(),
      code: TypeOf(
        typeName: 'int',
        nullable: true,
        kind: TypeKind.int,
      ),
    ).generate();

    expect(genCode, "int?");
  });

  test('TypeOf Element Non-Nullable', () {
    final genCode = Context(
      buffer: StringBuffer(),
      code: TypeOf(
        typeName: 'int',
        nullable: false,
        kind: TypeKind.int,
      ),
    ).generate();

    expect(genCode, "int");
  });

  test("Identifier Element", () {
    final genCode = Context(
      buffer: StringBuffer(),
      code: Identifier('name'),
    ).generate();

    expect(genCode, "name");
  });

  test("TypeOf Element with Generic", () {
    final genCode = Context(
      buffer: StringBuffer(),
      code: TypeOf(
        typeName: 'List',
        nullable: false,
        kind: TypeKind.object,
        generic: Generic(
          TypeOf(
            typeName: 'int',
            nullable: false,
            kind: TypeKind.int,
          ),
        ),
      ),
    ).generate();

    expect(genCode, "List<int>");
  });

  test("TypeOf Element with Generic and Nullable", () {
    final genCode = Context(
      buffer: StringBuffer(),
      code: TypeOf(
        typeName: 'List',
        nullable: true,
        kind: TypeKind.object,
        generic: Generic(
          TypeOf(
            typeName: 'int',
            nullable: false,
            kind: TypeKind.int,
          ),
        ),
      ),
    ).generate();

    expect(genCode, "List<int>?");
  });

  test("TypeOf Element extends Code", () {
    final genCode = Context(
      buffer: StringBuffer(),
      code: TypeOf(
        typeName: 'List',
        nullable: false,
        kind: TypeKind.object,
        generic: GenericExtends(
          Identifier("T"),
          TypeOf(
            typeName: 'int',
            nullable: false,
            kind: TypeKind.int,
          ),
        ),
      ),
    ).generate();

    expect(genCode, "List<T extends int>");
  });
}
