import 'package:flutter/material.dart';
import 'package:grandeza_inventory_system/utilities/constant.dart';

class ItemWidgets extends StatefulWidget {
  Function? onAdd;
  String? mode;
  List<ItemWidget>? list;
  ItemWidgets({Key? key, this.onAdd, this.list, this.mode}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ItemWidgets();
}

class _ItemWidgets extends State<ItemWidgets> {
  String _label = "";
  List<ItemWidget> list = [];
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    if (widget.list != null && widget.list!.isNotEmpty) {
      list.addAll(widget.list!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: textController,
          onChanged: (value) => setState(() {
            _label = value;
          }),
          decoration: InputDecoration(
              filled: true,
              labelText: 'Name',
              floatingLabelStyle: const TextStyle(fontSize: 18),
              fillColor: defaultGrey,
              suffixIcon: IconButton(
                icon: const Icon(Icons.chevron_right_rounded),
                onPressed: () {
                  int index = list.length;
                  if (_label != "") {
                    list.add(ItemWidget(
                        withRemoveButton: true,
                        remove: () {
                          setState(() {
                            list.removeAt(index);
                          });
                        },
                        total: 0,
                        label: _label));

                    if (widget.onAdd != null) {
                      widget.onAdd!(_label);
                    }
                    textController.clear();
                    setState(() {
                      _label = "";
                    });
                  }
                },
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0, color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0, color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              )),
          validator: (String? value) {
            if (value == null || value.isEmpty) {}
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: list,
        )
      ],
    );
  }
}

class ItemWidget extends StatefulWidget {
  Function remove;
  int total;
  String label;
  bool? withRemoveButton;
  ItemWidget(
      {Key? key,
      required this.remove,
      required this.total,
      required this.label,
      this.withRemoveButton})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ItemWidget();
}

class _ItemWidget extends State<ItemWidget> with TickerProviderStateMixin {
  double _scaleTransformValue = 1;
  int selectedIndex = -1;
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() => _scaleTransformValue = 1 - animationController.value);
      });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          child: Row(children: [
            if (widget.withRemoveButton!)
              Transform.scale(
                scale: selectedIndex == 2 ? _scaleTransformValue : 1,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                      onTap: () {
                        widget.remove();
                        setState(() {
                          selectedIndex = 2;
                        });

                        animationController.forward();
                        Future.delayed(
                          const Duration(milliseconds: 100),
                          () {
                            animationController.reverse();
                          },
                        );
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(.25),
                            borderRadius: BorderRadius.circular(100)),
                        child: const Center(
                          child: Text('-',
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 20)),
                        ),
                      )),
                ),
              ),
            if (widget.withRemoveButton!)
              const SizedBox(
                width: 15,
              ),
            Text(
              widget.label,
              style: const TextStyle(fontSize: 20),
            )
          ]),
        ),
        Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(
            width: 50,
            height: 35,
            child: TextFormField(
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              readOnly: true,
              enabled: false,
              decoration: InputDecoration(
                filled: true,
                fillColor: defaultGrey,
                hintText: widget.total.toString(),
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Transform.scale(
            scale: selectedIndex == 0 ? _scaleTransformValue : 1,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                width: 40,
                height: 35,
                decoration: BoxDecoration(
                  color: defaultGrey2.withOpacity(.25),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: GestureDetector(
                    onTap: () {
                      animationController.forward();
                      Future.delayed(
                        const Duration(milliseconds: 100),
                        () {
                          animationController.reverse();
                        },
                      );
                      setState(() {
                        widget.total++;
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 35,
                      decoration: BoxDecoration(
                        color: defaultGrey2.withOpacity(.25),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.add_rounded,
                        color: Color(0xff222222),
                      ),
                    )),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Transform.scale(
            scale: selectedIndex == 1 ? _scaleTransformValue : 1,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                width: 40,
                height: 35,
                decoration: BoxDecoration(
                  color: defaultGrey2.withOpacity(.25),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: GestureDetector(
                    onTap: () {
                      animationController.forward();
                      Future.delayed(
                        const Duration(milliseconds: 100),
                        () {
                          animationController.reverse();
                        },
                      );
                      setState(() {
                        if (widget.total > 1) {
                          widget.total--;
                          selectedIndex = 1;
                        }
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 35,
                      decoration: BoxDecoration(
                        color: defaultGrey2.withOpacity(.25),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          '-',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff222222)),
                        ),
                      ),
                    )),
              ),
            ),
          )
        ])),
      ],
    );
  }
}
