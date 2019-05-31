/**
 * #+TITLE:  Mix Library
 * #+AUTHOR: Comcx
 *
 */


#ifndef MIX_H
#define MIX_H

#include <string>



#define var     auto
#define val     const auto
#define mix     template
#define Set     class
#define use     using
#define def     using
#define Type    typename
#define module  namespace
#define typeOf  decltype
#define literal constexpr
#define lambda(...)     mix<__VA_ARGS__> Set
#define fun(...)   mix<__VA_ARGS__> struct
#define mix_return(...) def ans = __VA_ARGS__
#define mix_apply(f, ...) f<__VA_ARGS__>::ans
#define mix_print(...) Mix::Print<__VA_ARGS__> token##__LINE__



module Mix {

function(Set T)
Print {
  const int value = sizeof(T) / 2;
};


module Alias {
  
  def Int    = int;          //unsigned Int is not allowed
  def Unit   = void;
  def Bool   = bool;
  def Char   = char;
  def Float  = float;
  def Double = double;
  def String = std::string;  //can be changed later
}
/*
module TLP {

  //#define value(x) x::value
  //#define ans(x) x::ans
  
  //Integers
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

  //Booleans
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
  cons {
    def fst = a;
    def snd = b;
    mix_return(cons<a, b>);
  };

  //Lists
  function(Set... xs)
  List {
    mix_return(Nil);
  };

  function(Set x, Set... xs)
  List<x, xs...> {
    mix_return(cons<x, mix_apply(Set List, xs...)>);
  };

  function(lambda(Set x) f, Set xs)
  map {
    mix_return
      (cons<mix_apply(Set f, Set xs::fst),
	    mix_apply(Set map, f, Set xs::snd)>);
  };
  
  function(lambda(Set x) f)
  map<f, Nil> {
    mix_return(Nil);
  };

  function(lambda(Set a, Set e) f, Set a, Set xs)
  foldl {
    mix_return
      (mix_apply(Set foldl, f,
		 mix_apply(Set f, a, Set xs::fst), Set xs::snd));
  };
  function(lambda(Set a, Set e) f, Set a)
  foldl<f, a, Nil> {
    mix_return(a);
  };


}//end module TLP
*/
}//end module Mix







//If u don't want these
#ifdef MIX_NO_MACRO

#undef var
#undef val
#undef mix
#undef Set 
#undef use 
#undef def  
#undef Type   
#undef module 
#undef typeOf 
#undef literal
#undef lambda
#undef function


#endif


#endif








