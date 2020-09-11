class NavDrawerState {
  final NavItem selectedItem;
  const NavDrawerState(this.selectedItem);
}

enum NavItem {
  homePage,
  usedCars,
  orderPage,
  myFav,
  compareCar,
  carNews,
}