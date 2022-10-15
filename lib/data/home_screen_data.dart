

class Utilities{
  static const _utilities = [
    {
      "id" : "police",
      "name" : "Police Stations",
      "imageUrl" : "https://res.cloudinary.com/dzt6heuso/image/upload/v1653374043/surakshaan/police_station_eub6dl.png",
    },
    {
      "id" : "hospital",
      "name" : "Hospitals",
      "imageUrl" : "https://res.cloudinary.com/dzt6heuso/image/upload/v1653374042/surakshaan/hospital_usg1vh.png",
    },
    {
      "id" : "firestation",
      "name" : "Fire Stations",
      "imageUrl" : "https://res.cloudinary.com/dzt6heuso/image/upload/v1653374043/surakshaan/firestation_qslxk9.png",
    },
    {
      "id" : "pharmacy",
      "name" : "Pharmacy",
      "imageUrl" : "https://res.cloudinary.com/dzt6heuso/image/upload/v1653374043/surakshaan/pharmacy_t4glzm.png",
    },
  ];

  List get utilities{
    return [..._utilities];
  }

  static const _securityTips = [
    "Avoid Sharing your Surakshaan ID with strangers ! They can misuse it to their advantage.",
    "Be aware of the physical emergency safety methods in order to protect yourself for a time being !",
    "Don't unnecessarily call the emergency helpline numbers out of prank or fun .",
    "Try avoiding sharing your location among Whatsapp groups etc."
  ];

  List get securityTips{
    return [..._securityTips];
  }
}