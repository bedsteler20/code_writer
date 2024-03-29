import 'core/context.dart';
import 'core/group.dart';
import 'core/text_element.dart';

import 'core/code.dart';
import 'generic.dart';

enum TypeKind {
  int,
  double,
  string,
  void_,
  dynamic_,
  bool,
  pointer,
  array,
  object,
}

class TypeOf extends Code {
  final String typeName;
  final bool nullable;
  final TypeKind kind;
  final Generic? generic;

  const TypeOf({
    required this.typeName,
    required this.nullable,
    required this.kind,
    this.generic,
  });

  @override
  Code build(Context context) {
    return Group([
      Text(typeName),
      if (generic != null) generic!,
      if (nullable) Text('?'),
    ]);
  }
}
