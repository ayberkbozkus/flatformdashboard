import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with TickerProviderStateMixin {
  static var barchartdisplay;
  static var piechartdisplay;
  String dropdownVar = "Bildirim Kimlere Atılacak";

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
          addCharts("Arıza", 13),
          addCharts("Bilgilendirme", 23),
          addCharts("Güncelleme", 3),
          addCharts("Destek", 17),
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
              desiredMaxRows: 4,
              desiredMaxColumns: 4,
              position: charts.BehaviorPosition.bottom,
              entryTextStyle: charts.TextStyleSpec(
                fontSize: 18,
              ),
              cellPadding: EdgeInsets.symmetric(
                horizontal: 40,
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
            height: 10,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Container(
                        width: (MediaQuery.of(context).size.width / 2) - 20,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(17.5),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Bildirim Konu Dağılımı",
                                style: TextStyle(fontSize: 24),
                              ),
                              Container(
                                height: 220,
                                child: piechartdisplay,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: (MediaQuery.of(context).size.width / 2) - 20,
                        height: 290,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Günlük Atılan Bildirim Miktarı",
                                style: TextStyle(fontSize: 24),
                              ),
                              Container(
                                height: 220,
                                child: barchartdisplay,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 600,
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Bildirim Oluştur",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Bildirim Konusu',
                              ),
                              onSaved: (String value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: TextFormField(
                              maxLines: 3,
                              decoration: const InputDecoration(
                                labelText: 'Bildirim Mesajı',
                              ),
                              onSaved: (String value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Bildirim Atılma Zamanı',
                              ),
                              onSaved: (String value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: DropdownButton(
                              hint: Text(dropdownVar),
                              items: [
                                DropdownMenuItem(
                                  child: Text("İşçiler"),
                                  value: "isci",
                                ),
                                DropdownMenuItem(
                                  child: Text("Operatör"),
                                  value: "operator",
                                ),
                                DropdownMenuItem(
                                  child: Text("Bigdata Ekip"),
                                  value: "bigdataekip",
                                )
                              ],
                              onChanged: (String selected) {
                                setState(() {
                                  dropdownVar = selected;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Bildirim Önem Derecesi',
                              ),
                              onSaved: (String value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Bildirim İçin Not',
                              ),
                              onSaved: (String value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "Gönder",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: Text(
                      "Bildirimler",
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
                      onTap: () {},
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
                      onTap: () {},
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
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
