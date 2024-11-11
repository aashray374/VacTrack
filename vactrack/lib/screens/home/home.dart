import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack/router/router_const.dart';
import 'package:vactrack/widgets/home/top_list_card.dart';
import '../../widgets/home/feature_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF7B3FAF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "VakTrack",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .pushNamed(MyRouteConstants.childList);
                          },
                          child: const TopListCard(
                            icon: Icon(Icons.child_care,
                                color: Colors.white, size: 30),
                            label: 'Children',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const TopListCard(
                            icon: Icon(Icons.calendar_today,
                                color: Colors.white, size: 30),
                            label: 'Appointment',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushNamed(MyRouteConstants.mapScreen);
                          },
                          child: const TopListCard(
                            icon: Icon(Icons.location_on,
                                color: Colors.white, size: 30),
                            label: 'GPS',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom Section with Featured Content
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Featured",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: const FeatureCard(
                              icon: Icons.article,
                              label: 'Article',
                              category: 'Info')),
                      GestureDetector(
                          onTap: () {
                            print("working");
                            GoRouter.of(context).pushNamed(MyRouteConstants.allVaccines);
                          },
                          child: const FeatureCard(
                              icon: Icons.vaccines,
                              label: 'Vaccine',
                              category: 'Info')),
                      GestureDetector(
                          onTap: () {},
                          child: const FeatureCard(
                              icon: Icons.video_collection,
                              label: 'Videos',
                              category: 'Media')),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
