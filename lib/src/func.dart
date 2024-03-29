import '../code_writer.dart';
import 'core/code.dart';
import 'core/context.dart';
import 'core/group.dart';
import 'core/text_element.dart';

import 'generic.dart';
import 'identifier.dart';
import 'parameter.dart';
import 'type_of.dart';

class Func extends Code {
  final Identifier name;
  final ParameterList parameters;
  final TypeOf returnType;
  final Code body;
  final Generic? generic;
  final bool isAsync;

  Func({
    required this.name,
    required this.parameters,
    required this.returnType,
    required this.body,
    this.generic,
    this.isAsync = false,
  });

  @override
  Code build(Context context) {
    return Group([
      returnType,
      Text(' '),
      name,
      if (generic != null) generic!,
      parameters,
      if (isAsync) Text(' async'),
      Body(body)
    ]);
  }
}
