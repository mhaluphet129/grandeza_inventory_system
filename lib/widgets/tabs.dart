import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Tabs extends StatefulWidget {
  Map<String, dynamic>? tabs;
  int? selectedIndex;
  Function onChanged;
  Tabs(
      {Key? key,
      required this.tabs,
      this.selectedIndex,
      required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _Tabs();
}

class _Tabs extends State<Tabs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.tabs!.entries
            .map((e) => TabMenu(
                icon: e.value['icon'],
                label: e.key,
                onClick: () {
                  widget.onChanged(e.value['index']);
                  setState(() {
                    widget.selectedIndex = e.value['index'];
                  });
                },
                selected: widget.selectedIndex == e.value['index']))
            .toList()
      ],
    );
  }
}

class TabMenu extends StatelessWidget {
  String label;
  Function onClick;
  String icon;
  bool selected;
  TabMenu(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onClick,
      required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
          height: 50,
          width: 80,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: () => onClick(),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        width: 3,
                        decoration: BoxDecoration(
                            color: selected ? Colors.black : null),
                      ),
                    ),
                    SizedBox(
                        width: 77,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              SvgPicture.asset(
                                icon,
                                height: 30,
                                colorFilter: ColorFilter.mode(
                                    selected ? Colors.black : Colors.white,
                                    BlendMode.srcIn),
                              ),
                              Text(
                                label,
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 10,
                                    color:
                                        selected ? Colors.black : Colors.white,
                                    fontWeight:
                                        selected ? FontWeight.w900 : null),
                              )
                            ],
                          ),
                        )),
                  ],
                )),
          )),
    );
  }
}
