program PilasEj3;

uses
    sysutils, uTElement, uPilaElement;

var
    pila: tPilaElementos;
    libro: TElement;

procedure invertirPila(var p: tPilaElementos);
var
    tempPila: tPilaElementos;
    elemento: TElement;
begin
    initialize(tempPila);
    while not isEmpty(p) do
    begin
        elemento := peek(p);
        pop(p);
        push(tempPila, elemento);
    end;
    p := tempPila;
end;

procedure imprimirPila(p: tPilaElementos);
begin
    writeln(toString(p));
end;

begin
    initialize(pila);

    // Agregar libros a la pila
    libro.titulo := 'Don Quijote de Móstoles';
    libro.autor := 'Cervantes';
    libro.ISBN := '978-3-16-148410-0';
    libro.idioma := 'Español';
    libro.numPaginas := 9999;
    push(pila, libro);

    libro.titulo := 'Kika Superbruja y el libro de hechizos';
    libro.autor := 'Knister';
    libro.ISBN := '978-3-16-148410-1';
    libro.idioma := 'Alemán';
    libro.numPaginas := 55;
    push(pila, libro);

    libro.titulo := 'Wigetta en ED';
    libro.autor := 'Vegetta777 y Willyrex';
    libro.ISBN := '978-3-16-148410-2';
    libro.idioma := 'Infantil';
    libro.numPaginas := 2;
    push(pila, libro);

    writeln('Pila original:');
    imprimirPila(pila);

    // Invertir la pila
    invertirPila(pila);

    writeln('Pila invertida:');
    imprimirPila(pila);

    readln;
end.