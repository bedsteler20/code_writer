import 'package:dart_style/dart_style.dart';
import 'package:code_writer/code_writer.dart';

void main() {
  final mainMethod = Func(
    name: Identifier("main"),
    parameters: ParameterList(
      parameters: [
        Parameter(
          type: TypeOf(
            typeName: 'List',
            nullable: false,
            kind: TypeKind.object,
            generic: Generic(TypeOf(
              typeName: 'String',
              nullable: false,
              kind: TypeKind.string,
            )),
          ),
          identifier: Identifier('args'),
        ),
      ],
    ),
    returnType: TypeOf(
      typeName: 'void',
      nullable: false,
      kind: TypeKind.void_,
    ),
    body: Group([
      Var(
        name: Identifier("app"),
        value: Call(function: Identifier("App")),
      ),
      Call(
        function: Identifier("print"),
        arguments: [Identifier("app").chain(Identifier("name"))],
      ),
      SemiColon()
    ]),
  );

  final appClass = Class(
    name: Identifier("App"),
    methods: [
      Func(
        name: Identifier("sayHi"),
        parameters: ParameterList(),
        returnType: TypeOf(
          typeName: 'void',
          nullable: false,
          kind: TypeKind.void_,
        ),
        body: Group([
          Var(
            name: Identifier("message"),
            value: StringLiteral("Hi"),
          ),
          Call(
            function: Identifier("print"),
            arguments: [Identifier("message")],
          ),
          SemiColon(),
        ]),
      ),
    ],
    getters: [
      Getter(
        name: Identifier("name"),
        returnType: TypeOf(
          typeName: 'String',
          nullable: false,
          kind: TypeKind.string,
        ),
        body: Group([
          Return(
            expression: StringLiteral("Hello, World!"),
          ),
        ]),
      ),
    ],
  );

  final en = ConstEnum(Identifier("MyEnum"),
      values: [
        ConstEnumValue("value1", "1"),
        ConstEnumValue("value2", "2"),
        ConstEnumValue("value3", "3"),
        ConstEnumValue("value4", "4"),
      ],
      type: TypeOf(
        typeName: 'int',
        nullable: false,
        kind: TypeKind.int,
      ));

  final tree = Context(
    buffer: StringBuffer(),
    code: Library(
      "hello_world",
      imports: [
        Import("dart:core"),
      ],
      codes: [
        en,
        appClass,
        mainMethod,
      ],
    ),
  );

  final code = tree.generate();
  final formatter = DartFormatter();
  final formattedCode = formatter.format(code);

  print(formattedCode);
}
