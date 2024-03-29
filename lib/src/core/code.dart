import 'context.dart';

abstract class Code {
  const Code();
  Code build(Context context);
  void writeOn(Context context) {
    build(context).writeOn(context.withParent(this));
  }
}
