#include "Mix.h"
#include <iostream>

use module Mix;
use module std;

module Test {

Int i = 7;
Int *id = &i;
Int add(Int a, Int b) {return a + b;}  

}



mix<Int n> struct
fact {
  enum {ans = n * fact<n - 1>::ans};
};

mix<> struct
fact<0> {
  enum {ans = 1};
};

mix<Type s> s
re() {return "";}

Int main() {

  val i {5 + 6};
  typeOf(i) a(3);
  fact<5> ans;
  String s("Hello!");
  cout << Test::add(*Test::id, i)
       << s << endl
       << ans.ans << endl;
  
  return 0;
}










