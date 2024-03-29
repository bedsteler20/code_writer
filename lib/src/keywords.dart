import 'core/code.dart';
import 'core/context.dart';
import 'core/group.dart';
import 'core/text_element.dart';

class Return extends Code {
  final Code expression;

  Return({required this.expression});

  @override
  Code build(Context context) {
    return Group([
      Text('return '),
      expression,
      Text(';'),
    ]);
  }
}
