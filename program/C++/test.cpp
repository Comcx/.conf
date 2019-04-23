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



lambda<Int n> struct
fact {
  static val ans = n * fact<n - 1>::ans;
};

lambda<> struct
fact<0> {
  static val ans = 1;
};





Int main() {

  val i {5 + 6};
  val d = Int(3.14);
  typeOf(i) a(3);
  int xx = 3;
  fact<xx> ans;
  TLP::Int<5> x;
  //mix_print(TLP::True);
  String s("Hello!");
  cout << Test::add(*Test::id, i)
       << s << endl
       << ans.ans << endl;
  
  return 0;
}










