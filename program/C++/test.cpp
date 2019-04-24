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



function(Int n)
fact {
  static val ans = n * fact<n - 1>::ans;
};

function()
fact<0> {
  static val ans = 1;
};

function(Set x)
add1 {
  mix_return(TLP::add<x, TLP::Int<7>>);
};




Int main() {

  val i {5 + 6};
  val d = Int(3.14);
  typeOf(i) a(3);

  fact<5> ans;
  def ls = TLP::List<TLP::Int<2>,
		     TLP::Int<5>>::ans;
  def xs = TLP::map<add1, ls>::ans;
  cout << xs::fst::value << endl;
  String s("Hello!");
  cout << Test::add(*Test::id, i)
       << s << endl
       << mix_add(mix_Int(3), mix_Int(4))::value << endl
       << ans.ans << endl;
  
  return 0;
}










