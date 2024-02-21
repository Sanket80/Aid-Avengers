class CategoryData {
  final String category;
  final int count;
  final String organization;
  final String description;
  final double latitude;  // Add latitude property
  final double longitude; // Add longitude property

  CategoryData({
    required this.category,
    required this.count,
    required this.organization,
    required this.description,
    required this.latitude,
    required this.longitude,
  });
}


class CategoryDataRepository {
  static Map<String, List<CategoryData>> categoryData = {
    'Food': [
      CategoryData(
        category: 'Water',
        count: 2,
        organization: 'Food Organization 1',
        description: 'Food assistance. This is a longer description to showcase how you can include more details about the help provided by this category. It can include information about the types of food provided, the frequency of food distribution, and any specific considerations for different situations. For example, this organization specializes in providing clean drinking water in emergency situations.',
        latitude: 12.34,  // Add latitude value for Water
        longitude: 56.78, // Add longitude value for Water
      ),
      CategoryData(
        category: 'Food',
        count: 2,
        organization: 'Food Organization 2',
        description: 'Food assistance. This is a longer description to showcase how you can include more details about the help provided by this category. It can include information about the types of food provided, the frequency of food distribution, and any specific considerations for different situations. For example, this organization focuses on providing a variety of nutritious meals to affected communities.',
        latitude: 19.0169152339643,  // Add latitude value for Food
        longitude: 73.09627963399967, // Add longitude value for Food
      ),
      // Add more helps and organizations for the 'Food' category
    ],

    'Medical': [
      CategoryData(
        category: 'Ambulance',
        count: 2,
        organization: 'NDRF',
        description: 'Emergency medical transportation. This is a longer description to showcase how you can include more details about the help provided by this category. It can include information about the types of medical emergencies covered, response times, and any specialized features of the ambulance service. For example, this organization provides rapid ambulance services during natural disasters.',
        latitude: 23.45,  // Add latitude value for Ambulance
        longitude: 67.89, // Add longitude value for Ambulance
      ),
      CategoryData(
        category: 'First Aid',
        count: 2,
        organization: 'Medical Organization 2',
        description: 'Basic first aid assistance. This is a longer description to showcase how you can include more details about the help provided by this category. It can include information about the types of first aid services offered, training provided, and any specific considerations for different situations. For example, this organization specializes in providing first aid training to communities.',
        latitude: 34.56,  // Add latitude value for Medical
        longitude: 78.91, // Add longitude value for Medical
      ),
      // Add more helps and organizations for the 'Medical' category
    ],

    'Human Resources': [
      CategoryData(
        category: 'Human Resources Help 1',
        count: 2,
        organization: 'Human Resources Organization 1',
        description: 'Assistance in human resource management. This is a longer description to showcase how you can include more details about the help provided by this category. It can include information about the specific areas of HR management covered, such as recruitment, training, and employee relations. For example, this organization supports affected businesses in managing their human resources during crises.',
        latitude: 34.56,  // Add latitude value for Human Resources Help 1
        longitude: 78.91, // Add longitude value for Human Resources Help 1
      ),
      // Add more helps and organizations for the 'Human Resources' category
    ],

    'Search and Rescue': [
      CategoryData(
        category: 'Search and Rescue Help 1',
        count: 2,
        organization: 'Search and Rescue Organization 1',
        description: 'Search and rescue operations. This is a longer description to showcase how you can include more details about the help provided by this category. It can include information about the types of search and rescue missions conducted, equipment used, and collaboration with emergency services. For example, this organization specializes in urban search and rescue missions during disasters.',
        latitude: 45.67,  // Add latitude value for Search and Rescue Help 1
        longitude: 89.12, // Add longitude value for Search and Rescue Help 1
      ),
      // Add more helps and organizations for the 'Search and Rescue' category
    ],
  };
}