import 'package:flutter_test/flutter_test.dart';
import 'package:kart_motoru/kart_motoru.dart';
import 'package:oyun_yirmi_dokuz/oyun_yirmi_dokuz.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(yirmidokuzConfig.title.length, 33);
    expect(yirmidokuzConfig.tagline.length, 33);
    for (final s in yirmidokuzConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler kazanılabilir ve el sonuna kadar oynanır', () {
    final planner = LevelPlanner(gameId: yirmidokuzId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      final gl = yirmidokuzRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
      final end = TrickGameRules.simulate(gl.puzzle);
      expect(end.phase, TrickPhase.over, reason: 'bölüm $lv');
    }
    expect(yirmidokuzRules.localPlayers, 4);
  });
}
