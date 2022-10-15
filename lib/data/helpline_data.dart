
class Helpline{
  final String name;
  final String phone;
  final String imagePath;
  
  Helpline({required this.name,required this.phone, required this.imagePath});
}

class Helplines{
  final List<Helpline> _items = [
    Helpline(name: "Police", phone: "100", imagePath: "https://res.cloudinary.com/dzt6heuso/image/upload/v1662267292/surakshaan/police_ckg0iy.png"),
    Helpline(name: "Fire Station", phone: "101", imagePath: "https://res.cloudinary.com/dzt6heuso/image/upload/v1662269691/surakshaan/firestation_cmv2ds.png"),
    Helpline(name: "Ambulance", phone: "102", imagePath: "https://res.cloudinary.com/dzt6heuso/image/upload/v1662269365/surakshaan/hospital_phgztn.png"),
    Helpline(name: "Disaster Management", phone: "108", imagePath: "https://res.cloudinary.com/dzt6heuso/image/upload/v1662268669/surakshaan/disaster_management_ivuxj1.png"),
    Helpline(name: "Women Helpline", phone: "1091", imagePath: "https://res.cloudinary.com/dzt6heuso/image/upload/v1662268673/surakshaan/women_support_mxmnp4.png"),
    Helpline(name: "Senior Citizen", phone: "1092", imagePath: "https://res.cloudinary.com/dzt6heuso/image/upload/v1662268674/surakshaan/senior_citizen_cd2raz.png"),
    Helpline(name: "LPG Leak Helpline", phone: "1906", imagePath: "https://res.cloudinary.com/dzt6heuso/image/upload/v1662268676/surakshaan/lpg_vl3k7i.png"),
    Helpline(name: "Railway Accident", phone: "1072", imagePath: "https://res.cloudinary.com/dzt6heuso/image/upload/v1662268673/surakshaan/train_kiowmj.png"),
    Helpline(name: "Road Accident", phone: "1073", imagePath: "https://res.cloudinary.com/dzt6heuso/image/upload/v1662268674/surakshaan/car_accident_gkkjjh.png"),
  ];
  List<Helpline> get items{
    return [..._items];
  }
}