import 'code.dart';
import 'context.dart';

class Blank extends Code {
    @override
    Code build(Context context) {
        throw ArgumentError('BlankElement cannot be built');
    }
    
    @override
    void writeOn(Context context) {}
}
