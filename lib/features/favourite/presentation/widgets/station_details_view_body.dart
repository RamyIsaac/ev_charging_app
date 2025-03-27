import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/widgets/charging_station.dart';
import 'package:ev_charging/core/widgets/show_snack_bar.dart';
import 'package:ev_charging/features/enRoute/presentation/widgets/custom_backround_image.dart';
import 'package:flutter/material.dart';

class StationDetailsViewBody extends StatelessWidget {
  const StationDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  'Bloom Charging Station',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                StationTimeDistanceRating(
                  availability: '24/7',
                  screenWidth: MediaQuery.of(context).size.width,
                  distance: 5.5,
                  rating: 5,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    'the address kdhhkad aksudk of the station.the address of the station.'),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Connection Type',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ConnectionTypeCard(
                        type: ConnectionType(
                            name: "CCS2",
                            power: "150kw",
                            price: "\$0.05/kw",
                            available: 2,
                            taken: 0),
                      ),
                      ConnectionTypeCard(
                        type: ConnectionType(
                            name: "CCS",
                            power: "120kw",
                            price: "\$0.05/kw",
                            available: 0,
                            taken: 3),
                      ),
                      ConnectionTypeCard(
                        type: ConnectionType(
                            name: "Menneker",
                            power: "22kw",
                            price: "\$0.02/kw",
                            available: 2,
                            taken: 0),
                      ),
                    ],
                  ),
                ),
                const ReviewWidget(
                    averageRating: 4.5,
                    totalReviews: 25,
                    starRatings: {5: 101, 4: 12, 3: 7, 2: 4, 1: 2})
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const CustomBackgroundImage(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFavourite = !isFavourite;
                  if (isFavourite) {
                    showSnackBar(context, 'Station Added to Favourite');
                  } else {
                    showSnackBar(context, 'Station Removed from Favourite');
                  }
                });
              },
              icon: Icon(
                Icons.favorite,
                color: isFavourite ? kSecondaryColor : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.black,
              ),
            ),
          ]),
        ],
      ),
    ]);
  }
}

class ConnectionTypeWidget extends StatelessWidget {
  final List<ConnectionType> connectionTypes = [
    ConnectionType(
        name: "CCS2",
        power: "150kw",
        price: "\$0.05/kw",
        available: 2,
        taken: 0),
    ConnectionType(
        name: "CCS",
        power: "120kw",
        price: "\$0.05/kw",
        available: 0,
        taken: 3),
    ConnectionType(
        name: "Mennekers",
        power: "22kw",
        price: "\$0.02/kw",
        available: 2,
        taken: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Connection type",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: connectionTypes
              .map((type) => ConnectionTypeCard(type: type))
              .toList(),
        ),
      ],
    );
  }
}

class ConnectionTypeCard extends StatelessWidget {
  final ConnectionType type;

  const ConnectionTypeCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    bool isAvailable = type.available > 0;
    return Container(
      width: 110,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 1)
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.electrical_services, color: Colors.blue, size: 30),
          const SizedBox(height: 6),
          Text(type.name,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          const SizedBox(height: 4),
          Text(type.power,
              style: const TextStyle(fontSize: 14, color: Colors.black54)),
          Text(type.price,
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
          const SizedBox(height: 6),
          Text(
            "${type.available}/${type.available + type.taken} ${isAvailable ? 'taken' : 'taken'}",
            style: TextStyle(
                color: isAvailable ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ConnectionType {
  final String name;
  final String power;
  final String price;
  final int available;
  final int taken;

  ConnectionType({
    required this.name,
    required this.power,
    required this.price,
    required this.available,
    required this.taken,
  });
}

class ReviewWidget extends StatelessWidget {
  final double averageRating;
  final int totalReviews;
  final Map<int, int> starRatings; // {5: 101, 4: 12, 3: 7, 2: 4, 1: 2}

  const ReviewWidget({
    super.key,
    required this.averageRating,
    required this.totalReviews,
    required this.starRatings,
  });

  @override
  Widget build(BuildContext context) {
    int maxRatingCount = starRatings.values.reduce((a, b) => a > b ? a : b);

    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Review",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      averageRating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < averageRating.floor()
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 18,
                        );
                      }),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "($totalReviews reviews)",
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: starRatings.entries.map((entry) {
                      return RatingBar(
                        stars: entry.key,
                        count: entry.value,
                        maxCount: maxRatingCount,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int stars;
  final int count;
  final int maxCount;

  const RatingBar({
    super.key,
    required this.stars,
    required this.count,
    required this.maxCount,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = count / (maxCount > 0 ? maxCount : 1);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text("$stars star", style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 6),
          Expanded(
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey.shade300,
              color: Colors.blue,
              minHeight: 8,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(width: 6),
          Text("$count", style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
