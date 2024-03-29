import 'core/code.dart';
import 'core/context.dart';
import 'core/text_element.dart';

class Comment extends Code {
  final String comment;

  Comment(this.comment);

  @override
  Code build(Context context) {
    return Text('// $comment');
  }
}