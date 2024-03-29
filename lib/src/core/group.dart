import 'context.dart';
import 'code.dart';

class Group extends Code {
  final List<Code> elements;

  const Group(this.elements);

  @override
  Code build(Context context) {
    throw ArgumentError('GroupElement cannot be built');
  }

  @override
  void writeOn(Context context) {
    for (var element in elements) {
      element.writeOn(context.withParent(this));
    }
  }
}
