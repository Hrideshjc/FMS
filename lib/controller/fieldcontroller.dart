import 'package:VMS/model/homepage_model.dart';

import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxString searchFutsal = "".obs;
  RxString initialImage = "".obs;
  RxString initialName = "".obs;
  RxString intialPrice = "".obs;

  List<Futsal> futsals = [
    Futsal("Wembly Futsal", 1200,
        "https://images.unsplash.com/photo-1630420598913-44208d36f9af?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZnV0c2FsfGVufDB8fDB8fHww"),
    Futsal("Bodey Futsal", 800,
        "https://media.istockphoto.com/id/1383857924/photo/soccer-player-kicking-ball-at-goal.webp?b=1&s=170667a&w=0&k=20&c=g7PpOT31hsoS9klAI7b9XfAHKIGoas86VtymZkfMuZ8="),
    Futsal("North Point Futsal", 1000,
        "https://media.istockphoto.com/id/990901440/photo/amateur-soccer-defense-player-intercepting-the-offense-action.jpg?s=612x612&w=0&k=20&c=M38T9E_tffjKfLhUTEL11-kz7bqNfAAbheLUWDaOJUw=")
  ];

  List<Futsal> get filteredFutsal => futsals
      .where((futsal) =>
          futsal.name.toLowerCase().contains(searchFutsal.value.toLowerCase()))
      .toList();


      
}
