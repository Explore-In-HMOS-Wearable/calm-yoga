import { NavigationService } from '../services/NavigationService';

@ObservedV2
export class YogaViewModel {
  navigationService: NavigationService = NavigationService.getInstance();

  navigateToPage(route: string): void {
    this.navigationService.pageInfos.pushPath({ name: route })
  }
}