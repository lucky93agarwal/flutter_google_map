// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



/// MapsDemo is the Main Application.
class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  Set<Circle> circles ={};
  List<LatLng> latLen = [];
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  // on below line we have created the list of markers
  add(){
    const Marker marker = Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )
    );
    setState(() {
      const MarkerId markerId = MarkerId("markerIdVal");
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }
  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      if (kDebugMode) {
        print("ERROR"+error.toString());
      }
    });

    return await Geolocator.getCurrentPosition();

  }
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    add();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(markers.values),
        circles: circles,
        polylines: _polyline,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  final Set<Polyline> _polyline = {};
  Future<void> _goToTheLake() async {
    getUserCurrentLocation().then((value) async {
      if (kDebugMode) {
        print(value.latitude.toString() +" "+value.longitude.toString());
      }

      // marker added for current users location
       Marker marker =  Marker(
        markerId:const MarkerId("2"),
        position: LatLng(value.latitude, value.longitude),
        infoWindow:const InfoWindow(
          title: 'My Current Location',
        ),
         onTap: () {
          // This is new commit.

         },
      );
      latLen.add(LatLng(value.latitude,value.longitude));

      latLen.add(LatLng(value.latitude+0.05,value.longitude+0.05));

      latLen.add(LatLng(value.latitude+0.10,value.longitude+0.10));

      latLen.add(LatLng(value.latitude+0.15,value.longitude+0.15));
      _polyline.add(
          Polyline(
            polylineId:const PolylineId('1'),
            points: latLen,
            color: Colors.blue,
            width: 2
          )
      );
      circles = {
        Circle(
          circleId: const CircleId('geo_fence_1'),
          center: LatLng(value.latitude, value.longitude),
          radius: 200,
          strokeWidth: 2,
          strokeColor: Colors.blue,
          fillColor: Colors.blue.withOpacity(0.15),
        ),
      };

      // specified current users location
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );
      final GoogleMapController controller = await _controller.future;

      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {
        const MarkerId markerId = MarkerId("markerIdVal1");
        // adding a new marker to map
        markers[markerId] = marker;
      });

    });
    // final GoogleMapController controller = await _controller.future;
    // await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }


}