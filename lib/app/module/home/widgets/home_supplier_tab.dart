part of '../home_page.dart';

class _HomeSupplierTab extends StatelessWidget {
  final HomeController homeController;

  const _HomeSupplierTab({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeTabHeader(
          homeController: homeController,
        ),
        Observer(
          builder: (context) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 4000),
              child: homeController.supplierPageTypeSelected == SupplierPageType.list
                  ? _HomeSupplierList()
                  : _HomeSupplierGrid(),
            );
          },
        ),
      ],
    );
  }
}

class _HomeSupplierList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text("List");
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text("Griel");
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
