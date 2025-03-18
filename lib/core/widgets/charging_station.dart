import 'package:ev_charging/constants.dart';
import 'package:flutter/material.dart';

class ChargingStation extends StatelessWidget {
  final String name;
  final String address;
  final String availability;
  final double distance;
  final double rating;
  final String connection;
  final int points;
  final VoidCallback onDirectionTap;

  const ChargingStation({
    super.key,
    required this.name,
    required this.address,
    required this.availability,
    required this.distance,
    required this.rating,
    required this.connection,
    required this.points,
    required this.onDirectionTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // Wrap everything inside a Column to avoid overflow
          mainAxisSize: MainAxisSize.min, // Let it size itself dynamically
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: const AssetImage('assets/images/charging_cars.webp'),
                    width: screenWidth * 0.22, // Responsive width
                    height: screenWidth * 0.22, // Responsive height
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),

                // Expanded to prevent overflow
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        address,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: screenWidth * 0.035),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.access_time,
                              size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(availability,
                              style: TextStyle(fontSize: screenWidth * 0.035)),
                          const SizedBox(width: 8),
                          const Icon(Icons.location_on,
                              size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text("$distance km",
                              style: TextStyle(fontSize: screenWidth * 0.035)),
                          const SizedBox(width: 8),
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text("$rating",
                              style: TextStyle(fontSize: screenWidth * 0.035)),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Connection: $connection",
                      style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "$points points",
                      style: TextStyle(
                          fontSize: screenWidth * 0.035, color: Colors.blue),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: onDirectionTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kSecondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.025,
                        horizontal: screenWidth * 0.05),
                  ),
                  child: Text("Get direction",
                      style: TextStyle(
                          color: Colors.white, fontSize: screenWidth * 0.035)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
