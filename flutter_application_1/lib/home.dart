import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controllerValor = TextEditingController();
  final TextEditingController controllerPessoas = TextEditingController();
  // final TextEditingController controllerBebidas = TextEditingController();
  final TextEditingController controllerValorBebida = TextEditingController();

  final TextEditingController controllerPessoasBebida = TextEditingController();
  double valor = 0;
  int pessoas = 0;
  bool bebida = false;
  int pessoasBebidas = 0;
  double valorBebida = 0;
  double resul = 0;
  double resulB = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(110, 224, 138, 255),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 224, 138, 255),
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(3, 7),
                        color: Colors.black26,
                      ),
                    ]),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 10, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Qual o valor do rolê ?",
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400),
                          ),
                          Text("💰 💸")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9 .]')),
                        ],
                        onSubmitted: (value) {
                          setState(() {
                            valor = double.tryParse(value) ?? 0;
                            if (valor <= 0) {
                              print("O valor informado é invalido");
                            } else {
                              print("O valor informado é $valor");
                            }
                          });
                          resultadoFinal();
                        },
                        controller: controllerValor,
                        decoration: InputDecoration(
                          icon: IconButton(
                            onPressed: () {
                              valor =
                                  double.tryParse(controllerValor.text) ?? 0;
                              if (valor <= 0) {
                                print("O valor informado é invalido");
                              } else {
                                print("O valor informado é $valor");
                              }

                              resultadoFinal();
                            },
                            icon: const Icon(
                              Icons.monetization_on,
                              size: 40,
                            ),
                          ),
                          labelText: "valor",
                          hintText: "Ex.: 234.50",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.purpleAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.purple)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 138, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(3, 7),
                          color: Colors.black26)
                    ]),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(
                        children: [
                          Text(
                            "Quantidade total de pessoas?",
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        onSubmitted: (value) {
                          setState(() {
                            pessoas = int.tryParse(value) ?? 0;
                            if (pessoas <= 0) {
                              print("O valor informado é invalido");
                            } else {
                              print("O valor informado é $pessoas");
                            }
                          });
                          resultadoFinal();
                        },
                        controller: controllerPessoas,
                        decoration: InputDecoration(
                          icon: IconButton(
                            onPressed: () {
                              pessoas =
                                  int.tryParse(controllerPessoas.text) ?? 0;
                              if (pessoas <= 0) {
                                print(
                                    "o numero de pessoas informado é invalido");
                              } else {
                                print("A quantidade de pessoas é $pessoas");
                              }
                              resultadoFinal();
                            },
                            icon: const Icon(
                              Icons.emoji_people_sharp,
                              size: 40,
                            ),
                          ),
                          labelText: "pessoas",
                          hintText: "Ex.: 4",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.purpleAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.purple)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 138, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(3, 7),
                          color: Colors.black26)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Teve bebida alcoólica",
                        style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400),
                      ),
                      Switch(
                          value: bebida,
                          onChanged: (value) {
                            setState(() {
                              bebida = value;
                              if (bebida) {
                                resulB = 0;
                                print("Teve bebida");
                              } else {
                                print("Não teve");
                              }
                              resultadoFinal();
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: bebida,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 224, 138, 255),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(3, 7),
                            color: Colors.black26)
                      ]),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Row(
                          children: [
                            Text(
                              "Quantas pessoas beberam?",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          onSubmitted: (value) {
                            setState(() {
                              pessoasBebidas = int.tryParse(value) ?? 0;
                              if (pessoasBebidas <= 0) {
                                print("O valor informado é invalido");
                              } else {
                                print("O valor informado é $pessoasBebidas");
                              }
                            });
                            resultadoFinal();
                          },
                          controller: controllerPessoasBebida,
                          decoration: InputDecoration(
                            icon: IconButton(
                              onPressed: () {
                                pessoasBebidas = int.tryParse(
                                        controllerPessoasBebida.text) ??
                                    0;
                                if (pessoasBebidas <= 0) {
                                  print(
                                      "o numero de pessoas informado é invalido");
                                } else {
                                  print(
                                      "A quantidade de pessoas que beberam são $pessoasBebidas");
                                }

                                resultadoFinal();
                              },
                              icon: const Icon(
                                Icons.emoji_people_sharp,
                                size: 40,
                              ),
                            ),
                            labelText: "pessoas",
                            hintText: "Ex.: 4",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.purpleAccent),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.purple)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: bebida,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 224, 138, 255),
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(3, 7),
                          color: Colors.black26,
                        ),
                      ]),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 5, right: 10, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Qual o valor da bebida ?",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text("💰 💸")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextField(
                          onSubmitted: (value) {
                            setState(() {
                              valorBebida = double.tryParse(value) ?? 0;
                              if (valorBebida <= 0) {
                                print("O valor informado é invalido");
                              } else {
                                print("O valor informado é $valorBebida");
                              }
                            });
                            resultadoFinal();
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9 .]')),
                          ],
                          controller: controllerValorBebida,
                          decoration: InputDecoration(
                            icon: IconButton(
                              onPressed: () {
                                valorBebida = double.tryParse(
                                        controllerValorBebida.text) ??
                                    0;
                                if (valorBebida <= 0) {
                                  print("O valor informado é invalido");
                                } else {
                                  print("O valor da bebida é $valorBebida");
                                }
                                resultadoFinal();
                                print("o resultado é $resulB");
                              },
                              icon: const Icon(
                                Icons.monetization_on,
                                size: 40,
                              ),
                            ),
                            labelText: "valor",
                            hintText: "Ex.: 234.50",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.purpleAccent),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.purple)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 138, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(3, 7),
                          color: Colors.black26)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Valor para quem bebeu: ${resulB.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Valor para quem não bebeu: ${resul.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

void resultadoFinal() {
  if (valor > 0 && pessoas > 0) {
    setState(() {
      resul = valor / pessoas;
      resulB = 0;
      });
      if(bebida){
        
      }
    });
  }
}
}



  
