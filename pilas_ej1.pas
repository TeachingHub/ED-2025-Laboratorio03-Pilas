program pilas_ej1;

uses
    sysutils, 
    uPilaChar; { 1.1 Genera una unidad pila cuyos nodos almacenen un único carácter.}




{ 1.2
    Define una función balanceada para comprobar el balance de paréntesis de una expresión aritmética.
    Una expresión aritmética está balanceada si cada paréntesis de apertura tiene un paréntesis de cierre correspondiente.
    Los paréntesis deben estar correctamente anidados.
    No se comprobará si los paréntesis están en el lugar correcto (por ejemplo, (3+2*)5 o 3(+4-)2 no es una expresión aritmética 
    válida pero vamos a considerarla balanceada).
    - Entradas:
        - Pila de caracteres 
        - Una cadena de caracteres que representa una expresión aritmética.
    - Salida:
        - Devuelve true si la expresión está balanceada, es decir, si los paréntesis están correctamente cerrados y anidados.
    - Ejemplos
        - (3+2)*5 -> true
        - 3+(4-2 -> false
        - (3+2)*5+(4-2) -> true
        - (3(+2)*5)+(4-2 -> false
}

{ 1.3
    Mejora la función balanceada para que compruebe también los corchetes.
    - Entradas:
        - Pila de caracteres 
        - Una cadena de caracteres que representa una expresión aritmética.
    - Salida:
        - Devuelve true si la expresión está balanceada, es decir, si los paréntesis y corchetes están correctamente cerrados y anidados.
    - Ejemplos
        - (3+2)*5 -> true
        - 3+(4-2 -> false
        - (3+2)*5+(4-2) -> true
        - (3(+2)*5)+(4-2 -> false
        - [3+2]*5 -> true
        - 3+[4-2 -> false
        - [3+2]*5+[4-2] -> true
        - [3[+2]*5]+[4-2] -> false

}

const
    expresion1 = '(3+2)*5';
    resultado1 = true;
    expresion2 = '3+(4-2';
    resultado2 = false;
    expresion3 = '(3+2)*5+(4-2)';
    resultado3 = true;
    expresion4 = '(3(+2)*5)+(4-2';
    resultado4 = false;
    expresion5 = '[3+2]*5';
    resultado5 = true;
    expresion6 = '3+[4-2';
    resultado6 = false;
    expresion7 = '[3+2]*5+[4-2]';
    resultado7 = true;
    expresion8 = '[3[+2]*5]+[4-2)';
    resultado8 = false;
    expresion9 = '[3[+2]*5)+[4-2]';
    resultado9 = false;
    expresion10 = '(3[+2]*5(+[4-2]';
    resultado10 = false;
    expresion11 = '(3[+2]*5)+[4-2]';
    resultado11 = true;

{ 1.2}
function balanceada(exp: string): boolean;
var
    i: integer;
    c: char;
    p: tPilaChars;
    estaBalanceada: boolean;
begin
    estaBalanceada := true;
    initialize(p);
    i := 1;
    while estaBalanceada and (i <= Length(exp)) do
    begin
        c := exp[i];
        if c = '(' then
            push(p, c)
        else if c = ')' then
        begin
            if isEmpty(p) then
                estaBalanceada := false
            else
                pop(p);
        end;
        i := i + 1;
    end;
    balanceada := isEmpty(p);
end;


{ 1.3}
function balanceadaCorchetes(exp: string): boolean;
var
    i: integer;
    c, cPeek: char;
    p: tPilaChars;
    estaBalanceada: boolean;
begin
    estaBalanceada := true;
    initialize(p);
    i := 1;
    while estaBalanceada and (i <= Length(exp)) do
    begin
        c := exp[i];
        if (c = '(') or (c = '[') then
            push(p, c)
        else
        begin
            cPeek := peek(p);
            if (c = ')') and (cPeek = '(') or (c = ']') and (cPeek = '[') then
                pop(p)
            else if (c = ')') or (c = ']') then
                estaBalanceada := false;
        end;
        i := i + 1;
    end;
    balanceadaCorchetes := isEmpty(p);
end;

function showOkWrong(ok: boolean): string;
begin
    if ok then
        showOkWrong := 'OK'
    else
        showOkWrong := 'ERROR';
end;


begin
    WriteLn('Ejemplo #', '  Expresión', #9#9, 'Res = Esp', #9, 'OK/ERROR');
    WriteLn('---------------------------------------------------------');
    WriteLn('Ejemplo 1: ', expresion1, #9#9, balanceada(expresion1), ' = ', resultado1, #9, showOkWrong(balanceada(expresion1) = resultado1));
    WriteLn('Ejemplo 2: ', expresion2, #9#9, balanceada(expresion2), ' = ', resultado2, #9, showOkWrong(balanceada(expresion2) = resultado2));
    WriteLn('Ejemplo 3: ', expresion3, #9, balanceada(expresion3), ' = ', resultado3, #9, showOkWrong(balanceada(expresion3) = resultado3));
    WriteLn('Ejemplo 4: ', expresion4, #9, balanceada(expresion4), ' = ', resultado4, #9, showOkWrong(balanceada(expresion4) = resultado4));
    WriteLn('Ejemplo 5: ', expresion5, #9#9, balanceadaCorchetes(expresion5), ' = ', resultado5, #9, showOkWrong(balanceadaCorchetes(expresion5) = resultado5));
    WriteLn('Ejemplo 6: ', expresion6, #9#9, balanceadaCorchetes(expresion6), ' = ', resultado6, #9, showOkWrong(balanceadaCorchetes(expresion6) = resultado6));
    WriteLn('Ejemplo 7: ', expresion7, #9, balanceadaCorchetes(expresion7), ' = ', resultado7, #9, showOkWrong(balanceadaCorchetes(expresion7) = resultado7));
    WriteLn('Ejemplo 8: ', expresion8, #9, balanceadaCorchetes(expresion8), ' = ', resultado8, #9, showOkWrong(balanceadaCorchetes(expresion8) = resultado8));
    WriteLn('Ejemplo 9: ', expresion9, #9, balanceadaCorchetes(expresion9), ' = ', resultado9, #9, showOkWrong(balanceadaCorchetes(expresion9) = resultado9));
    WriteLn('Ejemplo 10: ', expresion10, #9, balanceadaCorchetes(expresion10), ' = ', resultado10, #9, showOkWrong(balanceadaCorchetes(expresion10) = resultado10));
    WriteLn('Ejemplo 11: ', expresion11, #9, balanceadaCorchetes(expresion11), ' = ', resultado11, #9, showOkWrong(balanceadaCorchetes(expresion11) = resultado11));
    readln;
end.
