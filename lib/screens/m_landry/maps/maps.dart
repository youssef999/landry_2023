import 'dart:async';
import 'package:course_app/screens/landry_y_tasks/screens/order_screen.dart';
import 'package:course_app/screens/m_landry/address/address_details.dart';
import 'package:course_app/screens/m_landry/maps/reseve_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../landry_y_tasks/models/item_model.dart';

class MapsScreen extends StatefulWidget {

  List order;
  List pricing;
  List<ItemModel>items;
  String cat, price;
  MapsScreen(
  {required this.cat, required this.price, required this.order,
    required this.pricing,required this.items}); //   cat: controller.cat,
  //   price: controller.price.toString(),
  //   order: controller.orderItems,
  //   pricing: controller.pricingList

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  Completer<GoogleMapController> _controller = Completer();
  LocationData? _currentPosition;
  LatLng? _latLong;
  bool _locating = false;
  geocoding.Placemark? _placeMark;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    _getUserLocation();
    super.initState();
  }

  Future<LocationData> _getLocationPermission() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error('Service not enabled');
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return Future.error('Permission Denied');
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  _getUserLocation() async {
    _currentPosition = await _getLocationPermission();
    _goToCurrentPosition(
        LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!));
  }

  getUserAddress() async {
    List<geocoding.Placemark> placemarks = await geocoding
        .placemarkFromCoordinates(_latLong!.latitude, _latLong!.longitude);
    setState(() {
      _placeMark = placemarks.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "عنـوان التسليم",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .45,
                  decoration: const BoxDecoration(
                      border:
                          const Border(bottom: BorderSide(color: Colors.grey))),
                  child: Stack(
                    children: [
                      GoogleMap(
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        mapType: MapType.terrain,
                        initialCameraPosition: _kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                        onCameraMove: (CameraPosition position) {
                          setState(() {
                            _locating = true;
                            _latLong = position.target;
                          });
                        },
                        onCameraIdle: () {
                          setState(() {
                            _locating = false;
                          });
                          getUserAddress();
                        },
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.location_on,
                            size: 40,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      _placeMark != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _locating
                                      ? 'Locating...'
                                      : _placeMark!.locality == null
                                          ? _placeMark!.subLocality!
                                          : _placeMark!.locality!,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      _placeMark!.subLocality!,
                                    ),
                                    Text(_placeMark!.subAdministrativeArea !=
                                            null
                                        ? '${_placeMark!.subAdministrativeArea!}, '
                                        : ''),
                                  ],
                                ),
                                Text(
                                    '${_placeMark!.administrativeArea!}, ${_placeMark!.country!}, ${_placeMark!.postalCode!}')
                              ],
                            )
                          : Container(),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                               print(_placeMark!.toJson());
                              print( _latLong.toString());


                              final box=GetStorage();
                              box.write('place', (_placeMark!.subLocality.toString()));
                              box.write('latLong', _latLong.toString());
                              box.write('check', _placeMark!.locality.toString());

                              Get.to(Maps2Screen(
                                   cat: widget.cat.toString(),
                                   price: widget.price.toString(),
                                   order:widget.order,
                                   pricing: widget.pricing,
                                   items:widget.items,
                                address1:_placeMark!.locality.toString(),
                                placemark: _placeMark!.name!.toString(),
                                 latlong:_latLong.toString(),
                                 country: _placeMark!.country.toString(),
                                city: _placeMark!.administrativeArea.toString(),
                               ));
                                   // OrderScreen(
                                   // pricing: widget.pricing,
                                   // order: widget.order,
                                   // price: widget.price,
                                   // cat: widget.cat,
                                   // address: _placeMark!.locality.toString(),
                                   // address2: _placeMark!.locality.toString(),
                                   // city: _placeMark!.administrativeArea.toString(),
                                   // status: '',
                                   // country: _placeMark!.country.toString(),
                                   // code: '',
                                   // latLong:_latLong.toString(),
                                   // placeMark: _placeMark!.name!.toString(),
                                   // time1: '',
                                   // time2: '',
                                   // phone: '',
                                   // date1: '',
                                   // date2: '',
                                   // items: widget.items));
                              },
                              child: AnimatedContainer(
                                width: 330,
                                height: 48,
                                duration: Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue,
                                      Color.fromARGB(255, 38, 83, 122)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الـتالي",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            // ElevatedButton(
                            //   onPressed: () {
                            //     print(_placeMark!.toJson());
                            //   },
                            //   child: Text('Confirm Location'),
                            // ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {


                                print(_placeMark!.toJson());
                                print( _latLong.toString());


                                final box=GetStorage();
                                box.write('place', (_placeMark!.subLocality.toString()));
                                box.write('latLong', _latLong.toString());

                                Get.to(AddressDetailsScreen(
                                    latLong:_latLong.toString(),
                                    placeMark:(_placeMark!.toJson()).toString(),
                                    cat: widget.cat,
                                    price: widget.price.toString(),
                                    order: widget.order,
                                    pricing: widget.pricing,
                                    items:widget.items,
                                    check: 'عنوان استلام',
                                ));
                              },
                              child: AnimatedContainer(
                                width: 330,
                                height: 48,
                                duration: Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue,
                                      Color.fromARGB(255, 38, 83, 122)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "ادخل العنوان بشكل يدوي ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            // ElevatedButton(
                            //   onPressed: () {
                            //     print(_placeMark!.toJson());
                            //   },
                            //   child: Text('Confirm Location'),
                            // ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _goToCurrentPosition(LatLng latlng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(latlng.latitude, latlng.longitude),
        //tilt: 59.440717697143555,
        zoom: 14.4746)));
  }
}
