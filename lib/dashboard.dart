import 'package:curso_basico_flutter/widget/pastel_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;
    TextStyle style_titles = TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Mi perfil",
          style: TextStyle(color: Colors.grey, fontSize: 18),
        )),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.notifications,
              color: Colors.grey[400],
              size: 25,
            ),
          )
        ],
        leading: Icon(
          Icons.menu,
          color: Colors.grey[400],
          size: 35.0,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            alignment: const Alignment(-1.0, 0.1),
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(25),
                ),
                width: ancho,
                height: 150,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Junior Wachapa",
                            style: style_titles,
                            textAlign: TextAlign.left,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.card_giftcard),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "SI=H-00054157624",
                                    style: style_titles,
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    "12.50",
                                    style: style_titles,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Text(
                            "Ver perfil",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 75,
                height: 75,
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.w3schools.com/w3images/avatar2.png"),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Text(
              "Resumen Septiembre 2022",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          PastelChart(
              saldoMesActual: 2.5,
              regarcaMesActual: 5.6,
              pasajemesActual: 10.5,
              saldoMesAnterior: 2.5),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Text(
              "Resumen Septiembre 2022",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.bus_alert),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Parada Favorita"),
                          Text("Mi parada Favorita")
                        ],
                      )
                    ],
                  ),
                  Text("33")
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
               LinearPercentIndicator(
                percent: 0.5,
                lineHeight: 15.0,
                progressColor: Colors.redAccent,
                backgroundColor: Colors.grey[400],
                barRadius: const Radius.circular(16),
              )
            ],
          )
        ]),
      ),
    );
  }
}
