import 'package:biz_directory/screens/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(
      initialPage: 0,
    );
    int activePage = 0;

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    double? height = MediaQuery.of(context).size.height;

    final List<Map> _pages = [
      {
        "image": "assets/images/organisation.png",
        "description":
            "Register your business, present your products, vacancies and more"
      },
      {
        "image": "assets/images/teamwork.png",
        "description":
            "Search and apply for jobs and business by service they provide"
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              PageView.builder(
                controller: controller,
                onPageChanged: (int page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return slider(
                      _pages[index]["image"], _pages[index]["description"]);
                },
              ),
            ],
          )),
          section2(height: height)
        ],
      ),
    );
  }
}

class section2 extends StatelessWidget {
  const section2({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: height * 0.40,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 25,
            ),
            button(context, "SIGN UP", "/auth/sign-up"),
            button(context, "SIGN IN", "/auth/sign-in"),
          ],
        ),
      ),
    );
  }
}

Padding button(BuildContext context, String text, String route) {
  final ButtonStyle style = OutlinedButton.styleFrom(
      padding: const EdgeInsets.all(18.0),
      side: const BorderSide(style: BorderStyle.solid),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)));
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: OutlinedButton(
        onPressed: (){
          context.go(route);
        },
        style: style,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(text), const Icon(Icons.arrow_forward)],
        )),
  );
}

Widget slider(String image, String description) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.green,
    ),
    child: Stack(
      children: [
        Center(
          child: Image(
            image: AssetImage(image),
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            alignment: AlignmentDirectional.bottomCenter,
            color: Colors.black38,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Text(
                description,
                textAlign: TextAlign.justify,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
