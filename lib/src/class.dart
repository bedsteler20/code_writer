import 'core/body.dart';
import 'core/code.dart';
import 'core/context.dart';
import 'core/group.dart';
import 'core/text_element.dart';
import 'func.dart';
import 'identifier.dart';
import 'parameter.dart';
import 'type_of.dart';
import 'variable.dart';

class Class extends Code {
  final List<Func> methods;
  final List<Var> properties;
  final List<Getter> getters;
  final List<Setter> setters;
  final Constructor? constructor;

  final Identifier? extends_;
  final List<Identifier> implements_;
  final List<Identifier> with_;

  final Identifier name;

  Class({
    required this.name,
    this.extends_,
    this.constructor,
    this.methods = const [],
    this.properties = const [],
    this.getters = const [],
    this.setters = const [],
    this.implements_ = const [],
    this.with_ = const [],
  });

  @override
  Code build(Context context) {
    var elements = <Code>[Text("class "), name];

    if (extends_ != null) {
      elements.addAll([
        Text(" extends "),
        extends_!,
      ]);
    }

    if (implements_.isNotEmpty) {
      elements.add(Text(" implements "));
      for (var i = 0; i < implements_.length; i++) {
        elements.add(implements_[i]);
        if (i < implements_.length - 1) {
          elements.add(Text(", "));
        }
      }
    }

    if (with_.isNotEmpty) {
      elements.add(Text(" with "));
      for (var i = 0; i < with_.length; i++) {
        elements.add(with_[i]);
        if (i < with_.length - 1) {
          elements.add(Text(", "));
        }
      }
    }

    elements.add(Body(Group([
      ...properties,
      ...getters,
      ...setters,
      ...methods,
      if (constructor != null) constructor!,
    ])));

    return Group(elements);
  }
}

class Getter extends Code {
  final Identifier name;
  final Code body;
  final TypeOf? returnType;

  const Getter({
    required this.name,
    required this.body,
    this.returnType,
  });

  @override
  Code build(Context context) {
    return Group([
      if (returnType != null) returnType!,
      Space(),
      Text("get "),
      name,
      Body(body),
    ]);
  }
}

class Setter extends Code {
  final Identifier name;
  final Parameter parameter;
  final Code body;

  const Setter({
    required this.name,
    required this.parameter,
    required this.body,
  });

  @override
  Code build(Context context) {
    return Group([
      Text("set "),
      name,
      Text("("),
      parameter,
      Text(")"),
      Body(body),
    ]);
  }
}

class Constructor extends Code {
  final Identifier name;
  final ParameterList parameters;
  final Code? body;
  final bool isConst;

  const Constructor({
    required this.name,
    required this.parameters,
    this.body,
    this.isConst = false,
  });

  @override
  Code build(Context context) {
    return Group([
        Text(isConst ? "const " : ""),
      name,
      parameters,
      if (body != null) Body(body!) else SemiColon(),
    ]);
  }
}

class Factory extends Code {
  final Identifier klass;
  final Identifier name;
  final ParameterList parameters;
  final Code body;

  const Factory({
    required this.klass,
    required this.name,
    required this.body,
    required this.parameters,
  });

  @override
  Code build(Context context) {
    return Group([
      Text("factory "),
      klass,
      Text("."),
      name,
      parameters,
      Body(body),
    ]);
  }
}
