import 'package:flutter/material.dart';
import 'package:news_app/src/pages/tab1_page.dart';
import 'package:news_app/src/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _NavegacionModel(),
        child: Scaffold(body: _Paginas(), bottomNavigationBar: _Navegacion()));
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.person_outline),
            title: Text('Para ti')),
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.public),
            title: Text('Encabezados')),
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      /* physics: BouncingScrollPhysics(), */ //para scrollear a la otra pagina
      physics: NeverScrollableScrollPhysics(), //para bloquear el scroll
      children: [Tab1Page(), Tab2Page()],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;
  set paginaActual(int valor) {
    this._paginaActual = valor;
    //notificar a todos los widgets que estan pendientes de los cambios
    //si hay un cambio, entonces que se redibujen los widgets

    _pageController.animateToPage(valor,
        duration: Duration(microseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
