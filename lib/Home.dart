import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          //leading: Icon(Icons.menu),
          //elevation: 90,

          title: Text(
            'Dice Roller',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: RolDice());
  }
}

final random = Random();

class RolDice extends StatefulWidget {
  RolDice({
    super.key,
  });

  @override
  State<RolDice> createState() => _RolDiceState();
}

class _RolDiceState extends State<RolDice> {
  int dice1 = 1;
  int dice2 = 1;
  var Ganador = "Juegue";
  void rollDice() {
    // Marca las variables
    setState(() {
      dice1 = random.nextInt(6) + 1;
      dice2 = random.nextInt(6) + 1;
    });
  }

  void winnerPlayer() {
    setState(() {
      if (dice1 > dice2) {
        Ganador = 'El jugador 1 ha ganado';
      } else if (dice1 < dice2) {
        Ganador = "El jugador 2 ha ganado";
      } else if (dice1 == dice2) {
        Ganador = "Existe un empate";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //margin: EdgeInsets.only(top:70),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0x5433FF),
                Colors.black,
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Ganador,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          rollDice();
                          winnerPlayer();
                        },
                        child: Image.asset('images/dice$dice1.png'))),
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          rollDice();
                          winnerPlayer();
                        },
                        child: Image.asset('images/dice$dice2.png'))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  rollDice();
                  winnerPlayer();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Center(
                      child: Text(
                    "Roll Dice",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
