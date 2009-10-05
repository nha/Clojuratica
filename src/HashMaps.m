(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



BeginPackage["HashMaps`", {"FunctionalExtras`"}];


HashMap; HashMapObject; HashMapValue; Rules; Lookup;Associate; ZipMap;Disassociate;


Begin["`Private`"];


HashMap[rules:{___Rule}] :=
Let[{markedRules = Map[First[#] -> HashMapValue[Last[#]]&, rules]},
HashMapObject[Dispatch[markedRules]]]


HashMap[dispatch_Dispatch] :=
HashMap[Extract[dispatch, {1}]]


HashMapObject[rules_][key_] :=
Let[{value = key /. rules},
If[Head[value] =!= HashMapValue,
Null,
Extract[value,{1}]]]


HashMapObject[rules_][] :=
Rules[HashMapObject[rules]]


Rules[HashMapObject[dispatch_Dispatch]] := StripTags[Extract[dispatch, {1}]]


Rules[HashMapObject[rules:{___Rule}]] := StripTags[rules]


Lookup[rules:{___Rule}, key_] := HashMap[rules][key]


Lookup[dispatch_Dispatch, key_] := HashMap[dispatch][key]


Associate[o_HashMapObject, rules:{___Rule}] :=
HashMap[Join[Rules[o], rules]]


Disassociate[o_HashMapObject, keys:{___}] :=
HashMap[Select[Rules[o], !MemberQ[keys, First[#]] &]]


ZipMap[keys_List, values_List] :=
	HashMap[MapThread[Rule, {keys, values}]];


StripTags[rules: {___Rule}] := Map[First[#]-> Extract[Last[#], {1}] &, rules]


End[];


EndPackage[];



