import 'package:geocoding/geocoding.dart';

class Geolocator{

  Future<List<double>?> getCordinates(String address)async {
    try{
      List<Location> locations = await locationFromAddress(address);
      if(locations.isNotEmpty){
        return [
          locations[0].latitude,
          locations[0].longitude
        ];
      }else{
        return null;
      }
    }catch(e){
      print("Error Occurred $e");
    }
  }


}