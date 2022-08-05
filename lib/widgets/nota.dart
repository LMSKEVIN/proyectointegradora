import 'package:flutter/material.dart';

Container notaCompleta(BuildContext context, String title , String description){
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
                                        Text(title,
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
                                          child: Text(description,
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
}