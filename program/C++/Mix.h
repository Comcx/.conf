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
#define lambda(...)   mix<__VA_ARGS__> Set
#define function(...) mix<__VA_ARGS__> struct
#define mix_return(...) def ans = __VA_ARGS__
#define mix_print(...) Mix::Print<__VA_ARGS__> token##__LINE__



module Mix {

function(Set T)
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
  
  /*Integers*/
  #define mix_Int(i) TLP::Int<i>
  function(Alias::Int i)
  Int {
    static val value = i;
    mix_return(Int<i>);
  };
  
  #define mix_add(a, b) TLP::add<a, b>
  function(Set a, Set b)
  add {
    static val value = a::value + b::value;
    mix_return(Int<value>);
  };

  /*Booleans*/
  #define mix_Bool(b) TLP::Bool<b>
  function(Alias::Bool b)
  Bool {
    static val value = b;
    mix_return(Bool<b>);
  };

  def True  = Bool<true>;
  def False = Bool<false>;

  struct Nil;
  function(Set a, Set b)
  Cons {
    def fst = a;
    def snd = b;
    mix_return(Cons<a, b>);
  };

  /*Lists*/
  function(Set... xs)
  List {
    mix_return(Nil);
  };

  function(Set x, Set... xs)
  List<x, xs...> {
    mix_return(Cons<x, Set List<xs...>::ans>);
  };

  function(lambda(Set x) f, Set xs)
  map {
    mix_return(Cons<Set f<Set xs::fst>::ans,
	            Set map<f, Set xs::snd>>);
  };
  
  function(lambda(Set x) f)
  map<f, Nil> {
    mix_return(Nil);
  };


}//end module TLP
}//end module Mix



#endif








