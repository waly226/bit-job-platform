import 'package:get/get.dart';


  class CoreController extends GetxController {
  static CoreController instance = Get.find();
    List<Map<String, dynamic>> data = [
        {
        'company_name': "SAP",
        "identifiant": "bit226",
        'image_path': 'assets/images/sap.png',
        'offer_name': 'Full Stack developer'
      },
     
      {
        'company_name': "EdX",
        "identifiant": "bit226",
        'image_path': 'assets/images/edx.png',
        'offer_name': 'Project Manager'
      },
      {
        'company_name': "Krones",
        "identifiant": "krones226",
        'image_path': 'assets/images/Krones.png',
        'offer_name': 'Web Developer'
      },
      {
        'company_name': "Technical University of Munich",
        "identifiant": "ftx226",
        'image_path': 'assets/images/tum.png',
        'offer_name': 'IT Manager'
      },
      {
        'company_name': "FH Joanneum",
        "identifiant": "bit226",
        'image_path': 'assets/images/fh.png',
        'offer_name': 'Electrical Engineer'
      },
      {
         'company_name': "Futurix SARL",
        "identifiant": "ftx226",
        'image_path': 'assets/citera.jpeg',
        'offer_name': 'UI/UX Designer'
      },
      {
         'company_name': "Futurix SARL",
        "identifiant": "ftx226",
        'image_path': 'assets/bit.png',
        'offer_name': 'UI/UX Designer'
      },
      {
        'company_name': "Krones",
        "identifiant": "krones226",
        'image_path': 'assets/citera.jpeg',
        'offer_name': 'Frontend Developper'
      },
      {
        'company_name': "Burkina Institute of Technology",
        "identifiant": "bit226",
        'image_path': 'assets/bit.png',
        'offer_name': 'Backend Developper'
      },
      {
         'company_name': "Futurix SARL",
        "identifiant": "ftx226",
        'image_path': 'assets/citera.jpeg',
        'offer_name': 'UI/UX Designer'
      },
      {
        'company_name': "Burkina Institute of Technology",
        "identifiant": "bit226",
        'image_path': 'assets/bit.png',
        'offer_name': 'Senior DevOps'
      },
      {
        'company_name': "Krones",
        "identifiant": "krones226",
        'image_path': 'assets/citera.jpeg',
        'offer_name': 'Senior UI Designer'
      },
    
    ];

    List<String> get jobsList =>
      data.map((item) => item['offer_name'] as String).toList();

  List<String> get companiesList =>
      data.map((item) => item['company_name'] as String).toList();

  List<String> get companiesLogos =>
      data.map((item) => item['image_path'] as String).toList();
}

  /*final List<String> recommendedOffers = [
    'Senior UI Designer',
    'Senior DevOps',
    'UI/UX Designer',
    'Backend Developper',
    'FrontEnd Developper',
  ];
  final List<String> recommendedCompanies = [
    'Futurix',
    'Krones',
    'Microsoft',
    'Stern Stewart',
    'Siemens',
  ];
  final List<String> recentlyJobs = [
    'Senior UI Designer',
    'Senior DevOps',
    'UI/UX Designer',
    'Backend Developper',
    'FrontEnd Developper',
    'Senior UI Designer',
    'Senior DevOps',
    'UI/UX Designer',
    'Backend Developper',
    'FrontEnd Developper',
  ];
  final List<String> categories = [
    'All Type',
    'Full Time',
    'Part Time',
    'Remote',
    'Freelance',
    'Internship'
  ];
*/

