import 'package:flutter_test/flutter_test.dart';
import 'package:workroom_flutter_app/app/app.dart';
import 'package:workroom_flutter_app/features/screens/work_queue/work_que.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(WorkQuePage), findsOneWidget);
    });
  });
}
