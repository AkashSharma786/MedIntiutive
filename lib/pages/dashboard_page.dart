import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profile_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int profilePageDisplayed = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.dashboard_customize_outlined,
                  size: 30,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Profile(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.supervised_user_circle_outlined,
                          color: Colors.black,
                          size: 25,
                        )),
                    const SizedBox(width: 8),
                    const Text(
                      "adityakumar2005@gmail.com",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ]),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: MediaQuery.of(context).size.height * 0.44,
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: MediaQuery.of(context).size.height * 0.44,
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height * 0.89,
                  width: MediaQuery.of(context).size.width * 0.45,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
