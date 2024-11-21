/*
Crear un algoritmo que muestre cada uno de los digitos de un numero
ingresado por el usuario. El maximo permitido es de 4 digitos.
Por ejemplo: si se ingresa el numero 187, entonces debe mostrar en
un unico cartel lo siguiente: “d1 = 0, d2 = 1, d3 = 8 y d4 =7”.
*/

class MostrarDigitos {
  String mostrarDigitos(int numero) {
    if (numero > 9999) {
      return 'El número ingresado es mayor a 4 dígitos';
    } else {
      String numeroString = numero.toString();
      String resultado = '';

      for (int i = 0; i < 4; i++) {
        if (i < numeroString.length) {
          resultado += 'd${i + 1} = ${numeroString[i]}';
        } else {
          resultado += 'd${i + 1} = 0';
        }
        if (i < 3) {
          resultado += ', ';
        }
      }
      return resultado;
    }
  }
}
