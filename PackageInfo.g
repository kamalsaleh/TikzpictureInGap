#
# TikzpictureInGap: Gap package to create commutative diagrams
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "TikzpictureInGap",
Subtitle := "Gap package to create commutative diagrams",
Version := "0.1",
Date := "20/08/2018", # dd/mm/yyyy format

Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Kamal",
    LastName := "Saleh",
    WWWHome := "Kamal.saleh@uni-siegen.de",
    Email := "kamal.saleh@uni-siegen.de",
    PostalAddress := Concatenation(
               "Walter-Flex-Str. 3\n",
               "57068 Siegen\n",
               "Germany" ),
    Place := "Siegen",
    Institution := "University of Siegen",
  ),
],

#SourceRepository := rec( Type := "TODO", URL := "URL" ),
#IssueTrackerURL := "TODO",
#SupportEmail := "TODO",

PackageWWWHome := "http://TODO/",

PackageInfoURL := Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),
README_URL     := Concatenation( ~.PackageWWWHome, "README.md" ),
ArchiveURL     := Concatenation( ~.PackageWWWHome,
                                 "/", ~.PackageName, "-", ~.Version ),

ArchiveFormats := ".tar.gz",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "TikzpictureInGap",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Gap package to create commutative diagrams",
),

Dependencies := rec(
  GAP := ">= 4.9",
  NeededOtherPackages := [ [ "GAPDoc", ">= 1.6.1" ] ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,

TestFile := "tst/testall.g",

#Keywords := [ "TODO" ],

));


