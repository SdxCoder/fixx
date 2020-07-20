import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class IntroView extends StatelessWidget {
  final String btnText;
  final String image;
  final String title;
  final String description;
  final Function onPressed;
  final bool readMore;

  const IntroView({
    Key key,
    this.btnText,
    this.image,
    this.title,
    this.description,
    this.onPressed,
    this.readMore = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Wrap(children: [
                Text(description, style: Theme.of(context).textTheme.bodyText1),
                (readMore)
                    ? GestureDetector(
                        onTap: () {
                          print("read more");
                        },
                        child: Text("Read more here",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.accentColor)),
                      )
                    : Offstage()
              ])

            
              ),
          Spacer(),
          SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width * 0.6,
            child: raisedButton(
                btnText: btnText,
                btnColor: AppTheme.accentColor,
                onPressed: onPressed),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class IntroLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntroView(
        btnText: "Allow Location",
        image: "assets/location.png",
        description:
            "Share your loaction with us and we will help you do just that(oh - and the best price too) ",
        title: "Find the best service provider in the your area!",
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => IntroNotification()));
        },
      ),
    );
  }
}

class IntroNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroView(
      btnText: "Turn on notification",
      image: "assets/notifications.png",
      description:
          "Turn on notifications and we will help you manage your appointmants with booking reminders, salon directions and easy rescheduling if you plans change",
      title: "Manage your booking easily",
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => IntroExplore()));
      },
    );
  }
}

class IntroExplore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroView(
      btnText: "Start Exploring",
      image: "assets/explore.png",
      description:
          "We show data to show you more of what you care about and less what you don't. You can read more here",
      title: "Book your next treatment",
      readMore: true,
      onPressed: () {
        Modular.to.pushReplacementNamed(Routes.selectRole);
      },
    );
  }
}
