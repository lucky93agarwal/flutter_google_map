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

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    // TODO: implement initState

    _goToTheLake();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
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
          radius: 1000,
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