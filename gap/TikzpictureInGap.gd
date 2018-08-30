#
# TikzpictureInGap: Gap package to create commutative diagrams
#
# Declarations
#
#! @Description
#!   Insert documentation for you function here
DeclareGlobalFunction( "Diagram" );
DeclareGlobalFunction( "AddVertex" );
DeclareGlobalFunction( "AddArrow" );
DeclareGlobalFunction( "RemoveVertex" );
DeclareGlobalFunction( "RemoveArrow" );
DeclareGlobalFunction( "TexCode" );
DeclareGlobalFunction( "HelpForTikzpictureInGap" );

# "options: 
#  	double distance = 1.5pt
#  	->,>=angle 90
#  	right hook->
#	|->
#	-
#	right hook->
#	->>
#	dotted, ->
#	dashed, ->
#	*->
#   to get zigzag
#	[->, line join=round,
#   decorate, decoration={
#       zigzag,
#       segment length=4,
#       amplitude=.9,post=lineto,
#       post length=2pt
#   }]
#	
#