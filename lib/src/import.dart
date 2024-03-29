import 'core/code.dart';
import 'core/context.dart';
import 'core/group.dart';
import 'core/text_element.dart';

class Import extends Code {
  final String path;
  final String? alias;

  Import(this.path, {this.alias});

  @override
  Code build(Context context) {
    return Group([
      Text('import '),
      Text('\'$path\''),
      if (alias != null) Text(' as $alias'),
      Text(';'),
    ]);
  }
}

class Library extends Code {
  final String name;
  final List<Code> imports;
  final List<Code> codes;

  Library(this.name, {required this.imports, required this.codes});

  @override
  Code build(Context context) {
    return Group([
      Text('library $name;'),
      ...imports,
      ...codes,
    ]);
  }
}
