import 'package:flutter/material.dart';


class TopNavBar extends StatelessWidget {
  final List<Widget> actions;
  final List<Widget> title;

  const TopNavBar({
    Key key,
    this.title,
    this.actions = const [],
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisSize: MainAxisSize.min,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: title ?? [
          //     Text(
          //       'Find',
          //       style: headline6.copyWith(
                 
          //       ),
          //     ),
          //     Text('Tutor',
          //         style: headline5.copyWith(
          //             height: 1, fontWeight: FontWeight.bold)),
          //   ],
          // ),
          Spacer(),
          ...actions,
          // Padding(
          //   padding: EdgeInsets.all(8),
          //   child: IconButton(
          //       iconSize: ScreenUtil().setSp(60),
          //       icon: Icon(Icons.search),
          //       onPressed: onTapSearch),
          // ),
          // GestureDetector(
          //   onTap: () {
             
          //   },
          //   child: CircleAvatar(
          //     backgroundImage: NetworkImage(
          //       Modular.get<AuthService>().currentUser.user.photoUrl ??
          //           Modular.get<AuthService>()
          //               .currentUser
          //               .user
          //               .photoPlaceholder,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
