import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/entities/station_entity.dart';
import 'package:flutter/material.dart';

class ChargingStation extends StatelessWidget {
  final StationEntity stationEntity;

  const ChargingStation({super.key, required this.stationEntity});

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
                        stationEntity.name,
                        style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        stationEntity.address,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: screenWidth * 0.035),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      StationTimeDistanceRating(
                          availability: stationEntity.code,
                          screenWidth: screenWidth,
                          distance:
                              stationEntity.availableConnectors.toDouble(),
                          rating: stationEntity.rating),
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
                      "Connection: ${stationEntity.chargingType}",
                      style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${stationEntity.availableConnectors} points",
                      style: TextStyle(
                          fontSize: screenWidth * 0.035, color: Colors.blue),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
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

class StationTimeDistanceRating extends StatelessWidget {
  const StationTimeDistanceRating({
    super.key,
    required this.availability,
    required this.screenWidth,
    required this.distance,
    required this.rating,
  });

  final String availability;
  final double screenWidth;
  final double distance;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerLeft,
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          const Icon(Icons.access_time, size: 14, color: Colors.grey),
          const SizedBox(width: 4),
          Text(availability, style: TextStyle(fontSize: screenWidth * 0.035)),
          const SizedBox(width: 8),
          const Icon(Icons.location_on, size: 14, color: Colors.grey),
          const SizedBox(width: 4),
          Text("$distance km", style: TextStyle(fontSize: screenWidth * 0.035)),
          const SizedBox(width: 8),
          const Icon(Icons.star, size: 14, color: Colors.amber),
          const SizedBox(width: 4),
          Text(rating, style: TextStyle(fontSize: screenWidth * 0.035)),
        ],
      ),
    );
  }
}
