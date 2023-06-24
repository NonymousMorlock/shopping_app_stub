import 'package:benaiah_okwukwe_anukem/app/app.dart';
import 'package:benaiah_okwukwe_anukem/features/onboarding/presentation/views/on_boarding_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders OnBoardingScreen', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(OnBoardingScreen), findsOneWidget);
    });
  });
}
