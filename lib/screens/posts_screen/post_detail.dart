import 'package:flutter/material.dart';

import '../../utils/assets.dart';
import '../../utils/extensions.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const SizedBox(height: 44),
        Text(
          'Fitness vs Sport',
          style: textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        AppIcons.fitness.pngPicture,
        const SizedBox(height: 10),
        Text(
          'What is the difference between sports and fitness? You will learn more in this article. Many of us are engaged in physical activity. Someone to lose weight, someone to gain muscle mass, and someone was simply taught to do exercises in the morning.A large number of people are ready to call any physical exercise a sport, considering that this is a generalizing concept for all loads. However, these are completely different concepts. Not all exercises can be called sports. And accordingly, not every person can be called an athlete. What people do in gyms in clubs is called fitness. Let\'s figure out what is the difference between sports and fitness. Goals The most important difference is the different goals set by athletes and those who practice fitness. The main tasks of fitness are to get a toned body, strengthen health, burn fat, increase muscle mass and strength, develop endurance and flexibility. Anyone can go to the gym, repeat exercises from the Internet or television, or just go for a jog and on the horizontal bars. To achieve the desired result, you do not need to make exorbitant efforts. You can start doing fitness at any age, if there are no health contraindications. And when it comes to sports, the main task is sports achievements, records, winning competitions at various levels, obtaining a rank. Athletes, as a rule, have been engaged since childhood, expose their bodies to enormous physical exertion and always aim at one thing — achieving maximum results, they strive to win and give their best to the limit of their capabilities. Risks In big-time sports, a person invests in every exercise to the maximum and goes beyond their capabilities, therefore, the probability of serious injury is very high. Diseases of the cardiovascular system are also common among athletes, because it is constantly subjected to huge loads. In fitness, with a smart approach to training and without fanaticism, the likelihood of injury can be minimized. Skill development With the right approach and regular training, fitness gives you the opportunity to do just a little bit at once: put your figure in order, develop body flexibility, make your muscles prominent, develop strength and endurance. In sports, physical qualities and skills do not develop all together. Each sport has its own specifics. For professional runners and cyclists, the main quality is endurance, for wrestlers — strength, for gymnasts — flexibility and coordination of movements. In some of these qualities, an athlete develops, reaches heights, sets records, wins, and in something else he may be absolutely "not pumped up". Food There are also differences in the nutrition of athletes and people who are engaged in fitness. The former have a strict diet that helps them achieve their goals. For example, those who need to develop strength consume large amounts of protein. In fitness, everything is simpler and it\'s enough just to have a balanced diet and not lean on junk food. Daily schedule In professional sports, training takes up most of the time and the daily routine is scheduled minute by minute for months ahead. Special schedules are drawn up for athletes — cycles, according to which they, for example, prepare for the Olympics or other competitions. Any deviation is fraught with not achieving the desired results. In fitness, everything is simpler, a person comes to training in his free time and whenever he wishes. And if he wants to take a break, he won\'t be able to take any problems from it. So, now you and I know that fitness is a more gentle exercise that is aimed at maintaining and strengthening health. For fitness, it is enough to engage in feasible physical activity at any convenient time and eat right. And sport is a professional activity that is associated with a focus on: achieving athletic results, winning competitions, setting records; these are exorbitant loads for the body, the risk of injury, a strict diet and daily routine. Fitness is like a part of life. And sport for a person becomes his whole life.',
          style: textTheme.titleMedium,
        )
      ],
    );
  }
}
