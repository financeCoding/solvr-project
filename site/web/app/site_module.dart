// Copyright (c) 2013, the Solvr project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is 
// governed by a Apache license that can be found in the LICENSE file.

part of solvr_site;

class SiteModule extends WebModule {
  @override
  configure() {
    //bind(CreditProcessor).toInstance(new CreditProcessorImpl());
    //bind(BillingService).toType(BillingServiceImpl);
  }
  
  @override
  registerPages(NavigationManager navigationManager) {
    navigationManager.registerPage("about", AboutPage);
    navigationManager.registerPage("main", MainPage);
  }
}