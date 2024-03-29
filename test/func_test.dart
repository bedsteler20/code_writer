import 'package:code_writer/code_writer.dart';
import 'package:test/test.dart';

void main() {
  test("Function", () {
    final code = Context(
      buffer: StringBuffer(),
      code: Func(
        name: Identifier('main'),
        returnType: TypeOf(
          typeName: 'void',
          nullable: false,
          kind: TypeKind.void_,
        ),
        parameters: ParameterList(
          parameters: [
            Parameter(
              type: TypeOf(
                typeName: 'List',
                nullable: false,
                kind: TypeKind.object,
                generic: Generic(
                  TypeOf(
                    typeName: 'String',
                    nullable: false,
                    kind: TypeKind.string,
                  ),
                ),
              ),
              identifier: Identifier('args'),
            ),
          ],
        ),
        body: Group([
          Call(
            function: Identifier('print'),
            arguments: [
              Identifier('args'),
            ],
          ),
          SemiColon()
        ]),
      ),
    ).generate();

    expect(code, "void main(List<String> args) {print(args);}");
  });
}
