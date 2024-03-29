import 'core/code.dart';
import 'core/context.dart';
import 'core/group.dart';
import 'core/text_element.dart';
import 'identifier.dart';
import 'type_of.dart';

class Generic extends Code {
  final Code type;

  Generic(this.type) {
    assert(
      type is Identifier || type is TypeOf,
      'The type must be an instance of Identifier or TypeOf when using Generic',
    );
  }

  @override
  Code build(Context context) {
    return Group([
      Text('<'),
      type,
      Text('>'),
    ]);
  }
}

class GenericExtends extends Generic {
  final Code extendsType;

  GenericExtends(super.type, this.extendsType) {
    assert(
      type is Identifier,
      'The type must be an instance of Identifier when using GenericExtends',
    );
    assert(
      extendsType is TypeOf,
      'The extendsType must be an instance of TypeOf when using GenericExtends',
    );
  }

  @override
  Code build(Context context) {
    return Group([
      Text('<'),
      type,
      Text(' extends '),
      extendsType,
      Text('>'),
    ]);
  }
}
