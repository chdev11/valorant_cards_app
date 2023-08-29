import 'dart:math';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import '../utils/deck_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:valorant_cards_app/app/shared/images.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:valorant_cards_app/app/modules/battle/presenter/states/battle_state.dart';
import 'package:valorant_cards_app/app/modules/battle/presenter/stores/battle_store.dart';
import 'package:valorant_cards_app/app/modules/home/presenter/stores/home_store.dart';
import 'package:valorant_cards_app/app/shared/agent/domain/entities/agent.dart';

class BattlePage extends StatefulWidget {
  const BattlePage({super.key});

  @override
  State<BattlePage> createState() => _BattlePageState();
}

class _BattlePageState extends State<BattlePage> {
  final homeStore = Modular.get<HomeStore>();
  final store = Modular.get<BattleStore>();

  Map? statistics;

  @override
  void initState() {
    reaction((_) => store.battleState, (state) {
      if (state is BattleGame) {
        store.toggleEndedRoundBlur();

        statistics = store.damageStore.calculate(
            store.p1Store.battleAgentList
                .where((element) => element.store.battle)
                .toList(),
            store.p2Store.battleAgentList
                .where((element) => element.store.battle)
                .toList());

        if (store.p1Store.battleAgentList
                .where((element) => element.store.alive)
                .isEmpty &&
            store.p2Store.battleAgentList
                .where((element) => element.store.alive)
                .isEmpty) {
          store.endBattle('Empate!');
          return;
        }
        if (store.p1Store.battleAgentList
            .where((element) => element.store.alive)
            .isEmpty) {
          store.endBattle('Derrota!');
          return;
        }
        if (store.p2Store.battleAgentList
            .where((element) => element.store.alive)
            .isEmpty) {
          store.endBattle('Vitória!');
          return;
        }
      }
    });

    super.initState();
    store.initGame();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: double.infinity,
          color: Colors.green,
          child: Observer(builder: (context) {
            store.p1Store.selectedIds.toString();
            Text(
                '${store.battleState}${store.battleState is BattleEnd ? '\n${(store.battleState as BattleEnd).message}' : ''}');
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height * .07,
                      color: Colors.indigo,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(FontAwesomeIcons.solidUser),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('CHzin'),
                                  Row(
                                    children: [
                                      Text(
                                          '${store.p1Store.battleAgentList.where((element) => element.store.alive).toList().length}x'),
                                      const SizedBox(width: 5),
                                      Image.asset(
                                        cardsImage,
                                        width: 30,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(store.p2Store.robot!
                                      ? 'Robô'
                                      : 'Adversário'),
                                  Row(
                                    children: [
                                      Text(
                                          '${store.p2Store.battleAgentList.where((element) => element.store.alive).toList().length}x'),
                                      const SizedBox(width: 5),
                                      Image.asset(
                                        cardsImage,
                                        width: 30,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(width: 10),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(store.p2Store.robot!
                                    ? FontAwesomeIcons.robot
                                    : FontAwesomeIcons.solidUser),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (store.battleState is BattleEnd) {
                          return Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'O jogo acabou',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40),
                              ),
                              Text(
                                (store.battleState as BattleEnd).message,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 30),
                              )
                            ],
                          ));
                        }
                        if (store.battleState is BattleGame) {
                          return Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox.shrink(),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DeckWidget(store: store.p2Store),
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Image.asset(versusBattleImage,
                                            width: 90),
                                      ),
                                      DeckWidget(store: store.p1Store),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      for (var agent in store
                                          .p1Store.battleAgentList
                                          .where((element) =>
                                              element.store.battle)) {
                                        agent.store.exitBattle();
                                      }
                                      for (var agent in store
                                          .p2Store.battleAgentList
                                          .where((element) =>
                                              element.store.battle)) {
                                        agent.store.exitBattle();
                                      }
                                      store.p1Store.battleAgentList.sort(
                                          (a, b) => b.store.alive ? 1 : -1);
                                      store.p2Store.battleAgentList.sort(
                                          (a, b) => b.store.alive ? 1 : -1);
                                      store.initBattle();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent),
                                    child: const Text('ESCOLHER CARTAS',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        if (store.battleState is BattleP1Choice) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CarouselSlider(
                                items: store.p1Store.battleAgentList
                                    .map((agent) =>
                                        Observer(builder: (context) {
                                          return GestureDetector(
                                              onTap: () {
                                                if (!agent.store.alive) return;

                                                if (agent.store.battle) {
                                                  agent.store.exitBattle();
                                                } else {
                                                  agent.store.enterBattle();
                                                }
                                              },
                                              child: Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    color: const Color.fromARGB(
                                                        255, 27, 27, 27),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        spreadRadius: 1,
                                                        blurRadius: 10,
                                                        offset:
                                                            const Offset(9, 9),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        25,
                                                                    vertical:
                                                                        5),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(agent.name,
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            20)),
                                                                Image.asset(
                                                                  agent
                                                                      .agentType
                                                                      .image,
                                                                  width: 25,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Image.asset(
                                                              agent.photo,
                                                              height: 120,
                                                              opacity: agent
                                                                          .store
                                                                          .battle ||
                                                                      !agent
                                                                          .store
                                                                          .alive
                                                                  ? const AlwaysStoppedAnimation(
                                                                      .2)
                                                                  : null),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    const Flexible(
                                                                        flex: 4,
                                                                        child:
                                                                            Text(
                                                                          'Vida: ',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold),
                                                                        )),
                                                                    Flexible(
                                                                      flex: 8,
                                                                      child:
                                                                          LinearPercentIndicator(
                                                                        lineHeight:
                                                                            10,
                                                                        percent: (agent.store.health / 100).clamp(
                                                                            0,
                                                                            1),
                                                                        backgroundColor:
                                                                            Colors.grey,
                                                                        progressColor:
                                                                            Colors.blue,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    const Flexible(
                                                                        flex: 4,
                                                                        child:
                                                                            Text(
                                                                          'Função: ',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold),
                                                                        )),
                                                                    Flexible(
                                                                      flex: 8,
                                                                      child:
                                                                          Text(
                                                                        agent
                                                                            .agentType
                                                                            .label,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    const Flexible(
                                                                        flex: 4,
                                                                        child:
                                                                            Text(
                                                                          'Ataque: ',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold),
                                                                        )),
                                                                    Flexible(
                                                                      flex: 8,
                                                                      child: generateStars(agent
                                                                          .agentType
                                                                          .attackStars),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    const Flexible(
                                                                        flex: 4,
                                                                        child:
                                                                            Text(
                                                                          'Defesa: ',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold),
                                                                        )),
                                                                    Flexible(
                                                                      flex: 8,
                                                                      child: generateStars(agent
                                                                          .agentType
                                                                          .defenceStars),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    const Flexible(
                                                                        flex: 4,
                                                                        child:
                                                                            Text(
                                                                          'Stun: ',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold),
                                                                        )),
                                                                    Flexible(
                                                                      flex: 8,
                                                                      child: generateStars(agent
                                                                          .agentType
                                                                          .stunStars),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    const Flexible(
                                                                        flex: 4,
                                                                        child:
                                                                            Text(
                                                                          'Flash: ',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold),
                                                                        )),
                                                                    Flexible(
                                                                      flex: 8,
                                                                      child: generateStars(agent
                                                                          .agentType
                                                                          .flashStars),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    const Flexible(
                                                                        flex: 4,
                                                                        child:
                                                                            Text(
                                                                          'Cura: ',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold),
                                                                        )),
                                                                    Flexible(
                                                                      flex: 8,
                                                                      child: generateStars(agent
                                                                          .agentType
                                                                          .healthStars),
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      if (agent.store.battle ||
                                                          !agent.store.alive)
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius
                                                                        .circular(
                                                                            20)),
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    .4),
                                                          ),
                                                          child: Center(
                                                              child: Icon(
                                                            agent.store.battle
                                                                ? FontAwesomeIcons
                                                                    .solidCircleCheck
                                                                : FontAwesomeIcons
                                                                    .skull,
                                                            size: 40,
                                                            color: agent.store
                                                                    .battle
                                                                ? Colors.white
                                                                : Colors
                                                                    .redAccent,
                                                          )),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ));
                                        }))
                                    .toList(),
                                options: CarouselOptions(
                                  height: 340,
                                  viewportFraction: .6,
                                  enlargeCenterPage: true,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.zoom,
                                  enlargeFactor: .5,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    store.changeSideBattle();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent),
                                  child: const Text('BATALHA!',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          );
                        }
                        if (store.battleState is BattleP2Choice) {
                          return Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'O adversário está escolhendo as cartas',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 10),
                                CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ));
                        }
                        if (store.battleState is BattleSelection) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                color: Colors.black.withOpacity(.7),
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 7),
                                    itemCount: homeStore.agentList.length,
                                    itemBuilder: (context, index) {
                                      final agent = homeStore.agentList[index];
                                      final selectedAgent = store
                                              .p1Store.selectedIds
                                              .indexWhere((element) =>
                                                  element == agent.name) >=
                                          0;

                                      return Builder(builder: (context) {
                                        return GestureDetector(
                                            onTap: () {
                                              if (selectedAgent) {
                                                store.p1Store.removeSelectedId(
                                                    agent.name);
                                              } else {
                                                store.p1Store
                                                    .addSelectedId(agent.name);
                                              }
                                            },
                                            child: Stack(
                                              children: [
                                                Image.asset(agent.photo,
                                                    height: 50,
                                                    opacity: selectedAgent
                                                        ? const AlwaysStoppedAnimation(
                                                            .2)
                                                        : null),
                                                if (selectedAgent)
                                                  const Center(
                                                      child: Icon(
                                                    FontAwesomeIcons
                                                        .solidCircleCheck,
                                                    size: 20,
                                                    color: Colors.white,
                                                  )),
                                              ],
                                            ));
                                      });
                                    }),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    store.p1Store.setBattleAgentList();
                                    store.initBattle();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent),
                                  child: const Text('CONFIRMAR',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
                Observer(builder: (context) {
                  Map aTeam = {};
                  Map bTeam = {};
                  if (statistics != null) {
                    aTeam = statistics!['aTeam'];
                    bTeam = statistics!['bTeam'];
                  }
                  if (store.battleState is! BattleGame ||
                      !store.endedRoundBlur) {
                    return const SizedBox.shrink();
                  }
                  return GestureDetector(
                    onTap: () {
                      store.toggleEndedRoundBlur();
                      statistics = null;
                    },
                    child: Container(
                      color: Colors.black.withOpacity(.9),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'FIM DO ROUND',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                fontFamily: GoogleFonts.kanit().fontFamily,
                              ),
                            )
                                .animate(
                                    // onComplete: (_) {
                                    //   Future.delayed(const Duration(seconds: 5),
                                    //       () {
                                    //     store.toggleEndedRoundBlur();
                                    //     statistics = null;
                                    //   });
                                    // },
                                    )
                                .fadeIn()
                                .scale()
                                .move(delay: 300.ms, duration: 600.ms)
                                .tint(color: Colors.red)
                                .then()
                                .shimmer(),
                            const Text(
                              'ESTATÍSTICAS',
                              style: TextStyle(letterSpacing: 1.5),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'CAUSADO',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(FontAwesomeIcons.gun),
                                const SizedBox(width: 20),
                                Text(
                                  'Ataque: ${aTeam['attack']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(FontAwesomeIcons.shield),
                                const SizedBox(width: 20),
                                Text(
                                  'Defesa: ${aTeam['defence']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(FontAwesomeIcons.gauge),
                                const SizedBox(width: 20),
                                Text(
                                  'Stun: ${aTeam['stun']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(FontAwesomeIcons.eyeLowVision),
                                const SizedBox(width: 20),
                                Text(
                                  'Flash: ${aTeam['flash']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(FontAwesomeIcons.kitMedical),
                                const SizedBox(width: 20),
                                Text(
                                  'Cura: ${aTeam['health']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'SOFRIDO',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(FontAwesomeIcons.gun),
                                const SizedBox(width: 20),
                                Text(
                                  'Ataque: ${bTeam['attack']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(FontAwesomeIcons.shield),
                                const SizedBox(width: 20),
                                Text(
                                  'Defesa: ${bTeam['defence']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(FontAwesomeIcons.gauge),
                                const SizedBox(width: 20),
                                Text(
                                  'Stun: ${bTeam['stun']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(FontAwesomeIcons.eyeLowVision),
                                const SizedBox(width: 20),
                                Text(
                                  'Flash: ${bTeam['flash']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(FontAwesomeIcons.kitMedical),
                                const SizedBox(width: 20),
                                Text(
                                  'Cura: ${bTeam['health']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget generateStars(double stars) {
    bool half = false;
    if ((stars % 1) != 0) {
      half = true;
    }

    return Row(
      children: List.generate(stars.toInt() + (half ? 1 : 0), (index) {
        var icon = FontAwesomeIcons.solidStar;

        if (index + 1 > stars) {
          icon = FontAwesomeIcons.solidStarHalf;
        }

        return Icon(
          icon,
          color: Colors.orange,
          size: 12,
        );
      }),
    );
  }

  void battle() {
    final random = Random();

    List<Agent> attackAgentList = [];
    List<Agent> defenceAgentList = [];

    for (int x = 0; x < 2; x++) {
      for (int i = 0; i < 5; i++) {
        final agent =
            homeStore.agentList[random.nextInt(homeStore.agentList.length)];

        if ((x == 0 ? attackAgentList : defenceAgentList)
                    .indexWhere((element) => element.name == agent.name) >=
                0 ||
            (x == 0 ? attackAgentList : defenceAgentList).length == 5) {
          i--;
          continue;
        }

        if (x == 0) {
          attackAgentList.add(agent);
        } else {
          defenceAgentList.add(agent);
        }
      }
    }

    print(
        'Time atacante comp: ${attackAgentList.map((e) => e.name).toList().join(', ')}');
    print(
        'Time defensor comp: ${defenceAgentList.map((e) => e.name).toList().join(', ')}');
    // store.damageStore.calculate(attackAgentList, defenceAgentList);
  }
}
