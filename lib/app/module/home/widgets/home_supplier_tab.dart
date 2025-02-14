part of '../home_page.dart';

class _HomeSupplierTab extends StatelessWidget {
  final HomeController homeController;

  const _HomeSupplierTab({required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeTabHeader(
          homeController: homeController,
        ),
        Expanded(
          child: Observer(
            builder: (context) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 4000),
                child: homeController.supplierPageTypeSelected == SupplierPageType.list
                    ? _HomeSupplierList(
                        homeController: homeController,
                      )
                    : _HomeSupplierGrid(
                        homeController: homeController,
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _HomeSupplierList extends StatelessWidget {
  final HomeController _homeController;

  const _HomeSupplierList({required HomeController homeController}) : _homeController = homeController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Observer(builder: (context) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: _homeController.listSuppliersByAddress.length,
              (context, index) {
                final supplier = _homeController.listSuppliersByAddress[index];
                return _HomeSupplierListItemWidget(supplierNearbyMeModel: supplier);
              },
            ),
          );
        }),
      ],
    );
  }
}

class _HomeSupplierListItemWidget extends StatelessWidget {
  final SupplierNearbyMeModel supplierNearbyMeModel;

  const _HomeSupplierListItemWidget({required this.supplierNearbyMeModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed("/supplier/", arguments: supplierNearbyMeModel.id),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30),
              width: 1.sw,
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            supplierNearbyMeModel.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 16,
                              ),
                              Text("${supplierNearbyMeModel.distance.toStringAsFixed(2)} Km de distancia")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundColor: context.primaryColor,
                      maxRadius: 15,
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 5,
              ),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 1),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[100]!,
                    width: 5,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: NetworkImage(supplierNearbyMeModel.logo),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  final HomeController homeController;

  const _HomeSupplierGrid({required this.homeController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Observer(builder: (context) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: homeController.listSuppliersByAddress.length,
              (context, index) {
                final supplier = homeController.listSuppliersByAddress[index];
                return _HomeSupplierCardItemWidget(
                  supplierNearbyMeModel: supplier,
                );
              },
            ),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.1),
          );
        }),
      ],
    );
  }
}

class _HomeSupplierCardItemWidget extends StatelessWidget {
  final SupplierNearbyMeModel supplierNearbyMeModel;

  const _HomeSupplierCardItemWidget({required this.supplierNearbyMeModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed("/supplier/", arguments: supplierNearbyMeModel.id),
      child: Stack(
        children: [
          Card(
            margin: const EdgeInsets.only(
              top: 40,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 10, left: 10, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      supplierNearbyMeModel.name,
                      style: context.textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${supplierNearbyMeModel.distance.toStringAsFixed(2)} Km de distancia",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[200],
            ),
          ),
          Positioned(
            top: 4,
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(supplierNearbyMeModel.logo),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _HomeTabHeader extends StatelessWidget {
  final HomeController homeController;

  const _HomeTabHeader({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          const Text("Estabelecimentos"),
          const Spacer(),
          InkWell(
            onTap: () => homeController.changeTabSupplier(SupplierPageType.list),
            child: Observer(builder: (_) {
              return Icon(
                Icons.view_headline,
                color: homeController.supplierPageTypeSelected == SupplierPageType.list
                    ? Colors.black
                    : Colors.grey,
              );
            }),
          ),
          Observer(builder: (_) {
            return InkWell(
              onTap: () => homeController.changeTabSupplier(SupplierPageType.card),
              child: Icon(
                Icons.view_comfy,
                color: homeController.supplierPageTypeSelected == SupplierPageType.card
                    ? Colors.black
                    : Colors.grey,
              ),
            );
          }),
        ],
      ),
    );
  }
}
