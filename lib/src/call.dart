import '../code_writer.dart';

class Call extends Code {
  final Code function;
  final Code? callOn;
  final List<Code> arguments;
  final Map<String, Code> namedArguments;
  final bool shouldAwait;


  Call({
    required this.function,
    this.arguments = const [],
    this.namedArguments = const {},
    this.callOn,
    this.shouldAwait = false,
  });

  @override
  Code build(Context context) {
    final elements = <Code>[];

    if (shouldAwait) {
      elements.add(Text('await '));
    }

    if (callOn != null) {
      elements.add(callOn!);
      elements.add(Text('.'));
    }

    elements.add(function);
    elements.add(Text('('));

    for (var i = 0; i < arguments.length; i++) {
      elements.add(arguments[i]);

      if (i < arguments.length - 1) {
        elements.add(Text(', '));
      }
    }

    if (namedArguments.isNotEmpty) {
      if (arguments.isNotEmpty) {
        elements.add(Text(', '));
      }

      namedArguments.forEach((key, value) {
        elements.add(Text('$key: $value'));
      });
    }

    elements.add(Text(')'));

    return Group(elements);
  }
}