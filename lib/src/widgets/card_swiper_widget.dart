import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {

    final _screensize = MediaQuery.of(context).size;//adquiere el tamaño de la pantalla del dispositivo

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: new Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screensize.width * 0.7,//width al 70%
        itemHeight: _screensize.height * 0.5,//height al 50%
        itemBuilder: (BuildContext context,int index){
          return ClipRRect(//corta lo que esta fuera del contenedor
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'detalle', arguments: peliculas[index]),
              child: FadeInImage(
                image: NetworkImage(peliculas[index].getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
              ),
            )
          );
        },
        itemCount: peliculas.length,
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }
}