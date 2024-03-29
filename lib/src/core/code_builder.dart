import 'code.dart';
import 'context.dart';

class CodeBuilder extends Code {
  final Code Function(Context) builder;

  const CodeBuilder(this.builder);

  @override
  Code build(Context context) {
    return builder(context);
  }
}
