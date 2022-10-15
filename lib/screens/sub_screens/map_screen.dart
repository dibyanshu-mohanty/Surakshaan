import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:safety_app/secrets.dart';
import 'package:safety_app/services/get_location.dart';
import 'package:sizer/sizer.dart';
class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  String getImage(double lat, double long){
    final url = "https://api.mapbox.com/styles/v1/mapbox/light-v10/static/pin-s-l+000($long,$lat)/$long,$lat,16/600x600?"
        "access_token=$mapBoxAPI";
    return url;
  }

  String location = "";
  String city = "";
  String address="";
  String pincode="";
  bool _isLoading=true;
  var latitude;
  var longitude;

  void getCity() async{
    final response = await LocationFinder().getCityName(context);
    final data = await LocationFinder().getLocation().catchError((error){
      WidgetsBinding.instance.addPostFrameCallback((_){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
      });
    });
    if (!mounted) return;
    setState(() {
      latitude = data.latitude;
      longitude = data.longitude;
      location = response[0].subLocality;
      city = response[0].locality;
      address = response[0].street;
      pincode = response[0].postalCode;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              lkSizedBox,
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                  ),),
              ),
              Center(child: Text("Your Current Location",style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.w500,),)),
              lkSizedBox,
              _isLoading
              ? SpinKitThreeBounce(color: Colors.white,size: 20.0,)
              : Container(
                height: 100.w,
                margin: EdgeInsets.symmetric(horizontal: 12.0),
                child: Image.network(getImage(latitude, longitude),fit: BoxFit.cover,),
              ),
              lkSizedBox,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
                padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
                decoration: BoxDecoration(
                  color: Color(0xFF1B1C2C),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  leading: Icon(Icons.location_on,size: 30.0,color: Colors.white,),
                  title: Text("Address : ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 3.5.w),),
                  subtitle: _isLoading
                  ? SpinKitThreeBounce(color: Colors.white,size: 10.0,)
                      : Text(address + " , " + location + " , " + city + " , " + pincode,softWrap: true,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 4.w),),
                ),
              ),
            ],
          ),
        ));
  }
}
