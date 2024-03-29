import 'core/context.dart';
import 'core/group.dart';
import 'core/text_element.dart';
import 'core/code.dart';

import 'identifier.dart';
import 'type_of.dart';

class Parameter extends Code {
  final TypeOf? type;
  final Identifier identifier;

  Parameter({
    required this.type,
    required this.identifier,
  });

  @override
  Code build(Context context) {
    return Group([
      if (type != null) type!,
      Text(' '),
      identifier,
    ]);
  }
}

class ParameterList extends Code {
  final List<Parameter> parameters;
  final NamedParameterList? namedParameters;
  final OptionalParameterList? optionalParameters;

  ParameterList({
    this.parameters = const [],
    this.namedParameters,
    this.optionalParameters,
  });

  @override
  Code build(Context context) {
    final elements = <Code>[];

    for (var i = 0; i < parameters.length; i++) {
      elements.add(parameters[i]);

      if (i < parameters.length - 1) {
        elements.add(Text(', '));
      }
    }

    if (parameters.isNotEmpty && optionalParameters != null) {
      elements.add(Text(', '));
    }

    if (optionalParameters != null) {
      elements.add(optionalParameters!);
    }

    if ((parameters.isNotEmpty ||
            (optionalParameters?.parameters.isNotEmpty ?? false)) &&
        namedParameters != null) {
      elements.add(Text(', '));
    }

    if (namedParameters != null) {
      elements.add(namedParameters!);
    }

    return Group([
      Text('('),
      Group(elements),
      Text(')'),
    ]);
  }
}

// =============================================================================

class OptionalParameter extends Parameter {
  final Code? defaultValue;

  OptionalParameter({
    required super.type,
    required super.identifier,
    this.defaultValue,
  });

  @override
  Code build(Context context) {
    return Group([
      if (type != null) type!,
      Text(' '),
      identifier,
      if (defaultValue != null) Text(' = '),
      if (defaultValue != null) defaultValue!,
    ]);
  }
}

class OptionalParameterList extends Code {
  final List<OptionalParameter> parameters;

  OptionalParameterList(this.parameters);

  @override
  Code build(Context context) {
    final elements = <Code>[];

    for (var i = 0; i < parameters.length; i++) {
      elements.add(parameters[i]);

      if (i < parameters.length - 1) {
        elements.add(Text(', '));
      }
    }

    return Group([
      Text('['),
      Group(elements),
      Text(']'),
    ]);
  }
}

// =============================================================================

class NamedParameter extends OptionalParameter {
  final bool isRequired;
  NamedParameter({
    required super.type,
    required super.identifier,
    super.defaultValue,
    this.isRequired = false,
  });

  @override
  Code build(Context context) {
    return Group([
      if (isRequired) Text('required '),
      if (type != null) type!,
      Text(' '),
      identifier,
      if (defaultValue != null) Text(' = '),
      if (defaultValue != null) defaultValue!,
    ]);
  }
}

class NamedParameterList extends Code {
  final List<NamedParameter> parameters;

  const NamedParameterList(this.parameters);

  @override
  Code build(Context context) {
    final elements = <Code>[];

    for (var i = 0; i < parameters.length; i++) {
      elements.add(parameters[i]);

      if (i < parameters.length - 1) {
        elements.add(Text(', '));
      }
    }

    return Group([
      Text('{'),
      Group(elements),
      Text('}'),
    ]);
  }
}
