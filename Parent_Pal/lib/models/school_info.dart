class SchoolInfo {
  final String name;
  final String? address; // Existing address field
  final double latitude;
  final double longitude;
  final String? imageUrl; // Make imageUrl nullable (optional)
  final String? description; // Make description nullable (optional)

  // Add a new field to store retrieved address
  String? retrievedAddress;

  SchoolInfo({
    required this.name,
    this.address,
    required this.latitude,
    required this.longitude,
    this.retrievedAddress,
    this.imageUrl,
    this.description,
  });
}