import 'package:flutter/material.dart';
import 'package:grandeza_inventory_system/models/recentdelivery_model.dart';
import 'package:grandeza_inventory_system/utilities/constant.dart';
import 'package:grandeza_inventory_system/utilities/mockData.dart';
import 'package:grandeza_inventory_system/widgets/button.dart';
import 'package:grandeza_inventory_system/widgets/item_widgets.dart';
import 'package:intl/intl.dart';

class DeliveriesPage extends StatefulWidget {
  DeliveriesPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DeliveriesPage();
}

class _DeliveriesPage extends State<DeliveriesPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String _label = "";

    openModal(String type, dynamic args) {
      late ItemWidget _widget;
      if (args['itemWidget'] != null) {
        _widget = args['itemWidget'];
      }
      showGeneralDialog(
          context: context,
          barrierLabel: "Barrier",
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.35),
          transitionDuration: const Duration(milliseconds: 100),
          pageBuilder: (_, __, ___) {
            return Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  height: height * .5,
                  width: width * .35,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Stack(children: [
                    if (type == 'new')
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const DefaultTextStyle(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Nunito'),
                                    child: Text('New Delivery')),
                                const SizedBox(
                                  height: 10,
                                ),
                                ItemWidgets(
                                  mode: type,
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Button(
                                  label: 'ADD NEW DELIVERY',
                                  paddingHorizontal: 30,
                                  paddingVertical: 7,
                                  fontSize: 15,
                                  onPress: () {},
                                  type: "default"),
                            )
                          ],
                        ),
                      ),
                    if (type == 'update')
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const DefaultTextStyle(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal),
                                    child: Text('Update Item Delivery Count')),
                                const SizedBox(
                                  height: 10,
                                ),
                                ItemWidget(
                                    withRemoveButton: false,
                                    remove: () => _widget.remove(),
                                    total: _widget.total,
                                    label: _widget.label)
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Button(
                                  label: 'SAVE',
                                  paddingHorizontal: 50,
                                  paddingVertical: 7,
                                  fontSize: 15,
                                  onPress: () {},
                                  type: "default"),
                            )
                          ],
                        ),
                      ),
                    Positioned(
                        top: 5,
                        right: 5,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.close_rounded,
                                size: 35,
                              )),
                        ))
                  ]),
                ),
              ),
            );
          });
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Button(
                label: 'NEW DELIVERY',
                paddingHorizontal: 40,
                paddingVertical: 10,
                fontSize: 20,
                onPress: () {
                  openModal("new", {});
                },
                type: "default"),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width,
              child: PaginatedDataTable(
                header: SizedBox(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Item Logs',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: .5,
                        decoration: const BoxDecoration(color: Colors.black),
                      )
                    ],
                  ),
                ),
                columns: const [
                  DataColumn(
                      label: SizedBox(
                    child: Text(
                      'Item ID',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                  DataColumn(
                      label: SizedBox(
                    child: Text(
                      'Item',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                  DataColumn(
                      label: SizedBox(
                    child: Text(
                      'Quantity',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                  DataColumn(
                      label: SizedBox(
                    child: Text(
                      'Type',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                  DataColumn(
                      label: SizedBox(
                    child: Text(
                      'Date Delivered',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                  DataColumn(
                      label: SizedBox(
                    child: Text(
                      'Functions',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                ],
                source: CustomColumns(
                    list: recentDelivery,
                    openModal: (ItemWidget _widget) =>
                        openModal("update", {"itemWidget": _widget})),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomColumns extends DataTableSource {
  List<RecentDelivery> list;
  Function openModal;
  CustomColumns({required this.list, required this.openModal});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(list[index].itemId.id)),
      DataCell(Text(list[index].itemId.name)),
      DataCell(Text(list[index].quantity.toString())),
      DataCell(Text(list[index].itemId.type)),
      DataCell(Text(
          DateFormat("MMMM dd, yyyy").format(list[index].date).toString())),
      DataCell(MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => openModal(ItemWidget(
              remove: () {},
              total: list[index].quantity,
              label: list[index].itemId.name)),
          child: Icon(
            Icons.mode_edit_rounded,
            color: defaultColor,
          ),
        ),
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;
}
