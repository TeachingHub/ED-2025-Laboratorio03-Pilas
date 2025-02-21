program TestPilaIntegerExtended;

uses
    sysutils, uPilaIntegerExtended, StrUtils;




procedure inicializarPilaConElementos(var p: tPilaEnterosExt; elementos: string);
var
    i: integer;
    num: longint;
    elementosArray: TStringArray;
begin
    initialize(p);  // Inicializa la pila
    elementosArray := SplitString(elementos, ',');  // Divide la cadena de entrada por comas
    for i := 0 to Length(elementosArray)+1 do
    begin
        begin
            if TryStrToInt(elementosArray[Length(elementosArray)-i+1], num) then
            begin
            num := StrToInt(elementosArray[Length(elementosArray)-i+1]);
            push(p, num);
            end;
        end;
    end;
end;


{ Ejericio 2.1 }
function testContarElementos: boolean;
var
    p: tPilaEnterosExt;
    ejemplo1, ejemplo2, ejemplo3: string;
    b1, b2, b3: boolean;
begin
    { Ejemplo 1: [1, 2, 3, 4, 5] -> 5 }
    ejemplo1 := '1,2,3,4,5';
    inicializarPilaConElementos(p, ejemplo1);
    b1 := contarElementos(p) = 5;

    { Ejemplo 2: [] -> 0}
    ejemplo2 := '';
    inicializarPilaConElementos(p, ejemplo2);
    b2 := (contarElementos(p) = 0);

    { Ejemplo 3: 1, 2, 3] -> 3}
    ejemplo3 := '1,2,3';
    inicializarPilaConElementos(p, ejemplo3);
    b3 := (contarElementos(p) = 3);

    { Si necesitas imprimir los resultados de los ejemplos, descomenta las siguientes líneas }
    // Write(#10, #9  , 'Ejemplo 1: ', b1);
    // Write(#10, #9  , 'Ejemplo 2: ', b2);
    // Write(#10, #9  , 'Ejemplo 3: ', b3);


    testContarElementos := b1 and b2 and b3;
end;



{ Ejericio 2.2 }
function testUltimo: boolean;
var
    p: tPilaEnterosExt;
    ejemplo1, ejemplo2, ejemplo3: string;
    test_correcto: boolean;
begin
    test_correcto := true;
    { Ejemplo 1: [1, 2, 3, 4, 5] -> 5 }
    ejemplo1 := '1,2,3,4,5';
    inicializarPilaConElementos(p, ejemplo1);
    test_correcto := ultimo(p) = 5;

    { Ejemplo 2: [] -> 0}
    ejemplo2 := '';
    inicializarPilaConElementos(p, ejemplo2);
    test_correcto := test_correcto and (ultimo(p) = 0);

    { Ejemplo 3: [1, 2, 3] -> 3}
    ejemplo3 := '1,2,3';
    inicializarPilaConElementos(p, ejemplo3);
    test_correcto := test_correcto and (ultimo(p) = 3);

    testUltimo := test_correcto;
end;


{ Ejericio 2.3 }
function testCombinar: boolean;
var
    p1, p2: tPilaEnterosExt;
    ejemplo1_p1, ejemplo1_p2, ejemplo2_p1, ejemplo2_p2, ejemplo3_p1, ejemplo3_p2: string;
    test_correcto: boolean;
begin
    test_correcto := true;
    
    { Ejemplo 1: combinar([1, 2, 3], [4, 5, 6]) -> [4, 5, 6, 1, 2, 3] }
    ejemplo1_p1 := '1,2,3';
    ejemplo1_p2 := '4,5,6';
    inicializarPilaConElementos(p1, ejemplo1_p1);
    inicializarPilaConElementos(p2, ejemplo1_p2);
    combinar(p1, p2);
    test_correcto := (toString(p1) = '4 5 6 1 2 3 ') and isEmpty(p2);

    { Ejemplo 2: combinar([], [4, 5, 6]) -> [4, 5, 6] }
    ejemplo2_p1 := '';
    ejemplo2_p2 := '4,5,6';
    inicializarPilaConElementos(p1, ejemplo2_p1);
    inicializarPilaConElementos(p2, ejemplo2_p2);
    combinar(p1, p2);
    test_correcto := test_correcto and (toString(p1) = '4 5 6 ') and isEmpty(p2);

    { Ejemplo 3: combinar([1, 2, 3], []) -> [1, 2, 3] }
    ejemplo3_p1 := '1,2,3';
    ejemplo3_p2 := '';
    inicializarPilaConElementos(p1, ejemplo3_p1);
    inicializarPilaConElementos(p2, ejemplo3_p2);
    combinar(p1, p2);
    test_correcto := test_correcto and (toString(p1) = '1 2 3 ') and isEmpty(p2);

    testCombinar := test_correcto;
end;


{ Ejercicio 2.4 }
function testPopN: boolean;
var
    p: tPilaEnterosExt;
    ejemplo1, ejemplo2, ejemplo3: string;
    test_correcto: boolean;
begin
    test_correcto := true;
    { Ejemplo 1: popN([1, 2, 3, 4, 5], 2) -> [3, 4, 5] }
    ejemplo1 := '1,2,3,4,5';
    inicializarPilaConElementos(p, ejemplo1);
    popN(p, 2);
    test_correcto := toString(p) = '3 4 5 ';

    { Ejemplo 2: popN([1, 2, 3, 4, 5], 5) -> [] }
    ejemplo2 := '1,2,3,4,5';
    inicializarPilaConElementos(p, ejemplo2);
    popN(p, 5);
    test_correcto := test_correcto and isEmpty(p);

    { Ejemplo 3: popN([1, 2, 3, 4, 5], 0) -> [1, 2, 3, 4, 5] }
    ejemplo3 := '1,2,3,4,5';
    inicializarPilaConElementos(p, ejemplo3);
    popN(p, 0);
    test_correcto := test_correcto and (toString(p) = '1 2 3 4 5 ');

    testPopN := test_correcto;
end;

{ Ejercicio 2.5 }
function testSumarN: boolean;
var
    p: tPilaEnterosExt;
    ejemplo1, ejemplo2, ejemplo3: string;
    test_correcto: boolean;
begin
    test_correcto := true;
    { Ejemplo 1: sumarN([1, 2, 3, 4, 5], 2) -> [3, 3, 4, 5] }
    ejemplo1 := '1,2,3,4,5';
    inicializarPilaConElementos(p, ejemplo1);
    sumarN(p, 2);
    test_correcto := toString(p) = '3 3 4 5 ';

    { Ejemplo 2: sumarN([1, 2, 3, 4, 5], 5) -> [15] }
    ejemplo2 := '1,2,3,4,5';
    inicializarPilaConElementos(p, ejemplo2);
    sumarN(p, 5);
    test_correcto := test_correcto and (toString(p) = '15 ');

    { Ejemplo 3: sumarN([1, 2, 3, 4, 5], 0) -> [1, 2, 3, 4, 5] }
    ejemplo3 := '1,2,3,4,5';
    inicializarPilaConElementos(p, ejemplo3);
    sumarN(p, 0);
    test_correcto := test_correcto and (toString(p) = '1 2 3 4 5 ');
    testSumarN := test_correcto;
end;

{ Ejercicio 2.6 }
function testInvertir: boolean;
var
    p: tPilaEnterosExt;
    ejemplo1, ejemplo2, ejemplo3: string;
    test_correcto: boolean;
begin
    test_correcto := true;
    { Ejemplo 1: invertir([1, 2, 3, 4, 5]) -> [5, 4, 3, 2, 1] }
    ejemplo1 := '1,2,3,4,5';
    inicializarPilaConElementos(p, ejemplo1);
    invertir(p);
    test_correcto := toString(p) = '5 4 3 2 1 ';

    { Ejemplo 2: invertir([]) -> [] }
    ejemplo2 := '';
    inicializarPilaConElementos(p, ejemplo2);
    invertir(p);
    test_correcto := test_correcto and isEmpty(p);

    { Ejemplo 3: invertir([1, 2, 3]) -> [3, 2, 1] }
    ejemplo3 := '1,2,3';
    inicializarPilaConElementos(p, ejemplo3);
    invertir(p);
    test_correcto := test_correcto and (toString(p) = '3 2 1 ');
    testInvertir := test_correcto;
end;

{ Ejercicio 2.7 }
function testRepetirN: boolean;
var
    p: tPilaEnterosExt;
    ejemplo1, ejemplo2, ejemplo3: string;
    test_correcto: boolean;
begin
    test_correcto := true;
    { Ejemplo 1: repetirN([1, 2, 3], 2) -> [1, 1, 2, 2, 3, 3] }
    ejemplo1 := '1,2,3';
    inicializarPilaConElementos(p, ejemplo1);
    repetirN(p, 2);
    test_correcto := toString(p) = '1 1 2 2 3 3 ';

    { Ejemplo 2: repetirN([1, 2, 3], 1) -> [1, 2, 3] }
    ejemplo2 := '1,2,3';
    inicializarPilaConElementos(p, ejemplo2);
    repetirN(p, 1);
    test_correcto := test_correcto and (toString(p) = '1 2 3 ');
end;


{ Ejercicio 2.8 }
function testContarApariciones: boolean;
var
    p: tPilaEnterosExt;
    ejemplo1, ejemplo2, ejemplo3: string;
    test_correcto: boolean;
begin
    test_correcto := true;
    { Ejemplo 1: contarApariciones([1, 2, 3, 4, 5], 2) -> 1 }
    ejemplo1 := '1,2,3,4,5';
    inicializarPilaConElementos(p, ejemplo1);
    test_correcto := contarApariciones(p, 2) = 1;

    { Ejemplo 2: contarApariciones([1, 2, 3, 4, 5], 10) -> 0 }
    ejemplo2 := '1,2,3,4,5';
    inicializarPilaConElementos(p, ejemplo2);
    test_correcto := test_correcto and (contarApariciones(p, 10) = 0);

    { Ejemplo 3: contarApariciones([1, 2, 3, 4, 5, 2], 2) -> 2 }
    ejemplo3 := '1,2,3,4,5,2';
    inicializarPilaConElementos(p, ejemplo3);
    test_correcto := test_correcto and (contarApariciones(p, 2) = 2);
    testContarApariciones := test_correcto;
end;


begin
    WriteLn('Ejercicio 2.1: ', testContarElementos);
    WriteLn('Ejercicio 2.2: ', testUltimo);
    WriteLn('Ejercicio 2.3: ', testCombinar);
    WriteLn('Ejercicio 2.4: ', testPopN);
    WriteLn('Ejercicio 2.5: ', testSumarN);
    WriteLn('Ejercicio 2.6: ', testInvertir);
    WriteLn('Ejercicio 2.7: ', testRepetirN);
    WriteLn('Ejercicio 2.8: ', testContarApariciones);
    readln;
end.