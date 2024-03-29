import 'code.dart';

class Context {
  final StringBuffer buffer;
  final Context? parent;
  final Code code;

  const Context({
    required this.buffer,
    required this.code,
    this.parent,
  });

  Context withParent(Code code) {
    return Context(
      buffer: buffer,
      code: code,
      parent: this,
    );
  }

  String generate() {
    code.writeOn(this);
    return buffer.toString();
  }

  Code? findParent<T>() {
    if (parent == null) {
        return null;
    } else if (parent!.code is T) {
        return parent!.code;
    } else {
        return parent!.findParent<T>();
    }
  }
}
