import 'core/code.dart';
import 'core/context.dart';
import 'core/text_element.dart';

class Identifier extends Code {
  final String name;

  const Identifier(this.name);

  @override
  Code build(Context context) {
    return Text(name);
  }

  Identifier chain(Identifier identifier) =>
      Identifier('$name.${identifier.name}');

  @override
  String toString() => name;
}
