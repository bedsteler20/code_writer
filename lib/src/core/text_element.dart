import 'context.dart';
import 'code.dart';

class Text extends Code {
  final String text;

  const Text(this.text);

  @override
  Code build(Context context) {
    throw ArgumentError('TextElement cannot be built');
  }

  @override
  void writeOn(Context context) {
    context.buffer.write(text);
  }
}

class Space extends Text {
  const Space() : super(' ');
}

class NewLine extends Text {
  const NewLine() : super('\n');
}

class SemiColon extends Text {
  const SemiColon() : super(';');
}