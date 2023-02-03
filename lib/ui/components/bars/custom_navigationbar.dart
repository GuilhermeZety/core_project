import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key, required this.controller, this.notifications });

  final TabController controller;
  final int? notifications;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        padding: EdgeInsets.only(top: 5, left: 1, right: 1),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          controller: widget.controller,
          indicatorPadding: EdgeInsets.only(left: 20, right: 20),
          labelPadding: EdgeInsets.symmetric(horizontal:5),
          tabs: [
            NavItem(active: widget.controller.index == 0, icon: Icon(Icons.home), title: 'Inicio',),
            NavItem(active: widget.controller.index == 1, icon: Icon(Icons.card_giftcard), title: 'Fidelidade'),
            widget.notifications == null ? NavItem(active: widget.controller.index == 2, icon: Icon(Icons.notifications), title: 'Notificações') :
            Badge.count(
              count: widget.notifications ?? 0, 
              alignment: AlignmentDirectional.topEnd,
              backgroundColor: Theme.of(context).colorScheme.error, 
              child: NavItem(
                active: widget.controller.index == 2, 
                icon: Icon(Icons.notifications), 
                title: 'Notificações'
              ),
            ),
            NavItem(active: widget.controller.index == 3, icon: Icon(Icons.menu), title: 'Mais'),     
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({super.key, this.action, required this.active, required this.title, required this.icon});

  final void Function()? action;
  final bool active;
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 60,
      width: double.infinity,
      duration: Duration(milliseconds: 300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13), textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}