/**
 * #+TITLE:  Mix Library
 * #+AUTHOR: Comcx
 *
 */


#ifndef MIX_H
#define MIX_H

#include <string>

#define var    auto
#define val    const auto
#define mix    template
#define Set    class
#define use    using
#define def    using
#define Type   typename
#define module namespace
#define typeOf decltype
#define lambda template

#define mix_print(...) Mix::Print<__VA_ARGS__> token##__LINE__



module Mix {

mix<Type T> struct
Print {
  const int value = sizeof(T) / 2;
};


module Alias {
  
  use Int    = int;          //unsigned Int is not allowed
  use Unit   = void;
  use Bool   = bool;
  use Char   = char;
  use Float  = float;
  use Double = double;
  use String = std::string;  //can be changed later
}

module TLP {

  //#define value(x) x::value
  //#define ans(x) x::ans
  #define mix_Int(i) TLP::Int<i>
  lambda<Alias::Int i> struct
  Int {
    static val value = i;
    def ans = Int<i>;
  };
  
  #define mix_add(a, b) TLP::add<a, b>
  lambda<Set a, Set b> struct
  add {
    static val value = a::value + b::value;
    def ans = Int<value>;
  };

  #define mix_Bool(b) TLP::Bool<b>
  lambda<Alias::Bool b> struct
  Bool {
    static val value = b;
    def ans = Bool<b>;
  };

  def True  = Bool<true>;
  def False = Bool<false>;

  struct Nil;
  lambda<Set a, Set b> struct
  Cons {
    def fst = a;
    def snd = b;
    def ans = Cons<a, b>;
  };

  lambda<Set... xs> struct
  List {
    def ans = Nil;
  };

  lambda<Set x, Set... xs> struct
  List<x, xs...> {
    def ans = Cons<x, Set List<xs...>::ans>;
  };
  


}//end module TLP
}//end module Mix



#endif








