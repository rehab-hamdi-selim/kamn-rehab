import 'package:flutter/material.dart';

class Feature {
  final String name;
  final String emoji;
  final String price; // e.g. "120/month"

  Feature({required this.name, required this.emoji, required this.price});
}

class FeatureTaggingScreen extends StatefulWidget {
  const FeatureTaggingScreen({super.key});

  @override
  State<FeatureTaggingScreen> createState() => _FeatureTaggingScreenState();
}

class _FeatureTaggingScreenState extends State<FeatureTaggingScreen> {
  List<Feature> features = [
    Feature(name: 'Hot Tubs', emoji: '🧖‍♀️', price: '120/month'),
    Feature(name: 'Personal Trainer', emoji: '🏋️‍♂️', price: '50/session'),
    Feature(name: 'Swimming Pool', emoji: '🏊‍♂️', price: '20/session'),
    Feature(name: 'Free WIFI', emoji: '📶', price: 'Free'),
    Feature(name: 'Sauna', emoji: '🔥', price: '50/session'),
    Feature(name: 'Juice Bar', emoji: '🥤', price: '120/month'),
  ];
  List<Feature> selectedFeatures = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 1,
      children: features.map((feature) {
        return Chip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${feature.emoji} ', style: const TextStyle(fontSize: 16)),
              Text(feature.name),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  feature.price,
                  style: const TextStyle(fontSize: 10, color: Colors.black87),
                ),
              ),
            ],
          ),
          deleteIcon: const Icon(Icons.close),
          onDeleted: () {
            setState(() {
              features.remove(feature);
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        );
      }).toList(),
    );
  }
}
