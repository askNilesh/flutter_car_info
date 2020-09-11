import 'nav_drawer_state.dart';
abstract class NavDrawerEvent {
const NavDrawerEvent();
}
// this is the event that's triggered when the user
// wants to change pages
class NavigateTo extends NavDrawerEvent {
final NavItem destination;
const NavigateTo(this.destination);
}