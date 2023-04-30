import 'package:flutter/material.dart';
import 'package:grandeza_inventory_system/models/recentdelivery_model.dart';
import 'package:grandeza_inventory_system/models/sales.dart';
import 'package:grandeza_inventory_system/screens/dashboard/components/card.dart';
import 'package:grandeza_inventory_system/utilities/constant.dart';
import 'package:grandeza_inventory_system/utilities/mockData.dart'; //mock
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double dataTableWidth = width * .71;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: height * .15,
              child: Row(
                children: [
                  CustomCard(
                    title: "Total Sales",
                    content: '$PESO 30,000',
                    icon: Icons.zoom_in,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomCard(
                    title: "Total Number of Sales",
                    content: '123',
                    icon: Icons.zoom_out,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Card(
                  elevation: 20,
                  child: SizedBox(
                    width: dataTableWidth,
                    height: height * .4,
                    child: PaginatedDataTable(
                      header: SizedBox(
                        width: dataTableWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'Recent Deliveries',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: .5,
                              decoration:
                                  const BoxDecoration(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      rowsPerPage: 3,
                      columns: [
                        DataColumn(
                            label: SizedBox(
                          width: dataTableWidth * .20,
                          child: const Text(
                            'Delivery Id',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                        const DataColumn(
                            label: Text(
                          'Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: SizedBox(
                          width: dataTableWidth * .20,
                          child: const Text(
                            'Item',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                        const DataColumn(
                            label: Text(
                          'Quantity',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ],
                      source: CustomColumns(list: recentDelivery),
                    ),
                  ),
                ),
                Card(
                  elevation: 20,
                  child: Container(
                    height: height * .4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: SfCircularChart(
                        title: ChartTitle(
                          text: 'Top Selling Products',
                          alignment: ChartAlignment.near,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        legend: Legend(
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.scroll,
                          position: LegendPosition.bottom,
                        ),
                        series: <CircularSeries>[
                          PieSeries<Sales, String>(
                              dataSource: salesList,
                              dataLabelSettings: const DataLabelSettings(
                                  isVisible: true,
                                  labelPosition: ChartDataLabelPosition.outside,
                                  textStyle: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold)),
                              dataLabelMapper: (Sales data, _) =>
                                  data.quantity.toString(),
                              xValueMapper: (Sales data, _) => data.itemId.name,
                              yValueMapper: (Sales data, _) => data.quantity)
                        ]),
                  ),
                )
              ],
            ),
            Card(
              elevation: 20,
              child: SizedBox(
                width: width,
                height: height * .4,
                child: PaginatedDataTable(
                  header: SizedBox(
                    width: dataTableWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Recent Sales',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: .5,
                          decoration: const BoxDecoration(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  rowsPerPage: 3,
                  columns: [
                    DataColumn(
                        label: SizedBox(
                      width: dataTableWidth * .20,
                      child: const Text(
                        'Item',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                    const DataColumn(
                        label: Text(
                      'Quantity',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: SizedBox(
                      width: dataTableWidth * .20,
                      child: const Text(
                        'Amount',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                  ],
                  source: CustomColumns2(list: salesList),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomColumns extends DataTableSource {
  List<RecentDelivery> list;
  CustomColumns({required this.list});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(list[index].id)),
      DataCell(Text(
          DateFormat("MMMM dd, yyyy").format(list[index].date).toString())),
      DataCell(Text(list[index].itemId.name)),
      DataCell(Text(list[index].quantity.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;
}

class CustomColumns2 extends DataTableSource {
  List<Sales> list;
  CustomColumns2({required this.list});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(list[index].itemId.name)),
      DataCell(Text(list[index].quantity.toString())),
      DataCell(Text('$PESO ${list[index].amount}')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;
}
