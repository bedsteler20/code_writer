import '../../code_writer.dart';

class Body extends Code {
  final Code code;

  const Body(this.code);

  @override
  Code build(Context context) => Group([
        Text("{"),
        code,
        Text("}"),
      ]);
}

class StringLiteral extends Code {
  final String value;

  const StringLiteral(this.value);

  @override
  Code build(Context context) => Text('\'$value\'');
}