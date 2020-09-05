import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> with TickerProviderStateMixin {
  static var barchartdisplay;
  static var piechartdisplay;

  List<charts.Series<Task, String>> _seriesDonutData;
  _generateDonutData() {
    var donutData = [
      new Task('Planlı', 18, Color(0xff3366cc)),
      new Task('Arıza', 80, Color(0xff3366cc)),
    ];
    _seriesDonutData.add(
      charts.Series(
        data: donutData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Çalışan Makine Sayısı',
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  void initState() {
    setState(
      () {
        var data = [
          addCharts("1", 13),
          addCharts("2", 23),
          addCharts("3", 27),
          addCharts("4", 9),
          addCharts("5", 17),
          addCharts("6", 31),
          addCharts("7", 18),
        ];
        var tdata = [
          addCharts("Cevaplanan", 13),
          addCharts("Cevaplanmayan", 23),
        ];

        var series = [
          charts.Series(
            domainFn: (addCharts addCharts, _) => addCharts.label,
            measureFn: (addCharts addCharts, _) => addCharts.values,
            id: 'addcharts',
            data: data,
          ),
        ];
        var tseries = [
          charts.Series(
            domainFn: (addCharts addCharts, _) => addCharts.label,
            measureFn: (addCharts addCharts, _) => addCharts.values,
            id: 'taddcharts',
            data: tdata,
          ),
        ];
        barchartdisplay = charts.BarChart(
          series,
          animationDuration: Duration(microseconds: 2000),
        );
        piechartdisplay = charts.PieChart(
          tseries,
          animationDuration: Duration(microseconds: 2000),
          behaviors: [
            new charts.DatumLegend(
              desiredMaxRows: 2,
              desiredMaxColumns: 2,
              position: charts.BehaviorPosition.bottom,
              entryTextStyle: charts.TextStyleSpec(
                fontSize: 18,
              ),
              cellPadding: EdgeInsets.symmetric(
                horizontal: 110,
              ),
            )
          ],
        );
      },
    );
    super.initState();
    _seriesDonutData = List<charts.Series<Task, String>>();
    _generateDonutData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: (MediaQuery.of(context).size.width / 2) - 20,
                    height: 330,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Yardım Bileti Açılma Oranı",
                          style: TextStyle(fontSize: 24),
                        ),
                        Container(
                          height: 290,
                          child: piechartdisplay,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: (MediaQuery.of(context).size.width / 2) - 20,
                    height: 330,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Günlük Yardım Bileti Açılma Miktarı",
                          style: TextStyle(fontSize: 24),
                        ),
                        Container(
                          height: 290,
                          child: barchartdisplay,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Text(
              "Yardım Biletleri",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Card(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
            elevation: 10,
            child: ListTile(
              title: Text(
                "Başlık",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "İçerik",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                alertDialogshow(context);
              },
            ),
          ),
          Card(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
            elevation: 10,
            child: ListTile(
              title: Text(
                "Başlık",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "İçerik",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                alertDialogshow(context);
              },
            ),
          ),
          Card(
            color: Colors.blue,
            margin: EdgeInsets.all(5),
            elevation: 10,
            child: ListTile(
              title: Text(
                "Başlık",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "İçerik",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                alertDialogshow(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void alertDialogshow(BuildContext ctx) {
    showDialog(
      context: ctx,
      // barrierDismissible: true, // dışarıya tıklayınca kapatma
      builder: (ctx) {
        return AlertDialog(
          title: Text(
            "Bilet Başlığı",
            textAlign: TextAlign.center,
          ),
          content: Column(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 900,
                    ),
                    Card(
                      color: Colors.blue,
                      margin: EdgeInsets.all(5),
                      elevation: 10,
                      child: ListTile(
                        title: Text(
                          "1. Başlık",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          "1. Mesaj",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          alertDialogshow(context);
                        },
                      ),
                    ),
                    Card(
                      color: Colors.blue,
                      margin: EdgeInsets.all(5),
                      elevation: 10,
                      child: ListTile(
                        title: Text(
                          "2. Başlık",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          "2. Mesaj",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          alertDialogshow(context);
                        },
                      ),
                    ),
                    Card(
                      color: Colors.blue,
                      margin: EdgeInsets.all(5),
                      elevation: 10,
                      child: ListTile(
                        title: Text(
                          "3. Başlık",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          "3. Mesaj",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          alertDialogshow(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Yardım Bileti Cevap',
                  ),
                  onSaved: (String value) {},
                ),
              ),
            ],
          ),
          actions: <Widget>[
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("Cevap Ver"),
                  color: Colors.green,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("Kapat"),
                  color: Colors.red,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class addCharts {
  final String label;
  final int values;
  addCharts(this.label, this.values);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;
  Task(this.task, this.taskvalue, this.colorval);
}
