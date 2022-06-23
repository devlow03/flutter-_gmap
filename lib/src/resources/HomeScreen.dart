import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Login.dart';
import 'package:flutter/material.dart';
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(10.2904751,105.661449),
    zoom: 20
    );
    late GoogleMapController _googleMapController;
    // late Marker _origin;
    // late Marker _destination;

    void dispose(){
      _googleMapController.dispose();
      super.dispose();
    }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   title: const Text('My Map'),
        
      // ),
      body: SafeArea(
       
        child: Column(
          
          children: [
            SizedBox(height: 10,),
            Row(
              children: [
               
                   Expanded(
                     child: Center(
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                         child: TextField(
                          decoration: InputDecoration(
                          
                          fillColor: Colors.transparent,
                          filled: true,
                          
                          
                          hintText: 'Tìm kiếm ở đây',
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(
                            width: 0.8,
                           
                            
                          ), ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(width: 0.8),
                          ),
                    
                          prefixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: (){},
                          ),
                          suffixIcon: Icon(Icons.person_outline_sharp)
                          ),),
                       ),
                     ),
                   ),
              ],
            ),
            Expanded(
              child: GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled:true,
                // zoomControlsEnabled: false,
                initialCameraPosition: _initialCameraPosition,
                onMapCreated: (controller) => _googleMapController = controller,
                // markers: {
                //   if (_origin != null ) _origin,
                //   if (_destination != null) _destination
                // },
                // onLongPress: _addMarker,
            
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 100),
      //   child: FloatingActionButton(
          
      //      onPressed:(() => _googleMapController.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition))),
      //   child: const Icon(Icons.gps_fixed_outlined)
      //      ),
      // ),
    );
    
  }
  // void _addMarker(LatLng pos){
  //   if(_origin == null || (_origin!=null && _destination !=null)){
  //     setState(() {
  //       _origin = Marker(
  //         markerId: const MarkerId('origin'),
  //         infoWindow: const InfoWindow(title: 'Origin'),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //         position: pos
  //         );
         
  //     });
  //   }
  //   else{
  //     setState(() {
  //       _destination = Marker(
  //         markerId: const MarkerId('destination'),
  //         infoWindow: const InfoWindow(title: 'Destination'),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //         position: pos
  //         );
          
  //     });

  //   }
  // }
}

