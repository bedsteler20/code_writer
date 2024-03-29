import '../code_writer.dart';
import 'core/code.dart';
import 'core/context.dart';
import 'core/group.dart';
import 'core/text_element.dart';
import 'type_of.dart';

class Enum extends Code {
  final Identifier name;
  final List<Identifier> values;

  Enum(this.name, {required this.values});

  @override
  Code build(Context context) {
    return Group([
      Text('enum'),
      name,
      Body(
        Group(values),
      ),
    ]);
  }
}

class ConstEnum extends Code {
  final Identifier name;
  final List<ConstEnumValue> values;
  final TypeOf type;

  ConstEnum(
    this.name, {
    required this.values,
    required this.type,
  });

  @override
  Code build(Context context) {
    var elements = <Code>[];

    for (var i = 0; i < values.length; i++) {
      elements.add(values[i]);
      if (i != values.length - 1) {
        elements.add(Text(','));
      }
    }
    elements.add(SemiColon());

    elements.add(Constructor(
        name: name,
        isConst: true,
        parameters: ParameterList(
          parameters: [
            Parameter(
              type: null,
              identifier: Identifier('this.value'),
            ),
          ],
        ),
    ));
    elements.add(Var(
      name: Identifier("value"),
      value: null,
      isFinal: true,
      type: type,
    ));

    return Group([
      Text('enum $name '),
      Body(Group(elements)),
    ]);
  }
}

class ConstEnumValue extends Code {
  final String name;
  final String value;
  ConstEnumValue(this.name, this.value);

  @override
  Code build(Context context) {
    return Group([
      Text('$name($value)'),
    ]);
  }
}
