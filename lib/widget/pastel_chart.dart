import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:curso_basico_flutter/widget/indicator.dart';
// ignore: must_be_immutable
class PastelChart extends StatefulWidget {
  late double saldoMesActual,
      regarcaMesActual,
      pasajemesActual,
      saldoMesAnterior;
  PastelChart({
    super.key,
    required this.saldoMesActual,
    required this.regarcaMesActual,
    required this.pasajemesActual,
    required this.saldoMesAnterior,
  });

  @override
  State<StatefulWidget> createState() => PastelChartState();
}

class PastelChartState extends State<PastelChart> {
  int touchedIndex = -1;
  final formatMoney = NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    double total = (widget.saldoMesAnterior +
            widget.saldoMesActual +
            widget.pasajemesActual)
        .abs();
    double porcSaldoAnterior =
        (total == 0 ? 100 : (widget.saldoMesAnterior / total) * 100)
            .abs()
            .toDouble();
    double porcRecargasActual =
        (total == 0 ? 0 : (widget.regarcaMesActual / total) * 100)
            .abs()
            .toDouble();
    double porcUsoActual =
        (total == 0 ? 0 : (widget.pasajemesActual / total) * 100)
            .abs()
            .toDouble();

    double aspectRatio = MediaQuery.of(context).size.height > 900 ? 3 : 2;
    1.8;
    //print(MediaQuery.of(context).size.height);
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Card(
        elevation: 0,
        color: const Color(0xffEEEEEE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: const Alignment(0.0, 0.0),
                children: [
                  PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 25,
                      sections: showingSections(
                          porcSaldoAnterior, porcRecargasActual, porcUsoActual),
                    ),
                  ),
                  Text(
                    "\$${formatMoney.format(widget.saldoMesActual)}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff505050),
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Indicator(
                  color: const Color(0xfff0099cc),
                  title: '\$${formatMoney.format(widget.saldoMesAnterior)}',
                  isSquare: false,
                  description: "saldo mes anterior",
                ),
                const Text("+", style: TextStyle(fontSize: 12)),
                Indicator(
                  color: const Color(0xffFFB400),
                  title: '\$${formatMoney.format(widget.regarcaMesActual)}',
                  isSquare: false,
                  description: "recargas mes actual",
                ),
                const Text(
                  "-",
                  style: TextStyle(fontSize: 12),
                ),
                Indicator(
                  color: const Color(0xff8E06666),
                  title: '\$${formatMoney.format(widget.pasajemesActual)}',
                  isSquare: false,
                  description: "usos mes actual",
                ),
              ],
            ),
            const SizedBox(
              width: 25,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      porcentajeMesAnterior, porcentajeMesActual, porcentajeUsoActual) {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 12.0 : 9.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xffFFB400),
            value: porcentajeMesActual,
            title: '\$${formatMoney.format(widget.regarcaMesActual)}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.normal,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff0099CC),
            value: porcentajeMesAnterior,
            title: '\$${formatMoney.format(widget.saldoMesAnterior)}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.normal,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff8E06666),
            value: porcentajeUsoActual,
            title: '-\$${formatMoney.format(widget.pasajemesActual)}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.normal,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}