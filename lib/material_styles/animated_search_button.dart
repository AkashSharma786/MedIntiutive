import 'package:flutter/material.dart';

class AnimatedSearchTextFeild extends StatefulWidget {
  const AnimatedSearchTextFeild({super.key});

  @override
  State<AnimatedSearchTextFeild> createState() =>
      _AnimatedSearchTextFeildState();
}

class _AnimatedSearchTextFeildState extends State<AnimatedSearchTextFeild> {
  bool opened = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: opened ? MediaQuery.of(context).size.width * .3 : 56,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
            boxShadow: kElevationToShadow[2]),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: opened
                    ? TextField(
                        onSubmitted: (value) {
                          setState(() {
                            opened = !opened;
                          });
                        },
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                        ),
                      )
                    : null,
              ),
            ),
            Material(
              type: MaterialType.transparency,
              child: opened
                  ? InkWell(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(32),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(32)),
                      onTap: () {
                        setState(() {
                          opened = !opened;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 10,
                        ),
                      ),
                    )
                  : InkWell(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32)),
                      onTap: () {
                        setState(() {
                          opened = !opened;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
            ),
          ],
        ));
  }
}
