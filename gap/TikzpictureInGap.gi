#
# TikzpictureInGap: Gap package to create commutative diagrams
#
# Implementations
#
InstallGlobalFunction( Diagram,
function()
	local diagram;
	diagram := rec( vertices := [ ], arrows := [ ] );
	return diagram;
end );

InstallGlobalFunction( AddVertex,
function( diagram, vertex )
  local vertices, positions;
  if Length( vertex ) < 2 then
  	Error( "The vertex should be a list of length at least 2" );
  fi;
  if Length( vertex[ 1 ] ) <> 2 then
  	Error( "The first list in the vertex should be the position of the vertex, i.e., list of two integers" );
  fi;
  vertices := diagram!.vertices;
  positions := List( vertices, v -> v[ 1 ] );
  #if vertex[1] in positions then
  #	Error( "There is already a vertex in this position" );
  #fi;
  Add( diagram!.vertices, vertex );
end );

InstallGlobalFunction( AddArrow,
  function( diagram, arrow )
    Add( diagram!.arrows, arrow );
end );


InstallGlobalFunction( RemoveVertex,
function( diagram, position )
  local vertices, p;
  vertices := diagram!.vertices;
  p := Position( List( vertices, v -> v[1]=position ), true );
  Remove( vertices, p );
end );

InstallGlobalFunction( RemoveArrow,
function( diagram, position )
  local arrows, p;
  arrows := diagram!.arrows;
  p := Position( List( arrows, v -> v[1]=position[1] and v[2]=position[2] ), true );
  Remove( arrows, p );
end );

InstallGlobalFunction( TexCode, 
	function( diagram )
	local v, vertices, a, arrows, nodes, i;
  Print("\\begin{center}\n" );
  Print("\\begin{tikzpicture}[x=2cm,y=1.5cm,transform shape,\n" );
  Print( "mylabel/.style={thick, draw=black, \n" );
  Print( "align=center, minimum width=0.5cm, minimum height=0.5cm,fill=white}]\n" );
  vertices := diagram!.vertices;
  for v in vertices do 
	  Print( "\\node (", String( v[1][1] ), "V", String( v[1][2] ), ") at (",String( v[1][1] ),",", String( v[1][2] ), ") {$", v[2], "$};\n");
  od;
  
  arrows := diagram!.arrows;
  for a in arrows do 
	  nodes := " ";
	  for i in [ 5 .. Length( a ) ] do
		  nodes := Concatenation( nodes, "node[", a[i][1], "]{$",a[i][2], "$} ");
	  od;
	  Print( "\\draw[", a[3], "] (", String( a[1][1] ), "V", String( a[1][2] ) ,")", a[4], nodes, "(", String( a[2][1] ),"V", String( a[2][2] ), ");\n" );
  od;
	#\draw[->,thick] (B1) --node[above]{$F^{p}\alpha$} (B2);

  Print("\\end{tikzpicture}\n");
  Print("\\end{center}\n");
end );

InstallGlobalFunction( VTexCode,
	function( diagram, name )
	  local v, vertices, a, arrows, nodes, i;
    PrintTo( name, "\\begin{center}\n" );
    AppendTo( name, "\\begin{tikzpicture}[x=2cm,y=1.5cm,transform shape,\n" );
    AppendTo( name,  "mylabel/.style={thick, draw=black, \n" );
    AppendTo( name,  "align=center, minimum width=0.5cm, minimum height=0.5cm,fill=white}]\n" );
    vertices := diagram!.vertices;
    for v in vertices do 
	    AppendTo( name, "\\node (", String( v[ 1 ][ 1 ] ), "V",
        String( v[ 1 ][ 2 ] ), ") at (",String( v[ 1 ][ 1 ] ),",",
          String( v[ 1 ][ 2 ] ), ") {$", v[ 2 ], "$};\n");
    od;
    arrows := diagram!.arrows;
    for a in arrows do 
	    nodes := " ";
	    for i in [ 5 .. Length( a ) ] do
		    nodes := Concatenation( nodes, "node[", a[ i ][ 1 ], "]{$",a[ i ][ 2 ], "$} ");
	    od;
	    AppendTo( name, "\\draw[", a[ 3 ], "] (",
        String( a[ 1 ][ 1 ] ), "V", String( a[ 1 ][ 2 ] ) ,")",
          a[ 4 ], nodes, "(", String( a[ 2 ][ 1 ] ),"V", String( a[ 2 ][ 2 ] ), ");\n" );
    od;
	  #\draw[->,thick] (B1) --node[above]{$F^{p}\alpha$} (B2);
    
    AppendTo( name, "\\end{tikzpicture}\n" );
    AppendTo( name, "\\end{center}\n" );
    Exec( "pdflatex main.tex & evince main.pdf&" );
return;
end );


InstallGlobalFunction( HelpForTikzpictureInGap,
	function( )

    Print( "D := Diagram();\n" );
    Print( "#	        position  label\n" );
    Print( "AddVertex( D, [ [ 1, 1 ], \"\\\\Omega\" ] );;\n" );
    Print( "AddVertex( D, [ [ 3, 1 ], \"\\\\bigoplus_{i}^4 A_i\" ] );;\n" );
    Print( "AddVertex( D, [ [ 6, 1 ], \"A_{6,1}\" ] );;\n" );
    Print( "\n" );
    Print( "#              source    range     options              straight or bended         options for label  label\n" );
    Print( "AddArrow( D, [ [ 1, 1 ], [ 3, 1 ], \"->, red\",           \"--\",                   [  \"blue,above\",      \"f\"       ] ] );;\n" );
    Print( "AddArrow( D, [ [ 3, 1 ], [ 6, 1 ], \">->, red\",          \"to [out=60,in=120]\",   [  \"blue,above\",      \"\\\\alpha\" ] ] );;\n" );
    Print( "AddArrow( D, [ [ 3, 1 ], [ 6, 1 ], \"right hook->, red\", \"to [out=-60,in=-120]\", [  \"blue,below\",      \"\\\\beta\"  ] ] );;\n" );
    Print( "TexCode(D);;\n" );
    
    Print( TextAttr.1, "See tst/main.tex" );
end );
