import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';
import '../utils/dot.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final LeadController leadController = Get.put(LeadController());


  @override
  void initState() {
    callApi();
    super.initState();
  }
  callApi()async{
    await leadController.fetchLeads();
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Insurance Samadhan",style: TextStyle(color: Colors.black),)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Obx((){
        return ListView.builder(
          itemCount: leadController.leads.length,
          itemBuilder: (context, index) {
            var lead = leadController.leads[index];
            print(leadController.leads.length);
            print("Vandana");
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4.5,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 3), // Offset in the (x, y) direction
                  ),
                ],
              ),

              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.grey], // Define your two colors here
                        stops: [0.5, 0.5], // Set the stops to 0.5 to divide the colors equally
                      ),
                    ),
                    child: const Divider(
                      color: Colors.transparent, // Set the Divider color to transparent
                      height: 1, // Set the height of the Divider
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),),
                          child:
                          Container(
                            margin: const EdgeInsets.all(10),
                            child:   Image(
                              width: 20,
                              color: Colors.red.withOpacity(0.7),
                              image: NetworkImage(
                                  lead['policyTypeDetails']['imageUrl'] ?? ''),
                            ),
                          ),
                        ),
                        const SizedBox(width: 22,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(lead["name"]!??"",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text("+91",style: TextStyle(fontSize: 16),),
                                Text(lead["mobile"]!??"",style: TextStyle(fontSize: 16),),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text("Current Status:",style: TextStyle(fontSize: 16),),
                                Text(lead["status"]!??"",style: TextStyle(fontSize: 16,color: Colors.green.shade300),),
                              ],
                            ),
                          ],)
                      ],),
                  ),
                  const SizedBox(height: 8,),
                  const MySeparator(color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                              Row(
                              children: [
                                SvgPicture.asset('assets/images/add-comment.svg'),
                                SizedBox(width: 10,height: 20,),
                                Text("add comment"),
                              ],
                            ),
                            Container(
                              height: 6,width: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors. white, // Start with a transparent color at the top
                                    Colors.red.shade400, // Your desired gradient color
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/images/status-history.svg'),
                                SizedBox(width: 10,height: 20,),
                                Text("Status Histry"),
                              ],
                            ),

                            Container(height: 6,width: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors. white, // Start with a transparent color at the top
                                    Colors.blue.shade400, // Your desired gradient color
                                  ],
                                ),
                              ),)
                          ],
                        )
                      ],),
                  )
                ],
              ),
            );
          },
        );
      }
      )
    );
  }
}
