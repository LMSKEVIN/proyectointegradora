# Proyecto integradora

---

> *Dedication over talent.*

## Documentación

Indíce |
---------|
 Api widget |
 Lista |
 ESP-32 |
---

## Api datos

``` dart
FutureBuilder(
              future: apiDatos(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Title(
                          color: Colors.black,
                          child: FittedBox(
                            child: Text(
                              snapshot.data['name'].toString(),
                              style: const TextStyle(
                                  fontSize: 50, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image(
                          image: AssetImage(_imgLoader(double.parse(
                              snapshot.data['main']['temp'].toString()))),
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width / 2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Text(
                                _limDatos(double.parse(snapshot.data['main']
                                            ['temp']
                                        .toString()))
                                    .toStringAsFixed(0),
                                style: const TextStyle(
                                  fontSize: 70,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  height: 30,
                                  child: FittedBox(
                                    child: Text(
                                      '°',
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: FittedBox(
                                    child: Text(
                                      'C',
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width / 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const FittedBox(
                                    child: Text(
                                      'Temperatura máxima',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(124, 4, 53, 110)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      '${_limDatos(double.parse(snapshot.data['main']['temp_max'].toString())).toStringAsFixed(0)}°C     ',
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const FittedBox(
                                    child: Text(
                                      'Sensación térmica',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(124, 4, 53, 110)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      '${_limDatos(double.parse(snapshot.data['main']['feels_like'].toString())).toStringAsFixed(0)}°C     ',
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 4,
                              width: 10,
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10.0,
                                    offset: Offset(0.0, 10.0),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width / 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const FittedBox(
                                    child: Text(
                                      'Temperatura mínima',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(124, 4, 53, 110)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      '${_limDatos(double.parse(snapshot.data['main']['temp_min'].toString())).toStringAsFixed(0)}°C',
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const FittedBox(
                                    child: Text(
                                      'Humedad',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(124, 4, 53, 110)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      '${(double.parse(snapshot.data['main']['humidity'].toString())).toStringAsFixed(0)}%',
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                } else {
                  return spinner(context);
                }
              },
            ),
```

---

## Lista

```dart
FutureBuilder(
                future: MongoDatabase.getLista(
                    DatosUsuario.devolverDatos().toString()),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data[0]['list'].length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Card(
                              child: SizedBox(
                                height: 100,
                                width: MediaQuery.of(context).size.width / 3,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          snapshot.data[0]['list'][index]
                                                  ['title']
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 25),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot.data[0]['list'][index]
                                                    ['description']
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.indigo,
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return spinner(context);
                  }
                },
              ),
```

---

## ESP-32

```dart
FutureBuilder(
              future: MongoDatabase.getArduino(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Title(
                          color: Colors.black,
                          child: FittedBox(
                            child: Text(
                              'Bienvenido ${DatosUsuario.devolverDatos().toString()}',
                              style: const TextStyle(
                                  fontSize: 50, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image(
                          image: AssetImage(_imgLoader(double.parse(snapshot
                                  .data[0]['sensores']['temperature']
                                  .toString()))
                              .toString()),
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width / 2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Text(
                                snapshot.data[0]['sensores']['temperature']
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 70,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  height: 30,
                                  child: Text(
                                    '°',
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Text(
                                    'C',
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width / 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const FittedBox(
                                    child: Text(
                                      'Calidad del aire',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(124, 4, 53, 110)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      _depurarDatos(double.parse(snapshot
                                              .data[0]['sensores']
                                                  ['air_quiality']
                                              .toStringAsFixed(0)))
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 4,
                              width: 10,
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10.0,
                                    offset: Offset(0.0, 10.0),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width / 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const FittedBox(
                                    child: Text(
                                      'Humedad',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(124, 4, 53, 110),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      '${snapshot.data[0]['sensores']['humidity'].toString()}%',
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                } else {
                  return spinner(context);
                }
              },
            ),

```

---

![Gallo_loco](https://images.vectorhq.com/images/previews/025/rooster-45755.png)
