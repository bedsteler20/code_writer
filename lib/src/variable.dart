import 'core/code.dart';
import 'core/context.dart';
import 'core/group.dart';
import 'core/text_element.dart';

import 'identifier.dart';
import 'type_of.dart';

class Var extends Code {
  final Identifier name;
  final Code? value;
  final TypeOf? type;
  final bool isFinal;
  final bool isConst;

  const Var({
    required this.name,
    required this.value,
    this.isFinal = false,
    this.isConst = false,
    this.type,
  }) : assert(isFinal && isConst, 'Variable cannot be both final and const');

  @override
  Code build(Context context) {
    var elements = <Code>[];

    if (isFinal) {
      elements.add(Text('final '));
    } else if (isConst) {
      elements.add(Text('const '));
    }

    if (type != null) {
      elements.add(type!);
      elements.add(Text(' '));
    } else if (!isFinal && !isConst) {
      elements.add(Text('var '));
    }

    elements.add(name);

    if (value != null) {
      elements.add(Text(' = '));
      elements.add(value!);
    }

    elements.add(SemiColon());

    return Group(elements);
  }
}
