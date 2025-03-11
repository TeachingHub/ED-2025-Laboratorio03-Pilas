program pilas_ej4;

uses
    sysutils, 
    uPilaChar;

{ Función para comprobar si una frase es un palíndromo }
function esPalindromo(frase: string): boolean;
var
    i: integer;
    c: char;
    p: tPilaChars;
    fraseInvertida: string;
begin
    initialize(p);
    fraseInvertida := '';

    { Empujar cada carácter de la frase a la pila }
    for i := 1 to Length(frase) do
    begin
        c := frase[i];
        push(p, c);
    end;

    { Desapilar los caracteres para formar la frase invertida }
    while not isEmpty(p) do
    begin
        c := peek(p);
        fraseInvertida := fraseInvertida + c;
        pop(p);
    end;

    { Comparar la frase original con la frase invertida }
    esPalindromo := frase = fraseInvertida;
end;

function showOkWrong(ok: boolean): string;
begin
    if ok then
        showOkWrong := 'OK'
    else
        showOkWrong := 'ERROR';
end;

const
    frase1 = 'anilina';
    resultado1 = true;
    frase2 = 'palindromo';
    resultado2 = false;
    frase3 = 'radar';
    resultado3 = true;
    frase4 = 'holita';
    resultado4 = false;
    frase5 = 'reconocer';
    resultado5 = true;
    frase6 = 'oso';
    resultado6 = true;
    frase7 = 'mameluco';
    resultado7 = false;

begin
    WriteLn('Ejemplo #', '  Frase', #9#9, 'Res = Esp', #9, 'OK/ERROR');
    WriteLn('---------------------------------------------------------');
    WriteLn('Ejemplo 1: ', frase1, #9#9, esPalindromo(frase1), ' = ', resultado1, #9, showOkWrong(esPalindromo(frase1) = resultado1));
    WriteLn('Ejemplo 2: ', frase2, #9#9, esPalindromo(frase2), ' = ', resultado2, #9, showOkWrong(esPalindromo(frase2) = resultado2));
    WriteLn('Ejemplo 3: ', frase3, #9#9, esPalindromo(frase3), ' = ', resultado3, #9, showOkWrong(esPalindromo(frase3) = resultado3));
    WriteLn('Ejemplo 4: ', frase4, #9#9, esPalindromo(frase4), ' = ', resultado4, #9, showOkWrong(esPalindromo(frase4) = resultado4));
    WriteLn('Ejemplo 5: ', frase5, #9#9, esPalindromo(frase5), ' = ', resultado5, #9, showOkWrong(esPalindromo(frase5) = resultado5));
    WriteLn('Ejemplo 6: ', frase6, #9#9#9, esPalindromo(frase6), ' = ', resultado6, #9, showOkWrong(esPalindromo(frase6) = resultado6));
    WriteLn('Ejemplo 7: ', frase7, #9#9, esPalindromo(frase7), ' = ', resultado7, #9, showOkWrong(esPalindromo(frase7) = resultado7));
    ReadLn;
end.