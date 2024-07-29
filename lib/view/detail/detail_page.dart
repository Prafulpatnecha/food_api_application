import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_api_application/modal/api_modal.dart';
import 'package:food_api_application/provider/home_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: Provider.of<HomeProvider>(context, listen: false).fetchingApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ApiModal? apiModal = snapshot.data;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 30),
                        child: Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: NetworkImage(apiModal!
                                      .recipes[homeProviderTrue.selectIndex].image),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          apiModal.recipes[homeProviderTrue.selectIndex].name,
                          style:
                              const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Text(
                          "₹${apiModal.recipes[homeProviderTrue.selectIndex].caloriesPerServing}",
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("review ${apiModal.recipes[homeProviderTrue.selectIndex].reviewCount}",style: const TextStyle(),),
                            Text("Time ${apiModal.recipes[homeProviderTrue.selectIndex].prepTimeMinutes}",style: const TextStyle(),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              RatingBar(
                                filledIcon: Icons.star,
                                emptyIcon: Icons.star_border,
                                onRatingChanged: (value) =>
                                    debugPrint(value.toString()),
                                initialRating: apiModal
                                    .recipes[homeProviderTrue.selectIndex].rating,
                                maxRating: 5,
                              ),
                              Text(
                                "  ${apiModal.recipes[homeProviderTrue.selectIndex].rating}",
                                style: const TextStyle(fontSize: 18),
                              )
                            ],
                          )),
                      const SizedBox(height: 10,),
                      const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Text('Ingredients',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            ),
                      ...List.generate(
                        apiModal.recipes[homeProviderTrue.selectIndex].ingredients
                            .length,
                        (index) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(apiModal.recipes[homeProviderTrue.selectIndex]
                                  .ingredients[index],),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text('Instructions',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                      ...List.generate(
                        apiModal.recipes[homeProviderTrue.selectIndex].instructions
                            .length,
                            (index) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(apiModal.recipes[homeProviderTrue.selectIndex]
                                  .instructions[index],),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.pinkAccent,
                  ),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  style: ButtonStyle(minimumSize: WidgetStateProperty.all(Size(200, 60),),backgroundColor: WidgetStateProperty.all(Colors.red)),
                  onPressed: () {
              }, child: Text('Add To Cart',style: TextStyle(color: Colors.black,fontSize: 20),)),
            ),
          )
        ],
      ),
    );
  }
}
