#define MIX_MACRO
#include "Mix.h"
#include <iostream>

use module Mix;
use module Mix::Alias;
use module std;



module Test {

Int i = 7;
Int *id = &i;
Int add(Int a, Int b) {return a + b;}  

}


function(Set n)
sum {
  mix_return
    (mix_apply(Set TLP::add, n,
	       mix_apply(Set sum,
			 mix_apply(Set TLP::add, n,
				   mix_Int(-1)))));
};

function()
sum<mix_Int(0)> {
  mix_return(mix_Int(0));
};


function(Set x)
add1 {
  mix_return(TLP::add<x, TLP::Int<7>>);
};




Int main() {

  def xs = mix_apply
    (TLP::List, mix_Int(5),
                mix_Int(6));
  def res = mix_apply(sum, mix_Int(5));
  literal Int x = res::value;
  cout << res::value << endl
       << x << endl;
  
  return 0;
}










