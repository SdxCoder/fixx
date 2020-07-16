
import 'package:client/core/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerCustom extends StatelessWidget {
 // bool _isUser = (Modular.get<AuthService>().currentUser.user.role == Role.user);
  
  @override
  Widget build(BuildContext context) {

    return  Drawer(
      elevation: 0.0,
      child: Column(
        children: [
          DrawerHeader(
              child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_photo.jpg'),
                radius: 30,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'El Celler de Can Roca',
                textAlign: TextAlign.center,
                style: Theme.of(context).accentTextTheme.subtitle1,
              ),
              Text(
                'Carrer de Can Sunyer, 48, 17007 Girona, Spain',
                textAlign: TextAlign.center,
                style: Theme.of(context).accentTextTheme.caption,
              )
            ],
          )),
        
       
          ListTile(
            leading: Icon(FontAwesomeIcons.signOutAlt,
                color: Theme.of(context).iconTheme.color),
            title: Text(
              'Logout',
              style: Theme.of(context).accentTextTheme.subtitle1,
            ),
            onTap: () {
              
              FirebaseAuth.instance.signOut().then((value) {
                Modular.to.pushNamedAndRemoveUntil('/',  ModalRoute.withName('/'));
              });
            },
          ),
        ],
      ),
    );
  }
}


