import 'core/code.dart';
import 'core/context.dart';
import 'core/group.dart';
import 'core/text_element.dart';

import 'identifier.dart';
import 'type_of.dart';

class TypeDef extends Code {
  final TypeOf type;
  final Identifier alias;

  TypeDef(this.alias, this.type);

  @override
  Code build(Context context) {
    return Group([
      Text('typedef '),
      alias,
      Text(' = '),
      type,
      SemiColon(),
    ]);
  }

}
